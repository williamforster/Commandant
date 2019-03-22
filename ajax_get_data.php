<?php
    include 'db_connect.php';
    $DB_TABLE_NAME = 'glutton_reading';
    
    // Get the data from the database
    // $stmt = $db->prepare("SELECT * FROM glutton_reading WHERE id=? AND name=?");
    // $stmt->execute(array($id, $name));
    $stmt = $pdo->prepare('SELECT * FROM ' . $DB_TABLE_NAME);
    $stmt->execute();
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    foreach ($rows as &$row) {
        echo implode(',', $row) . "\n";
    }
    
    /*$geojson = (object) array(
        'type' => 'FeatureCollection',
        'features' => array()
    );

    // Add a linestring that connects the dots
    // Make an array of coords like [[153.011, -27.699], [153.012, -27.700]]
    $lineString = array();
    foreach ($rows as &$row) {
        array_push($lineString, array($row['longtitude'], $row['latitude']));
    }
    // Add the linestring above to the features in this geojson object
    array_push($geojson->features,
        (object) array(
            'type' => 'Feature',
            'geometry' => (object)array(
                'type' => 'LineString',
                'coordinates' => $lineString
            )
        )
    );

    // Add a dot for each point
    foreach ($rows as &$row) {
        array_push($geojson->features, (object) array(
            'type' => 'Feature',
            'geometry' => (object)array(
                'type' => 'Point',
                'coordinates' => array($row['longtitude'], $row['latitude'])
            ),
            'properties' => (object) array(
                'type' => 'Point',
                'time' => $row['time']
            ),
        ));
    }
    echo json_encode($geojson); */

    $pdo = null; // disconnect
?>