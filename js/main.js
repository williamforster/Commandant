import {color, asArray} from 'ol/color.js'
import Map from 'ol/Map.js';
import View from 'ol/View.js';
import {click, pointerMove} from 'ol/events/condition.js';
import Select from 'ol/interaction/Select.js'
import { Tile as TileLayer, Vector as VectorLayer } from 'ol/layer.js';
import { OSM, Vector as VectorSource } from 'ol/source.js';
import { Circle as CircleStyle, Fill, Stroke, Style } from 'ol/style.js';
import Overlay from 'ol/Overlay.js';
import ContextMenu from 'ol-contextmenu/dist/ol-contextmenu.js';
import {hsv} from 'color-convert';

import {getPoints} from './get_geodata';
import {addColumnsToData, addJourneysToMap, addMostRecentToMap, sortDataIntoDays} from './process_data';
import {deleteSelected, panToExtentOfData, updateUi} from './ui';
import * as constants from './constants'

/**
 * Do the ajax query and put the data on the map
 * @param {ol/Map} map the map
 * @param {bool} pan whether to pan to the data
 */
export function downloadAndAddDataPoints(map, pan=true) {
  getPoints().then(function(rows) {
    rows = addColumnsToData(rows);
    //console.log(rows);
    if (pan) { panToExtentOfData(map, rows); }
    var days = sortDataIntoDays(rows);
    var geojsons = addJourneysToMap(map, days);
    addMostRecentToMap(map, rows);
  });
}

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

/** Click button selects a point */
var clickSelect = new Select({
  condition: click,
  hitTolerance: 2,
  // Do not select ui layers
  // selectable is not an official property so may not be in all layers
  layers: function(layer) {return layer.getProperties()['selectable'] != false}
});
/** Hovering selects a point  */
var hoverSelect = new Select({
  condition: pointerMove,
  hitTolerance: 2,
  // Do not select ui layers
  // selectable is not an official property so may not be in all layers
  layers: function(layer) {return layer.getProperties()['selectable'] != false}
});
hoverSelect.on('select', function(evt){

});
map.addInteraction(clickSelect);
map.addInteraction(hoverSelect);

/** Right click menu */
var contextmenu = new ContextMenu({
  width: 170,
  defaultItems: true, // defaultItems are (for now) Zoom In/Zoom Out
  items: [
    {
      text: 'Delete',
      classname: 'some-style-class',
      callback: deleteSelected
    },
    '-' // this is a separator
  ]
});
/** Only update selection when right click menu is not open */
contextmenu.on('open', function(evt){
  $.exposed['hoverSelect'].setActive(false);
});
contextmenu.on('close', function(evt){
  $.exposed['hoverSelect'].setActive(true);
});
map.addControl(contextmenu);

// Check if mouse is over a dot and show/hide popup depending
map.on('pointermove', function(evt) {
  if (evt.dragging) {
    return;
  }
  updateUi(
    map, 
    mapDatapointPopupOverlay,
    document.getElementById('map-datapoint-popup-content'),
    clickSelect.getFeatures(),
    hoverSelect.getFeatures()
  );
});

// Run an ajax query to get the data points and add them to the map
$(document).ready(function() {
  // Add hidden class to right click menu, so behaviour is correct
  $(".ol-ctx-menu-container").addClass("ol-ctx-menu-hidden");
  downloadAndAddDataPoints(map);
});


function setAlpha(alpha) {
  map.getLayers().forEach(function(layer) {
    if (layer instanceof VectorLayer) {
      var s = layer.getStyle();
      if (s != undefined) {
        var c = asArray(s.getStroke().getColor());
        s.getStroke().setColor('rgba(' + c[0] + ',' + c[1] + ',' + c[2] + ',' + alpha + ')');
        c = asArray(s.getImage().getFill().getColor());
        s.setImage(new CircleStyle({
          radius: 5,
          fill: new Fill({
            color: 'rgba(' + c[0] + ',' + c[1] + ',' + c[2] + ',' + alpha + ')'
          })
        }));
        c = asArray(s.getFill().getColor());
        s.getFill().setColor('rgba(' + c[0] + ',' + c[1] + ',' + c[2] + ',' + alpha + ')');
      }
    }
  });
}

function setStyle(colorStep, saturation, value, outlinealpha = 1) {
  var max_hue = 360;
  var count = 0;
  var layers = map.getLayers().getArray();
  for (var i = layers.length - 1; i >= 0; i--) {
    var layer = layers[i];
    var c = hsv.rgb((Math.floor(count++ / 2) * colorStep) % max_hue, saturation, value);
    var color = 'rgba(' + c[0] + ',' + c[1] + ',' + c[2] + ',1)';
    if (layer instanceof VectorLayer) {
      layer.setStyle(new Style({
          fill: new Fill({
            color: color
          }),
          stroke: new Stroke({
            color: color,
            width: 8
          }),
          image: new CircleStyle({
            radius: 4,
            fill: new Fill({
              color: 'white'
            }),
            stroke: new Stroke({
              color: 'rgba(0,0,0,' + outlinealpha + ')',
              width: 2
            })
          })
      }));
    }
  }
}

$.exposed = {
  map: map,
  clickSelect: clickSelect,
  hoverSelect: hoverSelect,
  setAlpha: setAlpha,
  setStyle: setStyle
};