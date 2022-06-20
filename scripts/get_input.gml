if (keyboard_check_pressed(ord('R')))
{
    room_restart();
}

if (keyboard_check_pressed(ord('C')))
{
    //increment_global_color();
    //with (DrawPointsParent) { get_base_points(type); }
}

with (Player_obj)
{
    up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord('W'));
    down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord('S'));
    left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord('A'));
    right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord('D'));
}
