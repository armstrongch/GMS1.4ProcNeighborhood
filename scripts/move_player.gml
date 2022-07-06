var move_speed = 3.75;
var max_speed = 5;
var hold_move_threshold = 4.5;
//scaling friction
//max: 0.1
//min: 0.04


friction = 0.04 + (speed/max_speed)*0.06 + colliding_softly*0.2;
colliding_softly = false;

if (exhaustion >= max_exhaustion)
{
    exhaustion_reset = true;
}
if (exhaustion_reset)
{
    exhaustion -= max_exhaustion/75;
    if (exhaustion <= 0)
    {
        exhaustion_reset = false;
    }
}
else
{
    up = press_up || (hold_up && abs(speed) <= hold_move_threshold);
    down = press_down || (hold_down && abs(speed) <= hold_move_threshold);
    left = press_left || (hold_left && abs(speed) <= hold_move_threshold);
    right = press_right || (hold_right && abs(speed) <= hold_move_threshold);
}

var vector_x = right - left;
var vector_y = down - up;
if ((abs(vector_x) + abs(vector_y)) > 0)
{
    exhaustion += 1;
    var vector_angle = point_direction(0, 0, vector_x, vector_y);
    hspeed += cos(vector_angle/180*pi)*move_speed;;
    vspeed -= sin(vector_angle/180*pi)*move_speed; 
}

if (vspeed > max_speed) { vspeed = max_speed; }
else if (vspeed < -max_speed) { vspeed = -max_speed; }
if (hspeed > max_speed) { hspeed = max_speed; }
else if (hspeed < -max_speed) { hspeed = -max_speed; }

if (speed > max_speed) { speed = max_speed; }


if (up || down || left || right)
{
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

up = false; down = false; left = false; right = false;

if (speed > 0)
{
    animation_counter += 1;
    if (animation_counter >= 8)
    {
        animation_counter = 0;
        if (Config_obj.auto_wiggle) { get_base_points(type); }
    }
}

//my own gravity implementation
/*if (vspeed != 0)
{
    vspeed += 0.2;
}*/

if (x < 16) { x = 16; }
else if (x > room_width-16) { x = room_width-16; }

if (y < 16) { y = 16; }
else if (y > room_height-176) { y = room_height-176;}


if (exhaustion > 0) { exhaustion -= 0.02; }
