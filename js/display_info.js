import Map from 'ol/Map.js';
import Overlay from 'ol/Overlay.js';

/**
 * Show (or hide) a popup with the point info when the pointer moves
 * Parameters:
 * map: The ol map
 * overlay: The ol overlay the popup is on
 * documentElement: The DOM element to change the innerHTML of (write the time there)
 * event: The pointer move event
 */
module.exports = function displayFeatureInfo(map, overlay, documentElement, event) {
    var pixel = map.getEventPixel(event.originalEvent);
    var feature = map.forEachFeatureAtPixel(pixel, function(feature) {
        return feature;
    });

    if (feature && feature.getProperties()['type'] && feature.getProperties()['type']=='Point') {
        overlay.setPosition(feature.getGeometry()['flatCoordinates']);
        var d = new Date(feature.getProperties()['time']);
        documentElement.innerHTML = d.getHours() + ':' + d.getMinutes() + ':' +
                d.getSeconds() + '<br>' + d.toDateString();
    } else {
        overlay.setPosition(undefined);
    }
}