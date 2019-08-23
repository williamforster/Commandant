<?php
    include 'db_connect.php';
    include_once 'constants.php';
    
    if (!isset($_POST['time1']) || !isset($_POST['time2'])) {
        echo "time1 and time2 post variables must be set";
    } else {
        // Get the data from the database
        $stmt = $pdo->prepare(
            'SELECT ' . $COLUMN_NAMES .
            ' FROM ' . $DB_TABLE_NAME . ' WHERE `time` >= ' .
            $_POST['time1'] . ' AND `time` <= ' . $_POST['time2'] . 
            ' ORDER BY `time` DESC LIMIT 5000');
        $stmt->execute();
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Turn the data into csv
        foreach ($rows as &$row) {
            echo implode(',', $row) . "\n";
        }

        $stmt->closeCursor();
        $pdo = null; // disconnect
    }
?>