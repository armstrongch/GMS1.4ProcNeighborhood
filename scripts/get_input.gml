if (keyboard_check_pressed(ord('R')))
{
    room_restart();
}

if (keyboard_check_pressed(ord('C')))
{
    with (Config_obj) { auto_wiggle = !auto_wiggle; }
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
    
    if !(press_up || press_down || press_left || press_right || hold_up || hold_down || hold_left || hold_right)
    && (point_distance(Control_obj.dpad_x, Control_obj.dpad_y, mouse_x, mouse_y) <= Control_obj.dpad_rad)
    {
        var mouse_dir = point_direction(Control_obj.dpad_x, Control_obj.dpad_y, mouse_x, mouse_y);
        
        
        mouse_up = (abs(angle_difference(mouse_dir, 90)) <= 45*1.5);
        mouse_down = (abs(angle_difference(mouse_dir, 270)) <= 45*1.5);
        mouse_left = (abs(angle_difference(mouse_dir, 180)) <= 45*1.5);
        mouse_right = (abs(angle_difference(mouse_dir, 0)) <= 45*1.5);
        
        press_up = mouse_up && (mouse_check_button_pressed(mb_left));
        press_down = mouse_down && (mouse_check_button_pressed(mb_left));
        press_left = mouse_left && (mouse_check_button_pressed(mb_left));
        press_right = mouse_right && (mouse_check_button_pressed(mb_left));
        
        hold_up = mouse_up && (mouse_check_button(mb_left));
        hold_down = mouse_down && (mouse_check_button(mb_left));
        hold_left = mouse_left && (mouse_check_button(mb_left));
        hold_right = mouse_right && (mouse_check_button(mb_left));
    }
    
    move_player();
    
    if (hold_up) { Control_obj.thumbstick_ymod = -1; }
    else if (hold_down) { Control_obj.thumbstick_ymod = 1; }
    else { Control_obj.thumbstick_ymod = 0; }
    
    if (hold_left) { Control_obj.thumbstick_xmod = -1; }
    else if (hold_right) { Control_obj.thumbstick_xmod = 1; }
    else { Control_obj.thumbstick_xmod = 0; }
}
