var move_speed = 6;
if (up) { vspeed -= move_speed; up = false;}
if (down) { vspeed += move_speed; down = false; }
if (left) { hspeed -= move_speed; left = false; }
if (right) { hspeed += move_speed; right = false; }

if (vspeed > 10) { vspeed = 10; }
else if (vspeed < -10) { vspeed = -10; }
if (hspeed > 10) { hspeed = 10; }
else if (hspeed < -10) { hspeed = -10; }

friction = 0.3;
