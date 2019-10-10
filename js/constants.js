export const COORDINATE_REFERENCE_SYSTEM = "EPSG:4326";
export const MAP_START_LOCATION = [153.01151, -27.49753];
// What columns will be returned, in csv format, eg.
// 00:80:00:00:de:ad:be:ef,2019-03-30 06:06:06,153.1111,-27.49555,0.1,-50
export const EUID_COL = 0;
export const DATETIME_COL = 1;
export const LONGTITUDE_COL = 2;
export const LATITUDE_COL = 3;
export const ALTITUDE_COL = 4;
export const FILL_COL = 5;
export const SIGNAL_COL = 6;
export const SNR_COL = 7;
export const SATELLITES_COL = 8;
export const HDOP_COL = 9;
// columns that will be added after
// How much bin is filled in that particular area. Density = (this fill - last fill)/distance
export const DEBRIS_DENSITY_COL = 10;
export const PREVIOUS_COORDS = 11;
export const NEXT_COORDS = 12;

export const RANGE_SLIDER_ID = "#date-slider";
export const HDOP_SLIDER_ID = "#hdop-slider"
