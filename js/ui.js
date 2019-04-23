import GeoJSON from 'ol/format/GeoJSON.js';
import Select from 'ol/interaction/Select.js';
import VectorLayer from 'ol/layer/Vector.js';
var constants = require('./constants.js');
var processData = require('./process_data.js');

const PADDING = 0.2; // Reduce zoom when panning to data
const MILLISECONDS_PER_MINUTE = 60000;
const dayString = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
const monthString = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
        "Aug", "Sep", "Oct", "Nov", "Dec"];

exports.panToExtentOfData = function(map, rows) {
    var extent = processData.getExtent(rows);
    var center = [(extent[0] + extent[2]) / 2, (extent[1] + extent[3]) / 2];
    var view = map.getView();
    var zoom = -PADDING + view.getZoomForResolution(view.getResolutionForExtent(extent));
    view.animate({zoom: zoom, center: center});
};

/**
 * Show (or hide) a popup with the point info when the pointer moves
 * Parameters:
 * map: The ol map
 * overlay: The ol overlay the popup is on
 * documentElement: The DOM element to change the innerHTML of (write the time there)
 * selected: ol/Collection of selected features
 * event: The pointer move event
 */
exports.displayFeatureInfo = function(map, overlay, documentElement, selected, event) {
    var pixel = map.getEventPixel(event.originalEvent);
    var feature = map.forEachFeatureAtPixel(pixel, function(feature) {
        return feature;
    });

    if (feature && feature.getProperties()['type'] && feature.getProperties()['type']=='Point') {
        overlay.setPosition(feature.getGeometry()['flatCoordinates']);
        var d = feature.getProperties()['time'];
        var timeString = pad(d.getHours(), 2) + ':' + pad(d.getMinutes(), 2) + ':' + pad(d.getSeconds(), 2);
        
        // Work out time diff to selected if they are on same vector layer (same journey)
        if (selected.getLength() > 0 && 
                selected.item(0).getProperties()['time'] !== 'undefined' &&
                inSameLayer(map, selected.item(0), feature)) {
            var old = selected.item(0).getProperties()['time'];
            var minutesDifference = Math.round(0.5 + (d - old) / MILLISECONDS_PER_MINUTE);
            timeString = minutesDifference.toString() + " min<br>" + timeString;
        }
        documentElement.innerHTML = timeString+ '<br>' + dayString[d.getDay()] + " " +
        d.getDate() + " " + monthString[d.getMonth()]
    } else {
        overlay.setPosition(undefined);
    }
}

/**
 * Pad a positive integer with leading zeros.
 * @param {int} number : the number to pad
 * @param {int} length : how long the string should be
 */
function pad(number, length) {
    var s = '00000000000000000000000' + number;
    return s.substring(s.length - length);
}

/**
 * Format a float to the given precision. Better than toFixed().
 * Copyright ArteQ from stackoverflow.
 * @param {float} number : The float to round/format
 * @param {int} precision : Number of digits after the decimal place
 */
function roundFix(number, precision)
{
    var multi = Math.pow(10, precision);
    return Math.round( (number * multi).toFixed(precision + 1) ) / multi;
}

/**
 * Return true if the features are from the same vector layer in the map
 * @param {ol/Map} map : The map object
 * @param {ol/Feature} feature1 
 * @param {ol/Feature} feature2 
 */
function inSameLayer(map, feature1, feature2) {
    for (var layer of map.getLayers().getArray()) {
        if (layer instanceof VectorLayer) {
            var feats = layer.getSource().getFeatures();
            if (feats.includes(feature1) && feats.includes(feature2)) {
                return true;
            }
        }
    }
    return false;
}