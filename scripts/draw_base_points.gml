switch(argument0)
{
    case "tree":
        draw_set_color(global.dark_color);
        draw_triangle(
            x+base_points_x[0], y+base_points_y[0],
            x+base_points_x[1], y+base_points_y[1],
            x+base_points_x[2], y+base_points_y[2],
            false);
        break;
    
    case "tree2":
        draw_set_color(global.dark_color);
        draw_circle(
            x+base_points_x[2], y+base_points_y[2],
            base_points_x[3], false);
        draw_set_color(global.dark_color);
        draw_triangle(
            x+base_points_x[0], y+base_points_y[0],
            x+base_points_x[1], y+base_points_y[1],
            x+base_points_x[2], y+base_points_y[2],
            false);
        break;
        
    case "house":
        draw_set_color(global.dark_color);
        draw_rectangle(
            x+base_points_x[0], y+base_points_y[0],
            x+base_points_x[1], y+base_points_y[1],
            false);
        draw_triangle(
            x+base_points_x[1], y+base_points_y[1],
            x+base_points_x[0], y+base_points_y[1],
            x+base_points_x[2], y+base_points_y[2],
            false);
        draw_sprite_ext(Window_spr, 0,
            x+base_points_x[3], y+base_points_y[3],
            1, 1, 0, global.light_color, 1);
        break;

    case "path":
        for (var i = 0; i < 9; i += 1)
        {
            draw_set_color(global.light_color);
            draw_rectangle(
                x+base_points_x[i], y+base_points_y[i],
                x+base_points_x[i]+8, y+base_points_y[i]+8,
                false
            );
            draw_set_color(global.dark_color);
            draw_rectangle(
                x+base_points_x[i], y+base_points_y[i],
                x+base_points_x[i]+8, y+base_points_y[i]+8,
                true
            );
        }
        break;
        
    case "grass":
        for (var i = 0; i < 3; i += 1)
        {
            draw_sprite_ext(
                Grass_spr, base_points_x[3]+i,
                x+base_points_x[i], y+base_points_y[i],
                1, 1, 0, global.dark_color, 1
            );
        }
        break;
}