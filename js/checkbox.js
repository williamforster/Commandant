import Map from 'ol/Map.js';
import {Control} from 'ol/control.js';

/**
 * Add a checkbox control that shows/hides layers to the map
 */
export function AddCheckboxControls(map) {
    map.addControl(new HideLayerControl());
}

/**
* @constructor
* @extends {module:ol/control/Control~Control}
* @param {array[string]} arg_layerNames show/hide layers with these names
*/
var HideLayerControl = (function (Control) {
    function HideLayerControl(opt_options) {
        var options = opt_options || {};

        this.checkbox = document.createElement('input');
        this.checkbox.type = 'checkbox';
        this.checkbox.checked = true;

        var element = document.createElement('div');
        element.className = 'hide-layer-container ol-unselectable ol-control';
        var p1 = document.createElement('p');
        p1.innerHTML = "Tracking";
        element.appendChild(p1);
        element.appendChild(this.checkbox);

        Control.call(this, {
        element: element,
        target: options.target
        });

        this.checkbox.addEventListener('change', this.handleStateChanged.bind(this), false);
    }

    if ( Control ) HideLayerControl.__proto__ = Control;
    HideLayerControl.prototype = Object.create( Control && Control.prototype );
    HideLayerControl.prototype.constructor = HideLayerControl;

    HideLayerControl.prototype.handleStateChanged = function handleStateChanged () {
        for (var layer of this.getMap().getLayers().getArray()) {
            var props = layer.getProperties();
            if (props['name'] != undefined && props['name'] === 'tracking') {
                layer.setVisible(this.checkbox.checked);
            }
        }
    };

    return HideLayerControl;
}(Control));