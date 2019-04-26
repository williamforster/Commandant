import {  Vector as VectorLayer } from 'ol/layer.js';
import {  Vector as VectorSource } from 'ol/source.js';
import { Circle as CircleStyle, Fill, Stroke, Style } from 'ol/style.js';
import GeoJSON from 'ol/format/GeoJSON.js';
import { isArray } from 'util';
import * as constants from './constants'
var colorConvert = require('color-convert');

// Dot and line HSV
const LINE_SATURATION = 40;
const LINE_VALUE = 70;
const ALPHA = 1;
const MAX_HUE = 360;
const HUE_STEP = 212; // Increase hue by this for each new journey
const DOT_SIZE = 4; // px radius
const DOT_OUTLINE_COLOR = 'rgba(0,0,0,0.4)';
const DOT_OUTLINE_WIDTH = 2;
const STROKE_WIDTH = 8;

/**
 * Using the data already in the columns, generate extra data like debris density,
 * previous coord, and next coord. Return a new array.
 * @param {2d array} rows : An array of db rows like in the example at top of this file.
 */
export function addColumnsToData(rows) {
    // sort by time and add the additional columns
    rows.sort(function(a, b) { return a[constants.DATETIME_COL] > b[constants.DATETIME_COL]; });
    // TODO: remove outliers - fit to a linear regression
    if (rows === undefined || !isArray(rows) || rows.length === 0) { return rows; }
    rows[0][constants.DEBRIS_DENSITY_COL] = 0;
    rows[0][constants.PREVIOUS_COORDS] = 
            [rows[0][constants.LONGTITUDE_COL], rows[0][constants.LATITUDE_COL]];
    for (var i = 1; i < rows.length; ++i) {
        var xDistance = 
                rows[i][constants.LONGTITUDE_COL] - rows[i-1][constants.LONGTITUDE_COL];
        var yDistance = 
                rows[i][constants.LATITUDE_COL] - rows[i-1][constants.LATITUDE_COL];
        var distance = Math.sqrt(xDistance * xDistance + yDistance * yDistance);
        rows[i][constants.DEBRIS_DENSITY_COL] = 
                (rows[i][constants.FILL_COL] - rows[i - 1][constants.FILL_COL]) / distance;
        rows[i][constants.PREVIOUS_COORDS] = 
                [rows[i-1][constants.LONGTITUDE_COL], rows[i-1][constants.LATITUDE_COL]];
    }

    // add a next coords column
    for (var i = 0; i < rows.length - 1; ++i) {
        rows[i][constants.NEXT_COORDS] = 
                [rows[i+1][constants.LONGTITUDE_COL], rows[i+1][constants.LATITUDE_COL]];
    }
    rows[rows.length-1][constants.NEXT_COORDS] = [
        rows[rows.length-1][constants.LONGTITUDE_COL], 
        rows[rows.length-1][constants.LATITUDE_COL]];
    return rows;
}

/**
 * Return an array where each element is a day's worth of data (a 2d array).
 * Also distinguish between dot euis
 * @param {2d array} rows : All the data
 */
export function sortDataIntoDays(rows) {
    // Sort by euid then by date
    rows.sort(function(a, b) { 
        if (a[constants.EUID_COL] === b[constants.EUID_COL]) { 
            return a[constants.DATETIME_COL] > b[constants.DATETIME_COL];
        }
        return a[constants.EUID_COL] > b[constants.EUID_COL];
    });
    if (rows.length > 0) {
        var ret = [];
        var lastDate = rows[0][constants.DATETIME_COL];
        var lastEuid = rows[0][constants.EUID_COL];
        var day = []; // Array of this day's rows
        for (var row of rows) {
            var currentDate = row[constants.DATETIME_COL];
            if (row[constants.EUID_COL] === lastEuid &&
                    currentDate.getFullYear() == lastDate.getFullYear() &&
                    currentDate.getMonth() == lastDate.getMonth() &&
                    currentDate.getDate() == lastDate.getDate()) {
                day.push(row);
            } else {
                ret.push(day);
                day = [row];
            }
            lastDate = currentDate;
            lastEuid = row[constants.EUID_COL];
        }
        ret.push(day);
        return ret;
    }
    return [rows];
}

/**
 * Return the coords of the bounding box for these rows as [minLon, minLat, maxLon, maxLat]
 * @param {2d array} rows : the data in an array
 */
export function getExtent(rows) {
    var extent = [Infinity, Infinity, -Infinity, -Infinity];
    if (rows.length > 0) {
        for (var row of rows) {
            if (row.length > constants.LATITUDE_COL - 1) {
                extent[0] = Math.min(extent[0], row[constants.LONGTITUDE_COL]);
                extent[1] = Math.min(extent[1], row[constants.LATITUDE_COL]);
                extent[2] = Math.max(extent[2], row[constants.LONGTITUDE_COL]);
                extent[3] = Math.max(extent[3], row[constants.LATITUDE_COL]);
            }
        }
        return extent;
    }
    return [0, 0, 10, 10];
}
/**
 * Now the data is sorted into different color data points, add them to the map. Return
 * the GeoJSON objects added to the map.
 * @param {ol map} map : The ol map object
 * @param {array} buckets : Array of arrays of row. Row is an array like [euid, time, lon ...]
 */
export function addJourneysToMap(map, buckets) {
    var ret = [];
    // Add lines to map
    for (var i = 0; i < buckets.length; ++i) {
        if (buckets[i].length === 0) { continue; }
        // Make a geoJSON object
        var geojsonObject = {
            type:'FeatureCollection',
            features: []
        }
        geojsonObject['features'].push(getGeoJSONLineString(buckets[i]));
        var c = colorConvert.hsv.rgb((i * HUE_STEP) % MAX_HUE, LINE_SATURATION, LINE_VALUE);
        addGeojsonToMap(map, geojsonObject, 'rgba(' + c[0] + ',' + c[1] + 
                ',' + c[2] + ',' + ALPHA + ')', false   );
        ret.push(geojsonObject);
    //}

    // Add dots to map
    //for (var i = 0; i < buckets.length; ++i) {
        if (buckets[i].length === 0) { continue; }
        // Make a geoJSON object
        var geojsonObject = {
            type:'FeatureCollection',
            features: []
        }
        for (var item of buckets[i]) {
            geojsonObject['features'].push(getGeoJSONPoint(item));
        }
        addGeojsonToMap(map, geojsonObject, 'rgba(0,0,0,1)');
        ret.push(geojsonObject);
    }
    return ret;
}

/**
 * Add a geojson object to map, called by addBucketsToMap()
 * @param {ol map} map : An openlayers map
 * @param {object} geojsonObject : A geojson feature collection
 * @param {string} color : A color like '#0000ff' or 'rgba(0,0,0,0.5)'
 * @param {boolean} selectable : Whether the layer should be selectable
 */
function addGeojsonToMap(map, geojsonObject, color, selectable = true) {
    var vectorSource = new VectorSource({
        features: (new GeoJSON({
            'dataProjection': constants.COORDINATE_REFERENCE_SYSTEM,
            'featureProjection': constants.COORDINATE_REFERENCE_SYSTEM}))
            .readFeatures(geojsonObject)
    });

    var vectorLayer = new VectorLayer({
        source: vectorSource,
        updateWhileAnimating: true,
        updateWhileInteracting: true,
        selectable: selectable,
        style: new Style({
            fill: new Fill({
              color: color
            }),
            stroke: new Stroke({
              color: color,
              width: STROKE_WIDTH
            }),
            image: new CircleStyle({
              radius: DOT_SIZE,
              fill: new Fill({
                color: 'white'
              }),
              stroke: new Stroke({
                  color: DOT_OUTLINE_COLOR,
                  width: DOT_OUTLINE_WIDTH
              })
            })
        })
    });
    map.addLayer(vectorLayer);
}

/**
 * Convert a row of data into geoJSON
 * Parameters:
 * row: An array with information as laid out in the constants at the top of this file
 */
function getGeoJSONPoint(row) {
    if (row && isArray(row) && row.length > constants.NEXT_COORDS)  {
        return {
            type: 'Feature',
            geometry: {
                type: 'Point',
                coordinates: [row[constants.LONGTITUDE_COL], row[constants.LATITUDE_COL]]
            },
            "properties": {
                type: 'Point',
                euid: row[constants.EUID_COL],
                time: row[constants.DATETIME_COL],
                fill: row[constants.FILL_COL],
                debrisDensity: row[constants.DEBRIS_DENSITY_COL]
            }
        };
    } else {
        console.log('Bad row passed to getGeoJSONPoint:');
        console.log(row);
        return;
    }
}

/**
 * Return a geojson feature from several rows of data
 * @param {array} rows : array of data rows like [euid, time, lon ...]
 */
function getGeoJSONLineString(rows) {
    if (rows && isArray(rows) && rows.length > 0 && rows[0].length > constants.NEXT_COORDS)  {
        var ret = {
            type: 'Feature',
            geometry: {
                type: 'LineString',
                coordinates: []
            }
        }
        for (var row of rows) {
            ret['geometry']['coordinates'].push(
                    [row[constants.LONGTITUDE_COL], row[constants.LATITUDE_COL]]);
        }
        return ret;
    } else {
        console.log('Bad row passed to getGeoJSONMultiLineString:');
        console.log(row);
        return;
    }
}
