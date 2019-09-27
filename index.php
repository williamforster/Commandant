<?php
    require_once "uq/auth.php";
    auth_require();
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8'>
    <title>Vehicle Tracker</title>
    <link rel="stylesheet" href="https://openlayers.org/en/v5.3.0/css/ol.css" type="text/css">
    <link rel="stylesheet" href="style/main.css" type="text/css">
    <link rel="stylesheet" href="style/map.css" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/ol-contextmenu@latest/dist/ol-contextmenu.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style/jquery-ui.css">
    <link rel="stylesheet" href="style/iThing-min.css">
  </head>
  <body>
    <div id="topbar">
      <a id="logout-button" href="https://api.uqcloud.net/logout/">
           <img src="img/user-icon.png" alt="logout icon"/>logout</a>
    </div><!--topbar-->
    <div id="map" class="map"></div>
    <div id="map-datapoint-popup">
      <div id="map-datapoint-popup-content"></div>
    </div>
    <div id="date-slider"></div>
    <div id="hdop-slider"></div>
    <div id="hdop-display">HDOP=1.15</div>
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jQDateRangeSlider-withRuler-min.js"></script>
    <script src="./bundle.js"></script>
  </body>
</html>
