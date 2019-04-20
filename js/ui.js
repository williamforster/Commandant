var constants = require('./constants.js');
var processData = require('./process_data.js');

const PADDING = 0.2; // Reduce zoom when panning to data

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
 * event: The pointer move event
 */
exports.displayFeatureInfo = function(map, overlay, documentElement, event) {
    var pixel = map.getEventPixel(event.originalEvent);
    var feature = map.forEachFeatureAtPixel(pixel, function(feature) {
        return feature;
    });

    if (feature && feature.getProperties()['type'] && feature.getProperties()['type']=='Point') {
        overlay.setPosition(feature.getGeometry()['flatCoordinates']);
        var d = new Date(feature.getProperties()['time']);
        var timeString = pad(d.getHours(), 2) + ':' + pad(d.getMinutes(), 2) + ':' + pad(d.getSeconds(), 2);
        documentElement.innerHTML = timeString+ '<br>' + d.toDateString();
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