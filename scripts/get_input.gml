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
    press_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord('W'));
    press_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord('S'));
    press_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord('A'));
    press_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord('D'));
    
    hold_up = keyboard_check(vk_up) || keyboard_check(ord('W'));
    hold_down = keyboard_check(vk_down) || keyboard_check(ord('S'));
    hold_left = keyboard_check(vk_left) || keyboard_check(ord('A'));
    hold_right = keyboard_check(vk_right) || keyboard_check(ord('D'));
    
    move_player();
}
