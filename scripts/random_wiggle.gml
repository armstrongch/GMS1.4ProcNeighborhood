//argument0: integer between 0 and 6
with (DrawPointsParent)
{
    var x_coord = floor((x-floor(x/320))/32);
    var y_coord = floor((y-floor(y/320))/32);
    var tile_num = y_coord*10 + x_coord;
    if (type != "player")
    && (abs(x-Camera_obj.x) <= 160)
    && (abs(y-Camera_obj.y) <= 160)
    && (tile_num mod 6 == argument0)
    {
        get_base_points(type);
    }
}
