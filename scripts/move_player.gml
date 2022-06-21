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

friction = 0.3;

up = false; down = false; left = false; right = false;
