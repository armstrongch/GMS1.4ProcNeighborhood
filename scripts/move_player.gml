//Set move speed variables
var tap_speed_increment = 1;
var max_speed = 5;

//Set friction and reset soft collision flag
friction = 0.04 + colliding_softly*0.06 + exhaustion_reset*0.1;
colliding_softly = false;

//If exhausted, take a breather
if (exhaustion >= max_exhaustion)
{
    exhaustion_reset = true;
}
if (exhaustion_reset)
{
    exhaustion -= max_exhaustion/120;
    if (exhaustion <= 0)
    {
        exhaustion_reset = false;
    }
}
else
{
    //Interpret input as up/down/left/right
    if (hold_counter > 0)
    {
        hold_counter -= 1;
    }
    
    up = press_up || (hold_up && hold_counter <= 0);
    down = press_down || (hold_down && hold_counter <= 0);
    left = press_left || (hold_left && hold_counter <= 0);
    right = press_right || (hold_right && hold_counter <= 0);
    
    if (up && hold_up) || (down && hold_down) || (left && hold_left) || (right && hold_right)
    {
        hold_counter = max_hold_counter;
    }
}

if (up || down || left || right)
{
    //Every step adds exhaustion
    exhaustion += 1;
    
    //Find intended move direction
    var vector_x = right - left;
    var vector_y = down - up;
    var vector_angle = point_direction(0, 0, vector_x, vector_y);
    
    //If standing still, start running in direction
    if (speed == 0)
    {
        speed = tap_speed_increment;
        direction = vector_angle;
    }
    //Otherwise, adjust direction to match pressed direction and increment speed
    else
    {
        var angle_diff = angle_difference(direction, vector_angle);
        if (abs(angle_diff) > 135)
        {
            speed -= tap_speed_increment;
            if (speed < 0)
            {
                speed = abs(speed);
                direction = vector_angle;
            }
        }
        else if (angle_diff < 0) { direction += 45; }
        else if (angle_diff > 0) { direction -= 45; }
        else //angle_diff = 0
        {
            speed += tap_speed_increment;
        }
    
        //Don't exceed max speed
        if (speed > max_speed) { speed = max_speed; }
    }
    
    //Generate Smoke
    var smoke_dist = 999;
    if (instance_number(Smoke_obj) > 0)
    {
        var nearest_smoke = instance_nearest(x-16, y-16, Smoke_obj);
        smoke_dist = point_distance(x, y, nearest_smoke.x+16, nearest_smoke.y+16);
    }
    
    if (smoke_dist >= 96)
    {
        var smoke = instance_create(x-16, y-16, Smoke_obj);
        smoke.speed = max(1.5, speed*0.5);
        smoke.direction = direction + 180;
    }
}

//Reset movement flags
up = false; down = false; left = false; right = false;

//Increment Animation Counter
if (speed > 0)
{
    animation_counter += 1;
    if (animation_counter >= 8)
    {
        animation_counter = 0;
        if (Config_obj.auto_wiggle) { get_base_points(type); }
    }
}

//Don't allow the player to leave the play area
if (x < 16) { x = 16; }
else if (x > room_width-16) { x = room_width-16; }
if (y < 16) { y = 16; }
else if (y > room_height-176) { y = room_height-176;}

//Ever frame reduces exhaustion
if (exhaustion > 0) { exhaustion -= 0.02; }
