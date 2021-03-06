var border_size = 8;
var max_size = 31;

switch(argument0)
{
    case "smoke":
        //starting angle
        base_points_x[0] = irandom(60);
        //radius
        base_points_y[0] = border_size*0.75 + irandom(border_size*0.5);
        break;
    
    case "water":
        for (var i = 0; i < 3; i += 1)
        {
            base_points_x[i] = border_size/2 + irandom(border_size);
            base_points_y[i] = border_size + i*(max_size-border_size*1.5)/2;
        }
        animation_counter = 0;
        break;
    
    case "fence":
        //2 missing posts:
        base_points_x[0] = irandom(7);
        base_points_x[1] = base_points_x[0] - 2;
        if (base_points_x[1] < 0) { base_points_x[1] += 4;}
        //crossbar height
        base_points_y[0] = border_size + irandom(max_size - border_size*2);
        base_points_y[1] = base_points_y[0] - border_size/2 + irandom(border_size);
        break;
    
    case "tree":
        //bottom left
        base_points_x[0] = irandom(border_size);
        base_points_y[0] = max_size - irandom(border_size);
        //bottom right
        base_points_x[1] = max_size - irandom(border_size);
        base_points_y[1] = max_size - irandom(border_size);
        //top
        base_points_x[2] = border_size + irandom(max_size - border_size*2);
        base_points_y[2] = irandom(border_size);
        break;
    
    case "tree2":
        //bottom left:
        base_points_x[0] = border_size + irandom(max_size - border_size*2) - border_size/2;
        base_points_y[0] = max_size - irandom(border_size);
        //bottom right:
        base_points_x[1] = base_points_x[0] + border_size/2;
        base_points_y[1] = base_points_y[0];
        //top:
        base_points_x[2] = border_size + irandom(max_size - border_size*2);
        base_points_y[2] = border_size + irandom(border_size/2);
        //radius
        base_points_x[3] = border_size/2 + irandom(border_size/2);
        break;
        
    case "house":
        //square: bottom right
        base_points_x[0] = max_size;
        base_points_y[0] = max_size;
        
        //square: top left
        //triangle: bottom left
        base_points_x[1] = 0;
        base_points_y[1] = border_size + max_size*(0.2 + random(0.2));
        
        //square: top right
        //triangle: bottom right
        //base_points_x[0]
        //base_points_y[1]
        
        //triangle: top
        base_points_x[2] = border_size + irandom(max_size - border_size*2); 
        base_points_y[2] = border_size;
        
        //window_position
        base_points_x[3] = border_size; if (irandom(1) == 1) { base_points_x[3] = max_size - border_size - 16; }
        base_points_y[3] = base_points_y[1];
        break;
    
    case "path":
        var counter = 0;
        for (var i = 0; i < 3; i += 1)
        {
            for (var j = 0; j < 3; j += 1)
            {
                base_points_x[counter] = 4 + border_size*i - 3 + irandom(6);
                base_points_y[counter] = 4 + border_size*j - 3 + irandom(6);
                counter += 1
            }
        }
        break;
    
    case "grass":
        var start_angle = irandom(360);
        for (i = 0; i < 3; i += 1)
        {
            var grass_angle = (start_angle + 120*i - 30 + irandom(60)) / 180 * pi;
            var dist = 20 - irandom(10);
            base_points_x[i] = max_size/2 + cos(grass_angle)*dist;
            base_points_y[i] = max_size/2 - sin(grass_angle)*dist;
        }
        //sprite_index
        base_points_x[3] = irandom(4);
        break;
        
    case "player":
        //triangle bottom
        base_points_x[0] = max_size/2 - border_size/4 + irandom(border_size/2);
        base_points_y[0] = max_size;
        
        //triangle left
        base_points_x[1] = border_size + irandom(border_size*0.5);
        base_points_y[1] = max_size/2 + irandom(max_size/4);
        
        //triangle right
        base_points_x[2] = max_size - border_size - irandom(border_size*0.5);
        base_points_y[2] = max_size/2 + irandom(max_size/4);
        
        //circle position
        var middle_x = (base_points_x[2] + base_points_x[1]) / 2;
        var middle_y = (base_points_y[2] + base_points_y[1]) / 2;
    
        base_points_x[3] = middle_x;
        base_points_y[3] = middle_y - border_size/2;
        
        //circle radius
        base_points_x[4] = border_size/2;
          
        break;
    
    case "tall_grass":
        temp = ds_list_create();
        for (var i = 0; i < max_size; i += ceil(max_size/8))
        {
            ds_list_add(temp, i);
        }
        ds_list_shuffle(temp);
        for (var i = 0; i < 5; i += 1)
        {
            base_points_x[i] = ds_list_find_value(temp, i);
            base_points_y[i] = irandom(border_size);
        }
        ds_list_destroy(temp);
        //bottom
        base_points_x[5] = max_size;
        base_points_y[5] = ceil(max_size/8);
        break;
}
