import {  Vector as VectorLayer } from 'ol/layer.js';
import {  Vector as VectorSource } from 'ol/source.js';
import { Circle as CircleStyle, Fill, Stroke, Style } from 'ol/style.js';
import GeoJSON from 'ol/format/GeoJSON.js';
var constants = require('./constants.js');

/**
 * An example of a geoJSON trip returned from the ajax query:
 * {
   "type":"FeatureCollection",
   "features":[
      {
         "type":"Feature",
         "geometry":{
            "type":"LineString",
            "coordinates":[
               [153.0116342,-27.4981089],
               [153.0115188,-27.4979116],
               [153.0114000,-27.4977321]
            ]
         }
      },
      {
          "type":"Feature",
          "geometry":{
              "type":"Point",
              "coordinates":[ 153.0116342, -27.4981089],
          },
          "properties":{
              "type":"Point",
              "time":"2019-03-20 06:06:06"
          }
      }
   ]
}
 */

/**
 * Do an ajax request for some geoJSON. Add that geoJSON to the given map.
 * Parameters:
 * map: the openlayers map to add a layer to
 */
module.exports = function addPoints(map) {
    console.log("Starting ajax request");
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            var geojsonObject = JSON.parse(this.responseText);
            var vectorSource = new VectorSource({
                features: (new GeoJSON({
                    'dataProjection': constants.COORDINATE_REFERENCE_SYSTEM,
                    'featureProjection': constants.COORDINATE_REFERENCE_SYSTEM}))
                    .readFeatures(geojsonObject)
            });
            
            var vectorLayer = new VectorLayer({
                source: vectorSource,
                style: new Style({
                    fill: new Fill({
                      color: 'rgba(255, 255, 255, 0.2)'
                    }),
                    stroke: new Stroke({
                      color: '#3333ff',
                      width: 4
                    }),
                    image: new CircleStyle({
                      radius: 6,
                      fill: new Fill({
                        color: '#0000ff'
                      })
                    })
                })
            });
            map.addLayer(vectorLayer);
        } else {
            console.log("AJAX request failed");
        }
    };
    xmlhttp.open("GET", "ajax_get_data.php", true);
    xmlhttp.send();
}