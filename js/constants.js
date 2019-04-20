exports.COORDINATE_REFERENCE_SYSTEM = 'EPSG:4326';
exports.MAP_START_LOCATION = [153.01151, -27.49753];
// What columns will be returned, in csv format, eg.
// 00:80:00:00:de:ad:be:ef,2019-03-30 06:06:06,153.1111,-27.49555,0.1,-50
exports.EUID_COL = 0;
exports.DATETIME_COL = 1;
exports.LONGTITUDE_COL = 2;
exports.LATITUDE_COL = 3;
exports.FILL_COL = 4;
exports.SIGNAL_COL = 5;
// columns that will be added after
// How much bin is filled in that particular area. Density = (this fill - last fill)/distance
exports.DEBRIS_DENSITY_COL = 6;
exports.PREVIOUS_COORDS = 7;
exports.NEXT_COORDS = 8;
