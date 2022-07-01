var move_speed = 4;
var max_speed = 5;
var hold_move_threshold = move_speed;

up = press_up || (hold_up && abs(vspeed) <= hold_move_threshold);
down = press_down || (hold_down && abs(vspeed) <= hold_move_threshold);
left = press_left || (hold_left && abs(hspeed) <= hold_move_threshold);
right = press_right || (hold_right && abs(hspeed) <= hold_move_threshold);

if (up) { vspeed -= move_speed; }
if (down) { vspeed += move_speed; }
if (left) { hspeed -= move_speed; }
if (right) { hspeed += move_speed; }

if (vspeed > max_speed) { vspeed = max_speed; }
else if (vspeed < -max_speed) { vspeed = -max_speed; }
if (hspeed > max_speed) { hspeed = max_speed; }
else if (hspeed < -max_speed) { hspeed = -max_speed; }

if (speed > max_speed) { speed = max_speed; }
/*
for (var i = 0; i < instance_number(DrawPointsParent); i += 1)
{
    var test_collider = instance_find(DrawPointsParent, i);
    if (test_collider.visible && test_collider.id != id)
    {
        
    }
}
*/

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

friction = 0.3;

//my own gravity implementation
if (vspeed != 0)
{
    vspeed += 0.2;
}

if (x < 16) { x = 16; }
else if (x > room_width-16) { x = room_width-16; }

if (y < 16) { y = 16; }
else if (y > room_height-176) { y = room_height-176;}
