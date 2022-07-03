with (ColorManager_obj)
{
    /*current_color_index += 1;
    if (current_color_index >= max_color_count)
    {
        current_color_index = 0;
    }*/
    
    current_color_index = max_color_count - floor(Camera_obj.y/320) - 1;
    global.dark_color = dark_colors[current_color_index];
    global.light_color = light_colors[current_color_index];
    background_color = global.light_color;
}
