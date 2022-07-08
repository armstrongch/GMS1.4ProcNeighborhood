var window_height = window_get_height();
var scale_ratio = view_hport[0] / window_height;

//port height = 10, window height = 15, scale_ratio = 0.66, port = port / 0.66


view_hport[0] = view_hport[0] / scale_ratio;
view_wport[0] = view_wport[0] / scale_ratio;
