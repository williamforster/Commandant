var constants = require('./constants.js');


// Where to look for geo data
const LOCATION_DATA_URL = 'ajax_get_data.php';

/**
 * Do an ajax request for some data, and convert it to a 2d array of rows. Return a promise
 * with the rows as parameter.
 * Parameters:
 * map: the openlayers map to add a layer to
 */
module.exports = function getPoints() {
    return new Promise(function(resolve, reject) {
        get(LOCATION_DATA_URL).then(function(response) {
            var rows = response.split('\n');
            if (rows[rows.length - 1].length === 0) { rows.pop(); }
            for (var rownum in rows) {
                rows[rownum] = rows[rownum].split(',');
                // convert all numbers to numbers
                rows[rownum][constants.DATETIME_COL] = 
                        new Date(rows[rownum][constants.DATETIME_COL].replace(" ", "T") + "Z");
                rows[rownum][constants.LONGTITUDE_COL] = 
                        parseFloat(rows[rownum][constants.LONGTITUDE_COL]);
                rows[rownum][constants.LATITUDE_COL] = 
                        parseFloat(rows[rownum][constants.LATITUDE_COL]);
                rows[rownum][constants.FILL_COL] = 
                        parseFloat(rows[rownum][constants.FILL_COL]);
            }
            resolve(rows);
        });
    });
}

/**
 * Do an ajax request, returning a promise 
 * @param {string} url : the url to request
 */
function get(url) {
    // Return a new promise.
    return new Promise(function(resolve, reject) {
      // Do the usual XHR stuff
      var req = new XMLHttpRequest();
      req.open('GET', url);
  
      req.onload = function() {
        // This is called even on 404 etc
        // so check the status
        if (req.status == 200) {
          // Resolve the promise with the response text
          resolve(req.response);
        }
        else {
          // Otherwise reject with the status text
          // which will hopefully be a meaningful error
          reject(Error(req.statusText));
        }
      };
  
      // Handle network errors
      req.onerror = function() {
        reject(Error("Network Error"));
      };
  
      // Make the request
      req.send();
    });
}
  
/**
 * Return items from param rows but sorted into strata
 * @param {2d array} rows : data from sql database
 * @param {int} sortColumn : column of data to sort with
 * @param {int} numBuckets : number of distinct groups to sort rows into
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

    // Put the data into buckets
    for (var row of rows) {
        if (row.length <= sortColumn) {
            console.log('error parsing geodata: ' + row);
            return;
        }
        var bucketIndex = Math.floor((row[sortColumn] - minDensity) / stepSize);
        // Don't let bucketIndex be undefined or outside array bounds
        bucketIndex = Math.min(buckets.length - 1, bucketIndex);
        if (bucketIndex == undefined || isNaN(bucketIndex)) { bucketIndex = 0; }
        buckets[bucketIndex].push(row);
    }
    return buckets;
}
