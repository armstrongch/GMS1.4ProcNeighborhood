with (ColorManager_obj)
{
    max_color_count = 0;
    
    //https://coolors.co/fffcf2-ccc5b9-403d39-252422-eb5e28
    dark_colors[max_color_count] = make_color_rgb(13, 59, 102);
    light_colors[max_color_count] = make_color_rgb(244, 211, 94);
    max_color_count += 1;
    
    //blue + purple, turd1 from Cardboard Moon
    dark_colors[max_color_count] = make_color_rgb(99,52,131);
    light_colors[max_color_count] = make_color_rgb(100,180,251);
    max_color_count += 1;
    
    //blue + green turd2 from Cardboard Moon
    dark_colors[max_color_count] = make_color_rgb(51,139,132);
    light_colors[max_color_count] = make_color_rgb(164,251,195);
    max_color_count += 1;
    
    //green + tan turd3 from Cardboard Moon
    dark_colors[max_color_count] = make_color_rgb(251,180,140);
    light_colors[max_color_count] = make_color_rgb(52,124,76);
    max_color_count += 1;
    /*
    //deep blue + yellow skeletor from Riverbottom
    dark_colors[max_color_count] = make_color_rgb(75,59,147);
    light_colors[max_color_count] = make_color_rgb(244,236,68);
    max_color_count += 1;
    
    //turquoise + purple windbreaker from Riverbottom
    dark_colors[max_color_count] = make_color_rgb(123,28,123);
    light_colors[max_color_count] = make_color_rgb(4,171,156);
    max_color_count += 1;
    */
    
    current_color_index = max_color_count;
    increment_global_color();
}
