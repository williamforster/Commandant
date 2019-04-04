<?php
    include 'db_connect.php';
    $DB_TABLE_NAME = 'glutton_reading';
    
    // Get the data from the database
    // $stmt = $db->prepare("SELECT * FROM glutton_reading WHERE id=? AND name=?");
    // $stmt->execute(array($id, $name));
    $stmt = $pdo->prepare(
            'SELECT `dot_euid`,`time`,`longtitude`,`latitude`,`fill`,`signal_strength`' . 
            ' FROM ' . $DB_TABLE_NAME);
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Turn the data into csv
    foreach ($rows as &$row) {
        echo implode(',', $row) . "\n";
    }

    $pdo = null; // disconnect
?>