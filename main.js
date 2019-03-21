import Map from 'ol/Map.js';
import View from 'ol/View.js';
import { Draw, Modify, Snap } from 'ol/interaction.js';
import { Tile as TileLayer, Vector as VectorLayer } from 'ol/layer.js';
import { OSM, Vector as VectorSource } from 'ol/source.js';
import { Circle as CircleStyle, Fill, Stroke, Style } from 'ol/style.js';
import { toLonLat, fromLonLat } from 'ol/proj.js';
import Overlay from 'ol/Overlay.js';
var addPoints = require('./js/get_geodata.js');
var displayFeatureInfo = require('./js/display_info.js')
var constants = require('./js/constants.js');

// Use the OpenStreetMap database
var raster = new TileLayer({
  source: new OSM()
});

/**
 * Create an overlay to anchor the datapoint-popup to the map.
 */
var mapDatapointPopupOverlay = new Overlay({
  element: document.getElementById('map-datapoint-popup'),
  autoPan: true,
  autoPanAnimation: {
    duration: 250
  }
});

/*// Make a new layer for drawings of stuff
var source = new VectorSource();
var vector = new VectorLayer({
  source: source,
  style: new Style({
    fill: new Fill({
      color: 'rgba(255, 255, 255, 0.2)'
    }),
    stroke: new Stroke({
      color: '#0000ff',
      width: 4
    }),
    image: new CircleStyle({
      radius: 5,
      fill: new Fill({
        color: '#ffcc33'
      })
    })
  })
});*/

// Create a map portal in the #map div
var map = new Map({
  layers: [raster], //, vector],
  overlays: [mapDatapointPopupOverlay],
  target: 'map',
  view: new View({
    projection: constants.COORDINATE_REFERENCE_SYSTEM,
    center: [153.01151, -27.49753],
    zoom: 17
  }),
});

//var modify = new Modify({ source: source });
//map.addInteraction(modify);

//var draw, snap; // global so we can remove them later
//var typeSelect = document.getElementById('type');

/*function addInteractions() {
  draw = new Draw({
    source: source,
    type: typeSelect.value
  });
  map.addInteraction(draw);
  snap = new Snap({ source: source });
  map.addInteraction(snap);
}*/

/**
 * Handle change event.
 */
/*typeSelect.onchange = function () {
  map.removeInteraction(draw);
  map.removeInteraction(snap);
  addInteractions();
};

addInteractions();*/

// map.on('singleclick', function(evt) {
//   alert(evt.coordinate);
// });

map.on('pointermove', function(evt) {
  if (evt.dragging) {
    return;
  }
  displayFeatureInfo(
    map, 
    mapDatapointPopupOverlay,
    document.getElementById('map-datapoint-popup-content'),
    evt);
});

$(document).ready(function() {
  addPoints(map);
})