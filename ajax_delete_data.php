<?php
    require_once "uq/auth.php";
    auth_require();

    include 'db_connect.php';
    include_once 'constants.php';

    if (array_key_exists('dot_euid', $_POST) && array_key_exists('time1', $_POST) &&
            array_key_exists('time2', $_POST)) {
        
        // Setup the sql queries
        $whereClause = 'WHERE `dot_euid`="' . $_POST['dot_euid'] .
                '" AND `time`>="' . $_POST['time1'] . '" AND `time`<="' . $_POST['time2'] . '"';
        $copyData = 'INSERT INTO ' . $DB_DELETED_BACKUP_NAME . ' SELECT * FROM ' . $DB_TABLE_NAME .
                ' ' . $whereClause . ';';
        $deleteData = 'DELETE FROM ' . $DB_TABLE_NAME . ' ' . $whereClause . ';';

        // Start transaction
        $pdo->exec('START TRANSACTION;');
        // Move the data from data table to deleted table
        $stmt2 = $pdo->prepare($copyData);
        $stmt2->execute();
        $stmt2->closeCursor();
        // Delete the data
        $stmt3 = $pdo->prepare($deleteData);
        $stmt3->execute();
        $stmt3->closeCursor();
        // Commit
        $pdo->exec('COMMIT;');

        $pdo = null; // disconnect
        echo 'Success deleting rows';
    } else {
        echo 'Post variables incorrect while deleting data';
    }
?>
