if (keyboard_check_pressed(ord('R')))
{
    room_restart();
}

if (keyboard_check_pressed(ord('C')))
{
    increment_global_color();
    with (DrawPointsParent) { get_base_points(type); }
}   
