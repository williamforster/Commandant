import * as constants from "./constants";

export function updateRangeSliderRange(rows) {
    $("#slider").dateRangeSlider(
    "option",
    { 
        bounds: {
        min: new Date(2012, 0, 1),
        max: new Date(2012, 11, 31)  
        }
    }
    );
}