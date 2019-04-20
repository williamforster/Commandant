<!DOCTYPE html>
<html>
  <head>
    <title>Vehicle Tracker</title>
    <link rel="stylesheet" href="https://openlayers.org/en/v5.3.0/css/ol.css" type="text/css">
    <link rel="stylesheet" href="style/map.css" type="text/css">
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  </head>
  <body>
    <div id="map" class="map"></div>
    <div id="map-datapoint-popup">
      <a href="#" id="map-datapoint-popup-closer"></a>
      <div id="map-datapoint-popup-content"></div>
    </div>
    <script src="./bundle.js"></script>
  </body>
</html>