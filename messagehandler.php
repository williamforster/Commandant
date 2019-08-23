<?php
    // Message format: "sc/g/0190420060606153.012345,-27.012345,8.5,0.32,-101,-27\n"
    // smartcampus/glutton/sequence_no  yymmddhhMMss  longtitude,latitude,
    // altitude(m above sea),fill%,signal str, signal noise ratio  \n
    //
    // Sequence number is a char starting at '0' specifying the order of the packets
    // A typical reading might be transmitted in 2 packets
    // "sc/g/0190420060606153.012345,-27"
    // "sc/g/1.012345,8.5,0.32,-101,-40\n"
    //       ^sequence number
    // Packets will be transmitted in order, but if an ACK is not received, will be sent again.
    // Datetime is UTC and the database stores it that way.
    
    if (!defined("G_TERMINATOR")) { define("G_TERMINATOR", "\n"); }
    if (!defined("G_SEPARATOR")) { define("G_SEPARATOR", ","); }
    if (!defined("G_MIN_MESSAGE_LENGTH")) {
        define("G_MIN_MESSAGE_LENGTH", strlen("1901010830040,0,5,0,0,0\n"));
    }
    if (!defined("G_MESSAGE_COMMA_COUNT")) { define("G_MESSAGE_COMMA_COUNT", 5); }
    $sequence_ascii = ord(substr($value, 0, 1));

    // Parse and insert assembled data into database.
    // assembled data will not have sequence #s but will have terminating newline
    $parseMessageFunction = function($eui, $assembled) {
        // If the message is too short, has too few commas or no \n, it is wrong.
        if (strlen($assembled) < G_MIN_MESSAGE_LENGTH || 
                count_chars($assembled)[ord(G_SEPARATOR)] < G_MESSAGE_COMMA_COUNT ||
                strpos($assembled, G_TERMINATOR) === FALSE) {
            write2log("Glutton assembled message badly formatted: " . $assembled);
            return;
        }
        $assembled = str_replace(G_TERMINATOR, "", $assembled); // Delete the \n at the end

        // y  y  m  m  d  d  h  h  M  M  s  s
        // 0  1  2  3  4  5  6  7  8  9 10 11
        $year = intval(substr($assembled, 0, 2)) + 2000;
        $month = intval(substr($assembled, 2, 2));
        $day = intval(substr($assembled, 4, 2));
        $hour = intval(substr($assembled, 6, 2));
        $minute = intval(substr($assembled, 8, 2));
        $second = intval(substr($assembled, 10, 2));
        $dtime = sprintf("%04d-%02d-%02d %02d:%02d:%02d", $year, $month, $day,
                $hour, $minute, $second);

        // Parse the remaining values 
        list($longtitude, $latitude, $altitude, $fill, $signal, $snr) = 
                explode(G_SEPARATOR, substr($assembled, 12));
        if (!is_numeric($longtitude) || !is_numeric($latitude) || !is_numeric($altitude) ||
                !is_numeric($fill) || !is_numeric($signal) || !is_numeric($snr)) {
            write2log("Glutton: non-numeric value in message: " . $assembled);
            return;
        }
        
        // Having parsed the message, put it in the readings db table.
        try {
            $stmt = $_SESSION['DBlink']->prepare(
                    'INSERT INTO `glutton_reading` ' .
                    '(`dot_euid`,`time`,`longtitude`,`latitude`,`altitude`,`fill`,`rssi`,`snr`) ' . 
                    'VALUES (:eui, :dtime, :longtitude, :latitude, :altitude, :fill, :signal, :snr);');
            $stmt->execute(array(':eui' => $eui,
                                ':dtime' => $dtime,
                                ':longtitude'  => $longtitude,
                                ':latitude' => $latitude,
                                ':altitude' => $altitude,
                                ':fill' => $fill,
                                ':signal' => $signal,
                                ':snr' => $snr));
            
            write2log('Glutton reading stored: ' . $dtime . ' ' . $longtitude . ' ' . $latitude);
        } catch (PDOException $e) {
            $e->getMessage();
            write2log("DB error - glutton:" . $e);
        }
    };

    // MESSAGE RECEIVE & ASSEMBLE CODE

    include($_SERVER['DOCUMENT_ROOT'] . "/inc/connectDB.php");
    // If this is the first part of the message, clear the entries for this mdot
    if (substr($value,0,1) === "0") {
        try {
            $delete = $_SESSION['DBlink']->prepare('DELETE FROM `glutton_partial_message` ' . 
                    'WHERE `dot_euid`=:eui;');
            $delete->execute(array(':eui' => $eui));
            write2log("Glutton: new series of packets begun. Db cleared.");
        } catch (PDOException $e) {
            $e->getMessage();
            write2log("DB error - glutton:" . $e);
        }
    }

    // Put all transmissions in the db. A duplicate transmission will fail because the entry 
    // won't be unique.
    try {
        $insert = $_SESSION['DBlink']->prepare('INSERT INTO `glutton_partial_message` ' . 
                '(`dot_euid`,`sequence`,`message`) VALUES (:eui, :sequence, :message);');
        $insert->execute(array(':eui' => $eui,
                            ':sequence' => $sequence_ascii, 
                            ':message' => substr($value, 1)));
        write2log('Glutton - inserted partial message to db');

        // If it contains \n, assemble the message
        if (strpos($value, G_TERMINATOR) != FALSE) {
            $retrieve = $_SESSION['DBlink']->prepare('SELECT `message` FROM '. 
                    '`glutton_partial_message`' . 
                    ' WHERE `dot_euid`=:eui ORDER BY `sequence`;');
            $retrieve->execute(array(':eui' => $eui));
            $rows = $retrieve->fetchAll(PDO::FETCH_ASSOC);
            $message = "";
            foreach ($rows as $row) {
                $message = $message . $row['message'];
            }
            $parseMessageFunction($eui, $message);
        }
    } catch (PDOException $e) {
        write2log("Glutton: DB error on insert. Probably a dropped ACK caused dup packet.");
    }
    include($_SERVER['DOCUMENT_ROOT'] . "/inc/disconnectDB.php");
?>