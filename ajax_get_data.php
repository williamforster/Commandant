<?php
    require_once "uq/auth.php";
    auth_require();

    include 'db_connect.php';
    include_once 'constants.php';
    
    // Get the data from the database
    $stmt = $pdo->prepare(
            'SELECT ' . $COLUMN_NAMES .
            ' FROM ' . $DB_TABLE_NAME . ' ORDER BY `time` DESC LIMIT 5000');
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    // Turn the data into csv
    foreach ($rows as &$row) {
        echo implode(',', $row) . "\n";
    }

    $stmt->closeCursor();
    $pdo = null; // disconnect
?>
