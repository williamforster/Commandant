import * as constants from "./constants";
// Where to look for geo data
const LOCATION_DATA_URL = "ajax_get_data.php";
const DELETE_DATA_URL = "ajax_delete_data.php";
const GET_RANGE_DATA_URL = "ajax_get_data_range.php";

/**
 * Do an ajax request for some data, and convert it to a 2d array of rows. Return a promise
 * with the rows as parameter.
 */
export function getPoints() {
  return new Promise(function (resolve, reject) {
    get(LOCATION_DATA_URL).then(function (response) {
      var rowsout = parseResponse(response);
      resolve(rowsout);
    });
  });
}

/**
 * Do an ajax request for some data, and convert it to a 2d array of rows. Return a promise
 * with the rows as parameter.
 * @param {Date} time1 must be the earlier time
 * @param {Date} time2 must be the later time
 * @param {float} hdop the max hdop to filter accuracy of the location
 */
export function getPointsRange(time1, time2, hdop = 1.15) {
  return new Promise(function (resolve, reject) {
    ajaxGetDateTimeRange(time1, time2, hdop).then(function (response) {
      var rowsout = parseResponse(response);
      resolve(rowsout);
    });
  });
}

/**
 * Ask the server to 'delete' a range of rows from the data (actually move them to a backup tbl)
 * @param {string} dotEuid mdot eui like 00:80:00:00:ab:cd:ef:00
 * @param {Date} time1 must be an earlier time than time2. Inclusive start point to delete
 * @param {Date} time2 inclusive end point to delete
 */
export function ajaxDeletePoints(dotEuid, time1, time2) {
  return new Promise(function (resolve, reject) {
    $.post(
      DELETE_DATA_URL,
      {
        dot_euid: dotEuid,
        time1: toSqlDateString(time1),
        time2: toSqlDateString(time2)
      },
      function (response) {
        resolve(response);
      }
    );
  });
}

/**
 * Return a promise that resolves with rows of data in between time1 and time2 (UTC)
 * Does not check if times are reversed
 * @param {Date} time1 get data after this
 * @param {Date} time2 get data before this
 * @param {float} hdop the max hdop to filter loc accuracy
 **/
export function ajaxGetDateTimeRange(time1, time2, hdop) {
  console.log("Getting data with hdop < ", hdop);
  return new Promise(function (resolve, reject) {
    $.post(
      GET_RANGE_DATA_URL,
      {
        time1: toSqlDateString(time1),
        time2: toSqlDateString(time2),
        hdop: hdop
      },
      function (response) {
        resolve(response);
      }
    );
  });
}

/**
 * Do an ajax request, returning a promise
 * @param {string} url : the url to request
 */
function get(url) {
  // Return a new promise.
  return new Promise(function (resolve, reject) {
    // Do the usual XHR stuff
    var req = new XMLHttpRequest();
    req.open("GET", url);

    req.onload = function () {
      // This is called even on 404 etc
      // so check the status
      if (req.status == 200) {
        // Resolve the promise with the response text
        resolve(req.response);
      } else {
        // Otherwise reject with the status text
        // which will hopefully be a meaningful error
        reject(Error(req.statusText));
      }
    };

    // Handle network errors
    req.onerror = function () {
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
  rows.sort(function (a, b) {
    return b[sortColumn] - a[sortColumn];
  });
  // Create a dynamic array (empty)
  var buckets = Array.from({ length: numBuckets }, (_, idx) => `${++idx}`);
  for (var bucketNum in buckets) {
    buckets[bucketNum] = [];
  }
  var minDensity = rows[0][sortColumn];
  var maxDensity = rows[rows.length - 1][sortColumn];
  var stepSize = (maxDensity - minDensity) / numBuckets;

  // Put the data into buckets
  for (var row of rows) {
    if (row.length <= sortColumn) {
      console.log("error parsing geodata: " + row);
      return;
    }
    var bucketIndex = Math.floor((row[sortColumn] - minDensity) / stepSize);
    // Don't let bucketIndex be undefined or outside array bounds
    bucketIndex = Math.min(buckets.length - 1, bucketIndex);
    if (bucketIndex == undefined || isNaN(bucketIndex)) {
      bucketIndex = 0;
    }
    buckets[bucketIndex].push(row);
  }
  return buckets;
}

/**
 * Given essentially a csv response of rows, return a 2d array of data as defined in constants
 * @param {string} response the response from an ajax query
 */
function parseResponse(response) {
  var rowsin = response.split("\n");
  var rowsout = [];
  // Remove an empty line at the end
  if (rowsin[rowsin.length - 1].length === 0) {
    rowsin.pop();
  }

  for (var row of rowsin) {
    var parts = row.split(",");
    if (parts.length <= constants.SNR_COL) {
      console.log("Bad data returned from server:" + row);
      continue;
    }
    // convert all numbers to numbers
    parts[constants.DATETIME_COL] = new Date(
      parts[constants.DATETIME_COL].replace(" ", "T") + "Z"
    );
    parts[constants.LONGTITUDE_COL] = parseFloat(
      parts[constants.LONGTITUDE_COL]
    );
    parts[constants.LATITUDE_COL] = parseFloat(parts[constants.LATITUDE_COL]);
    parts[constants.FILL_COL] = parseFloat(parts[constants.FILL_COL]);
    parts[constants.SIGNAL_COL] = parseInt(parts[constants.SIGNAL_COL]);
    parts[constants.SNR_COL] = parseInt(parts[constants.SNR_COL]);
    rowsout.push(parts);
  }
  return rowsout;
}

/**
 * Return a string that mysql will accept
 * @param {Date} datetime
 */
function toSqlDateString(datetime) {
  return datetime
    .toISOString()
    .replace("T", " ")
    .replace("Z", "");
}
