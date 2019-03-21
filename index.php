<!DOCTYPE html>
<html>
  <head>
    <title>Draw and Modify Features</title>
    <link rel="stylesheet" href="https://openlayers.org/en/v5.3.0/css/ol.css" type="text/css">
    <link rel="stylesheet" href="style/map.css" type="text/css">
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  </head>
  <body>
    <p> <?php echo "hello world" ?>
    <div id="map" class="map"></div>
    <form class="form-inline">
      <label>Geometry type &nbsp;</label>
      <select id="type">
        <option value="Point">Point</option>
        <option value="LineString">LineString</option>
        <option value="Polygon">Polygon</option>
        <option value="Circle">Circle</option>
      </select>
    </form>
    <script src="./bundle.js"></script>
    <!-- <script src="js/get_geodata.js"></script> -->
  </body>
</html>