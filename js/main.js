import Map from 'ol/Map.js';
import View from 'ol/View.js';
import { Draw, Modify, Snap } from 'ol/interaction.js';
import {click, pointerMove} from 'ol/events/condition.js';
import Select from 'ol/interaction/Select.js'
import { Tile as TileLayer, Vector as VectorLayer } from 'ol/layer.js';
import { OSM, Vector as VectorSource } from 'ol/source.js';
import { Circle as CircleStyle, Fill, Stroke, Style } from 'ol/style.js';
import Overlay from 'ol/Overlay.js';
var getPoints = require('./get_geodata.js');
var constants = require('./constants.js');
var getGeodata = require('./get_geodata.js');
var processData = require('./process_data.js');
var ui = require('./ui.js');

// Use the OpenStreetMap database
var raster = new TileLayer({
  source: new OSM()
});

/**
 * Create an overlay to anchor the datapoint-popup to the map.
 */
var mapDatapointPopupOverlay = new Overlay({
  element: document.getElementById('map-datapoint-popup'),
  autoPan: false
});

// Create a map portal in the #map div
var map = new Map({
  layers: [raster], //, vector],
  overlays: [mapDatapointPopupOverlay],
  target: 'map',
  view: new View({
    projection: constants.COORDINATE_REFERENCE_SYSTEM,
    center: constants.MAP_START_LOCATION,
    zoom: 17
  }),
});

// map.on('singleclick', function(evt) {
//   alert(evt.coordinate);
// });

var clickSelect = new Select({
  condition: click,
  hitTolerance: 2,
  // Do not select ui layers
  // selectable is not an official property so may not be in all layers
  layers: function(layer) {return layer.getProperties()['selectable'] != false}
});
var hoverSelect = new Select({
  condition: pointerMove,
  hitTolerance: 2,
  // Do not select ui layers
  // selectable is not an official property so may not be in all layers
  layers: function(layer) {return layer.getProperties()['selectable'] != false}
});
hoverSelect.on('select', function(evt){
  console.log("HI");
});

map.addInteraction(clickSelect);
map.addInteraction(hoverSelect);

// Check if mouse is over a dot and show/hide popup depending
map.on('pointermove', function(evt) {
  if (evt.dragging) {
    return;
  }
  ui.updateUi(
    map, 
    mapDatapointPopupOverlay,
    document.getElementById('map-datapoint-popup-content'),
    clickSelect.getFeatures(),
    hoverSelect.getFeatures()
  );
});

// Run an ajax query to get the data points and add them to the map
$(document).ready(function() {
  getPoints().then(function(rows) {
    rows = processData.addColumnsToData(rows);
    console.log(rows);
    ui.panToExtentOfData(map, rows);
    var days = processData.sortDataIntoDays(rows);
    var geojsons = processData.addBucketsToMap(map, days);
  });
})