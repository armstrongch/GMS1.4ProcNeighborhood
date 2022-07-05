center_x = x+16;
center_y = y+16;

x_dist = abs(Player_obj.x - center_x);
y_dist = abs(Player_obj.y - center_y);

if (x_dist < 28 && y_dist < 28)
{
    if (y_dist < x_dist)
    {
        if (Player_obj.x < center_x) { Player_obj.x = center_x - 28; }
        else { Player_obj.x = center_x + 28; }
    }
    else
    {
        if (Player_obj.y < center_y) { Player_obj.y = center_y - 28; }
        else { Player_obj.y = center_y + 28; }
    }
}
