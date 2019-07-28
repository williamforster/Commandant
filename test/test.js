import Feature from 'ol/Feature';
import Point from 'ol/geom/Point';
import * as ui from '../js/ui.js';

var featureProps = {
    geometry: new Point([0, 0]),
    labelPoint: new Point([0, 0]),
    name: 'My Point'
  };

var featArray = [new Feature(featureProps), new Feature(featureProps), new Feature(featureProps), new Feature(featureProps)];
featArray[0].setProperties({time: new Date('2019-01-01 09:30:15')});
featArray[1].setProperties({time: new Date('2019-01-01 09:30:10')});
featArray[2].setProperties({time: new Date('2019-01-01 09:30:05')});
featArray[3].setProperties({time: new Date('2019-01-01 09:30:00')});

QUnit.test( "ui.getFeaturesBetweenPoints", function( assert ) {
    var ans = ui.getFeaturesBetweenPoints(featArray, featArray[1], featArray[3]);
    assert.ok( ans.length === 3, "Passed!" );
    assert.ok(ans[0] === featArray[1]);
    assert.ok(ans[1] === featArray[2]);
    assert.ok(ans[2] === featArray[3]);
});