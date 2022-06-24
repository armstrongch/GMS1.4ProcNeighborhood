center_x = x+16;
center_y = y+16;

x_dist = abs(Player_obj.x - center_x);
y_dist = abs(Player_obj.y - center_y);

if (x_dist < 32 && y_dist < 32)
{
    if (y_dist < x_dist)
    {
        if (Player_obj.x < center_x) { Player_obj.x = center_x - 32; }
        else { Player_obj.x = center_x + 32; }
    }
    else
    {
        if (Player_obj.y < center_y) { Player_obj.y = center_y - 32; }
        else { Player_obj.y = center_y + 32; }
    }
}
