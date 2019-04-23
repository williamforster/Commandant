import Map from 'ol/Map.js';
import View from 'ol/View.js';
import { Draw, Modify, Snap } from 'ol/interaction.js';
import {click, pointerMove} from 'ol/events/condition.js';
import Select from 'ol/interaction/Select.js'
import { Tile as TileLayer, Vector as VectorLayer } from 'ol/layer.js';
import { OSM, Vector as VectorSource } from 'ol/source.js';
import { Circle as CircleStyle, Fill, Stroke, Style } from 'ol/style.js';
import Overlay from 'ol/Overlay.js';
var getPoints = require('./js/get_geodata.js');
var constants = require('./js/constants.js');
var getGeodata = require('./js/get_geodata.js');
var processData = require('./js/process_data.js');
var ui = require('./js/ui.js');

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
  renderer: 'webgl',
  view: new View({
    projection: constants.COORDINATE_REFERENCE_SYSTEM,
    center: constants.MAP_START_LOCATION,
    zoom: 17
  }),
});

// map.on('singleclick', function(evt) {
//   alert(evt.coordinate);
// });

var clickSelect = new Select({condition: click});
var hoverSelect = new Select({condition: pointerMove});
map.addInteraction(clickSelect);
map.addInteraction(hoverSelect);

// Check if mouse is over a dot and show/hide popup depending
map.on('pointermove', function(evt) {
  if (evt.dragging) {
    return;
  }
  ui.displayFeatureInfo(
    map, 
    mapDatapointPopupOverlay,
    document.getElementById('map-datapoint-popup-content'),
    clickSelect.getFeatures(),
    evt);
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