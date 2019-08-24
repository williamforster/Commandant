<?php
    require_once "uq/auth.php";
    auth_require();
    $payload = auth_get_payload();
    
    foreach ($payload['groups'] as $group) {
         echo $group . '<br>\n';
    }
?>
