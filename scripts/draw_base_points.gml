switch(argument0)
{
    case "fence":
        draw_set_color(global.dark_color);
        for (var i = 0; i < 8; i += 1)
        {
            if (i != base_points_x[0] && i != base_points_x[1])
            {
                draw_rectangle(x+i*4, y+6, x+i*4+2, y+28, false);
                draw_triangle(x+i*4, y+6, x+i*4+2, y+6, x+i+4+1, y+2, false);
            }
        }
        draw_line_width(x+1, y+base_points_y[0]-3, x+30, y+base_points_y[1]-3, 2);
        draw_line_width(x+1, y+base_points_y[0]+3, x+30, y+base_points_y[1]+3, 2);
        break;
    
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
    
    case "player":
        draw_set_color(global.dark_color);
        draw_triangle(
            x-16+base_points_x[0], y-16+base_points_y[0],
            x-16+base_points_x[1], y-16+base_points_y[1],
            x-16+base_points_x[2], y-16+base_points_y[2],
            false);
        draw_circle(x-16+base_points_x[3], y-16+base_points_y[3], base_points_x[4], false);
        break;
    
    case "tall_grass":
        draw_set_color(global.dark_color);
        for (var i = 0; i < 5; i += 1)
        {
            draw_triangle(
                x+base_points_x[i], y+base_points_x[5],
                x+base_points_x[i]+base_points_y[5], y+base_points_x[5],
                x+base_points_x[i] + base_points_y[5]/2, y+base_points_y[i],
                false
            );
        }
        break;
}
