import {  Vector as VectorLayer } from 'ol/layer.js';
import {  Vector as VectorSource } from 'ol/source.js';
import { Circle as CircleStyle, Fill, Stroke, Style } from 'ol/style.js';
import GeoJSON from 'ol/format/GeoJSON.js';
import { isArray } from 'util';
import { stringify } from 'querystring';
var constants = require('./constants.js');

// Where to look for geo data
const LOCATION_DATA_URL = 'ajax_get_data.php';
// What columns will be returned, in csv format, eg.
// 00:80:00:00:de:ad:be:ef,2019-03-30 06:06:06,153.1111,-27.49555,0.1,-50
const EUID_COL = 0;
const DATETIME_COL = 1;
const LONGTITUDE_COL = 2;
const LATITUDE_COL = 3;
const FILL_COL = 4;
const SIGNAL_COL = 5;
// columns that will be added after
// How much bin is filled in that particular area. Density = (this fill - last fill)/distance
const DEBRIS_DENSITY_COL = 6;
const PREVIOUS_COORDS = 7;
const NEXT_COORDS = 8;

// As each color requires its own vector layer, data points must be grouped by color,
// not sequentially. This is the number of shades used to communicate volume of debris
const NUM_DOT_COLORS = 10;

/**
 * An example of geoJSON returned from the ajax query. Note the custom properties like 'time'
 * {
 *  "type":"FeatureCollection",
 *  "features":[
 *     {
 *        "type":"Feature",
 *        "geometry":{
 *           "type":"LineString",
 *           "coordinates":[
 *              [153.0116342,-27.4981089],
 *              [153.0115188,-27.4979116],
 *              [153.0114000,-27.4977321]
 *           ]
 *        }
 *     }
 *  ]
 *}
 */

/**
 * Do an ajax request for some data. Convert to geojson and add that geoJSON to the given map.
 * Parameters:
 * map: the openlayers map to add a layer to
 */
module.exports = function addPoints(map) {
    console.log("Starting ajax request");
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            // Put the data into a 2d array
            var rows = this.responseText.split('\n');
            if (rows[rows.length - 1].length === 0) { rows.pop(); }
            for (var rownum in rows) {
                rows[rownum] = rows[rownum].split(',');
                // convert all numbers to numbers
                rows[rownum][DATETIME_COL] = Date(rows[rownum][DATETIME_COL]);
                rows[rownum][LONGTITUDE_COL] = parseFloat(rows[rownum][LONGTITUDE_COL]);
                rows[rownum][LATITUDE_COL] = parseFloat(rows[rownum][LATITUDE_COL]);
                rows[rownum][FILL_COL] = parseFloat(rows[rownum][FILL_COL]);
            }

            if (this.responseText.length === 0 || rows[0].length < 1) {
                console.log('Empty or bad response from server asking for geodata');
                return;
            }

            // Add debris density, prev coord, next coord and others
            addColumnsToData(rows);

            var buckets = sortDataIntoBuckets(rows, DEBRIS_DENSITY_COL, NUM_DOT_COLORS);

            addBucketsToMap(map, buckets);
        } else {
            console.log("AJAX request returned code " + this.status);
        }
    };
    xmlhttp.open("GET", LOCATION_DATA_URL, true);
    xmlhttp.send();
}

/**
 * Using the data already in the columns, generate extra data like debris density,
 * previous coord, and next coord.
 * @param {2d array} rows : An array of db rows like in the example at top of this file.
 */
function addColumnsToData(rows) {
    // sort by time and add the additional columns
    rows.sort(function(a, b) { return a[DATETIME_COL] > b[DATETIME_COL]; });
    // TODO: remove outliers - fit to a linear regression
    rows[0][DEBRIS_DENSITY_COL] = 0;
    rows[0][PREVIOUS_COORDS] = [rows[0][LONGTITUDE_COL], rows[0][LATITUDE_COL]];
    for (var i = 1; i < rows.length; ++i) {
        var xDistance = rows[i][LONGTITUDE_COL] - rows[i-1][LONGTITUDE_COL];
        var yDistance = rows[i][LATITUDE_COL] - rows[i-1][LATITUDE_COL];
        var distance = Math.sqrt(xDistance * xDistance + yDistance * yDistance);
        rows[i][DEBRIS_DENSITY_COL] = (rows[i][FILL_COL] - rows[i - 1][FILL_COL]) / distance;
        rows[i][PREVIOUS_COORDS] = [rows[i-1][LONGTITUDE_COL], rows[i-1][LATITUDE_COL]];
    }

    // add a next coords column
    for (var i = 0; i < rows.length - 1; ++i) {
        rows[i][NEXT_COORDS] = [rows[i+1][LONGTITUDE_COL], rows[i+1][LATITUDE_COL]];
    }
    rows[rows.length-1][NEXT_COORDS] = [
        rows[rows.length-1][LONGTITUDE_COL], 
        rows[rows.length-1][LATITUDE_COL]];
}

/**
 * Convert a row of data into geoJSON
 * Parameters:
 * row: An array with information as laid out in the constants at the top of this file
 */
function getGeoJSONPoint(row) {
    if (row && isArray(row) && row.length > NEXT_COORDS)  {
        return {
            type: 'Feature',
            geometry: {
                type: 'Point',
                coordinates: [row[LONGTITUDE_COL], row[LATITUDE_COL]]
            },
            "properties": {
                type: 'Point',
                euid: row[EUID_COL],
                time: row[DATETIME_COL],
                fill: row[FILL_COL],
                debrisDensity: row[DEBRIS_DENSITY_COL]
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
function getGeoJSONMultiLineString(rows) {
    if (rows && isArray(rows) && rows.length > 0 && rows[0].length > NEXT_COORDS)  {
        var ret = {
            type: 'Feature',
            geometry: {
                type: 'MultiLineString',
                coordinates: []
            }
        }
        for (var row of rows) {
            ret['geometry']['coordinates'].push([
                row[PREVIOUS_COORDS], [row[LONGTITUDE_COL], row[LATITUDE_COL]]
            ]);
        }
        return ret;
    } else {
        console.log('Bad row passed to getGeoJSONMultiLineString:');
        console.log(row);
        return;
    }
}

/**
 * Return items from 'rows' sorted into groups
 * @param {2d array} rows : data from sql database
 * @param {int} sortColumn : column to 
 * @param {*} numBuckets : number of distinct groups to sort rows into
 */
function sortDataIntoBuckets(rows, sortColumn, numBuckets) {
    // Now sort by debris density and divide into 'buckets'
    rows.sort(function(a, b) { return a[sortColumn] > b[sortColumn]; });
    // Create a dynamic array (empty)
    var buckets = Array.from({ length: numBuckets }, (_, idx) => `${++idx}`)
    for (var bucketNum in buckets) { buckets[bucketNum] = []; }
    var minDensity = rows[0][sortColumn];
    var maxDensity = rows[rows.length - 1][sortColumn];
    var stepSize = (maxDensity - minDensity) / numBuckets;
    for (var row of rows) {
        if (row.length <= sortColumn) {
            console.log('error parsing geodata: ' + row);
            return;
        }
        var bucketNum = Math.floor((row[sortColumn] - minDensity) / stepSize);
        bucketNum = Math.min(buckets.length - 1, bucketNum); // Don't let index be undefined
        buckets[bucketNum].push(row);
    }
    return buckets;
}

/**
 * Now the data is sorted into different color data points, add them to the map
 * @param {ol map} map : The ol map object
 * @param {array} buckets : Array of arrays of row. Row is an array like [euid, time, lon ...]
 */
function addBucketsToMap(map, buckets) {
    var colorStep = 255 / buckets.length; // Divide colors into equidistant shades
    // Add lines to map
    for (var i = 0; i < buckets.length; ++i) {
        if (buckets[i].length === 0) { continue; }
        // Make a geoJSON object
        var geojsonObject = {
            type:'FeatureCollection',
            features: []
        }
        geojsonObject['features'].push(getGeoJSONMultiLineString(buckets[i]));
        var c = Math.floor(i * colorStep);
        addGeojsonToMap(map, geojsonObject, 'rgba(' + c + ',16,16,0.9)');
    }

    // Add dots to map
    for (var i = 0; i < buckets.length; ++i) {
        if (buckets[i].length === 0) { continue; }
        // Make a geoJSON object
        var geojsonObject = {
            type:'FeatureCollection',
            features: []
        }
        
        for (var item of buckets[i]) {
            // Add features to it
            geojsonObject['features'].push(getGeoJSONPoint(item));
        }
        var c = Math.floor(i * colorStep);
        addGeojsonToMap(map, geojsonObject, 'rgba(' + c + ',16,16,0.9)');
    }
}

/**
 * Add a geojson object to map, called by addBucketsToMap()
 * @param {ol map} map : An openlayers map
 * @param {object} geojsonObject : A geojson feature collection
 * @param {string} color : A color like '#0000ff' or 'rgba(0,0,0,0.5)'
 */
function addGeojsonToMap(map, geojsonObject, color) {
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
              color: color
            }),
            stroke: new Stroke({
              color: color,
              width: 4
            }),
            image: new CircleStyle({
              radius: 6,
              fill: new Fill({
                color: color
              })
            })
        })
    });
    map.addLayer(vectorLayer);
}