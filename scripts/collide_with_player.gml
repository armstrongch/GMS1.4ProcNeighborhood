x_center = x+16;
y_center = y+16;
//Player origin is 16,16, everything else is at 0,0


if (abs(x_center - Player_obj.x) < 16) && (abs(y_center - Player_obj.y) < 16)
{
    if (x_center > Player_obj.x)
    {
        Player_obj.x = min(Player_obj.x, x_center-16);
    }
    else
    {
        Player_obj.x = max(Player_obj.x, x_center+16);
    }
    
    if (y_center > Player_obj.y)
    {
        Player_obj.y = min(Player_obj.y, y_center-16);
    }
    else
    {
        Player_obj.y = max(Player_obj.y, y_center+16);
    }
}
