if (keyboard_check_pressed(ord('R')))
{
    audio_stop_all();
    room_restart();
}

if (keyboard_check_pressed(ord('C')))
{
    with (Config_obj) { auto_wiggle = !auto_wiggle; }
}

/*if (keyboard_check_pressed(ord('X')))
{
    with (Player_obj) { exhaustion = 0; }
}

if (keyboard_check_pressed(ord('V')))
{
    with (Player_obj) { y = 128; x = room_width - 720; }
}*/

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
    
    mouse_up = false; mouse_down = false; mouse_left = false; mouse_right = false;
    
    if !(press_up || press_down || press_left || press_right || hold_up || hold_down || hold_left || hold_right)
    /*&& (point_distance(Control_obj.dpad_x, Control_obj.dpad_y, mouse_x, mouse_y) <= Control_obj.dpad_rad)*/
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
    
    stick_up = false; stick_down = false; stick_left = false; stick_right = false;
    
    if !(press_up || press_down || press_left || press_right || hold_up || hold_down || hold_left || hold_right)
    {
        var haxis = gamepad_axis_value(0, gp_axislh);
        var vaxis = gamepad_axis_value(0, gp_axislv);
        
        var right_haxis = gamepad_axis_value(0, gp_axisrh);
        var right_vaxis = gamepad_axis_value(0, gp_axisrv);
        
        if (abs(right_haxis) > 0.5) || (abs(right_vaxis) > 0.5)
        {
            haxis = right_haxis;
            vaxis = right_vaxis;
        }
        
        var stick_dir = point_direction(0, 0, haxis, vaxis);
        var stick_speed = point_distance(0 ,0, haxis, vaxis);
        
        stick_up = (abs(angle_difference(stick_dir, 90)) <= 45*1.5) && stick_speed > 0.5;
        stick_down = (abs(angle_difference(stick_dir, 270)) <= 45*1.5) && stick_speed > 0.5;
        stick_left = (abs(angle_difference(stick_dir, 180)) <= 45*1.5) && stick_speed > 0.5;
        stick_right = (abs(angle_difference(stick_dir, 0)) <= 45*1.5) && stick_speed > 0.5;
        
        pressed_button = gamepad_button_check_pressed(0, gp_face1) || gamepad_button_check_pressed(0, gp_face2)
            || gamepad_button_check_pressed(0, gp_face3) || gamepad_button_check_pressed(0, gp_face4)
            || gamepad_button_check_pressed(0, gp_shoulderl) || gamepad_button_check_pressed(0, gp_shoulderr)
            || gamepad_button_check_pressed(0, gp_shoulderlb) || gamepad_button_check_pressed(0, gp_shoulderrb);
        held_button = gamepad_button_check(0, gp_face1) || gamepad_button_check(0, gp_face2)
            || gamepad_button_check(0, gp_face3) || gamepad_button_check(0, gp_face4)
            || gamepad_button_check(0, gp_shoulderl) || gamepad_button_check(0, gp_shoulderr)
            || gamepad_button_check(0, gp_shoulderlb) || gamepad_button_check(0, gp_shoulderrb);
        
        press_up = stick_up && pressed_button;
        press_down = stick_down && pressed_button;
        press_left = stick_left && pressed_button;
        press_right = stick_right && pressed_button;
        
        hold_up = stick_up && held_button;
        hold_down = stick_down && held_button;
        hold_left = stick_left && held_button;
        hold_right = stick_right && held_button;
    }
    
    
    move_player();
    
    if (hold_up || stick_up) { Control_obj.thumbstick_ymod = -1; }
    else if (hold_down || stick_down) { Control_obj.thumbstick_ymod = 1; }
    else { Control_obj.thumbstick_ymod = 0; }
    
    if (hold_left || stick_left) { Control_obj.thumbstick_xmod = -1; }
    else if (hold_right || stick_right) { Control_obj.thumbstick_xmod = 1; }
    else { Control_obj.thumbstick_xmod = 0; }
}
