<?php
    include 'db_connect.php';
    include_once 'constants.php';
    
    if (array_key_exists('time1', $_POST) && array_key_exists('time2', $_POST)) {
        // Get the data from the database
        $stmt = $pdo->prepare(
            'SELECT ' . $COLUMN_NAMES .
            ' FROM ' . $DB_TABLE_NAME . ' WHERE `time` >= "' .
            $_POST['time1'] . '" AND `time` <= "' . $_POST['time2'] .
            '" AND `hdop` <=' . $_POST['hdop'] .
            ' ORDER BY `time` DESC LIMIT 5000');
        $stmt->execute();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Turn the data into csv
        foreach ($rows as &$row) {
            echo implode(',', $row) . "\n";
        }

        $stmt->closeCursor();
        $pdo = null; // disconnect
    } else {
        echo "time1, time2 and hdop post variables must be set";
    }
?>