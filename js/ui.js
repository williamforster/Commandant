import Feature from 'ol/Feature.js'
import Map from 'ol/Map.js'
import GeoJSON from 'ol/format/GeoJSON.js';
import LineString from 'ol/geom/LineString.js';
import Select from 'ol/interaction/Select.js';
import VectorLayer from 'ol/layer/Vector.js';
import { Layer } from 'ol/layer';
import { Style, Stroke } from 'ol/style';
import VectorSource from 'ol/source/Vector';
import {getExtent, sortDatetime} from './process_data';

// The name that identifies the vector layer showing a path between 2 selected points
const PATH_LAYER_NAME = 'showPathLayer';
const PADDING = 0.2; // Reduce zoom when panning to data
const MILLISECONDS_PER_MINUTE = 60000;
const dayString = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
const monthString = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
        "Aug", "Sep", "Oct", "Nov", "Dec"];

export function panToExtentOfData(map, rows) {
    var extent = getExtent(rows);
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
 * @param {Collection} clickSelected: ol/Collection of selected features (from click not hover)
 * @param {Collection} hoverSelected: ol/Collection of selected features
 */
export function updateUi(map, overlay, documentElement, clickSelected, hoverSelected) {
    var feature = hoverSelected.item(0);

    updateShownPathLayer(map, feature, clickSelected.item(0));

    if (feature && feature.getProperties()['type'] && feature.getProperties()['type']=='Point') {
        overlay.setPosition(feature.getGeometry()['flatCoordinates']);
        var d = feature.getProperties()['time'];
        var timeString = pad(d.getHours(), 2) + ':' + pad(d.getMinutes(), 2) + ':' + pad(d.getSeconds(), 2);
        
        // Work out time diff to selected if they are on same vector layer (same journey)
        if (clickSelected.getLength() > 0 && 
                clickSelected.item(0).getProperties()['time'] !== 'undefined' &&
                inSameLayer(map, clickSelected.item(0), feature)) {
            var old = clickSelected.item(0).getProperties()['time'];
            var minutesDifference = Math.round(0.5 + Math.abs((d - old) / MILLISECONDS_PER_MINUTE));
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

/**
 * Update the vector layer showing the path between two points that are on the same journey
 * @param {Map} map 
 * @param {Feature} feature1 the first selected feature
 * @param {Feature} feature2 the hovered over feature
 */
function updateShownPathLayer(map, feature1, feature2) {
    if (feature1 === updateShownPathLayer.feat1 && feature2 === updateShownPathLayer.feat2) {
        return;
    }

    var shownPathLayer = map.getLayers().get(PATH_LAYER_NAME);
    if (shownPathLayer === undefined) {
        shownPathLayer = initializeShowPathLayer(map);
    }

    var vecSource = shownPathLayer.getSource();
    vecSource.clear();
    if (feature1 != undefined && feature2 != undefined && inSameLayer(map, feature1, feature2)) {
        var journeySource = getVectorSourceOfFeature(map, feature1);
        if (journeySource != undefined) {
            var lineString = getPathBetweenPoints(journeySource.getFeatures(), feature1, feature2);
            if (lineString != undefined) { vecSource.addFeature(lineString); }
        }
    }

    updateShownPathLayer.feat1 = feature1; // Save the features so we only update when necessary
    updateShownPathLayer.feat2 = feature2;
}

/**
 * Add a new vector layer to map (for showing path between selected points)
 * and return that layer.
 * @param {Map} map 
 */
function initializeShowPathLayer(map) {
    var shownPathLayer = new VectorLayer({
        style: new Style({
            stroke: new Stroke({
                color: 'rgba(255,255,0,1.0)',
                width: 6
            })
        }),
        source: new VectorSource({
            features: []
        }),
        updateWhileAnimating: true,
        updateWhileInteracting: true,
        selectable: false
    });
    map.addLayer(shownPathLayer);
    map.getLayers().set(PATH_LAYER_NAME, shownPathLayer);
    return shownPathLayer;
}

/**
 * Given a journey and 2 features, get only the path between the features.
 * @param {array(Feature)} features array of features with time property
 * @param {ol/Feature} feature1 a feature, could be before, after or equal to feature2
 * @param {ol/Feature} feature2 another feature
 * @return {Feature} a linestring feature
 */
function getPathBetweenPoints(features, feature1, feature2) {
    if (feature1 === feature2) { return; }

    // Get just the features between 1 and 2 in order
    var includedCoords = [];
    features.sort(function(a, b) {
        return sortDatetime(a.getProperties()['time'], b.getProperties()['time']);
    });
    var found = false;
    for (var f of features) {
        if (!found) {
            if (f === feature1 || f === feature2) { 
                found = true;
                var coords = f.getGeometry().getCoordinates();
                if (coords === undefined) { 
                    console.log("Non-point feature trying to show path through points");
                }
                includedCoords.push(coords);
            }
        } else {
            var coords = f.getGeometry().getCoordinates();
            if (coords === undefined) { 
                console.log("Non-point feature trying to show path through points");
            }
            includedCoords.push(coords);
            if (f === feature1 || f === feature2) { break; }
        }
    }

    return new Feature({
        geometry: new LineString(includedCoords),
    });
}

/**
 * @return The VectorSource that contains feature in param (or 'undefined')
 * @param {Map} map The map object
 * @param {Feature} feature A feature
 */
function getVectorSourceOfFeature(map, feature) {
    for (var layer of map.getLayers().getArray()) {
        if (layer.getSource().getFeatures && layer.getSource().getFeatures().includes(feature)) {
            return layer.getSource();
        }
    }
    return undefined;
}