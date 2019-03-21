<?php
    include 'credentials.php';

    $pdo = null;

    $options = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];
    $dsn = "mysql:host=$dbHost;dbname=$dbName;charset=$dbCharset";
    try {
        global $pdo;
        $pdo = new PDO($dsn, $dbUsername, $dbPassword, $options);
    } catch (\PDOException $e) {
         throw new \PDOException($e->getMessage(), (int)$e->getCode());
    }
?>