if (instance_number(Bird_obj) <= 0)
{
    var bird_x = room_width - 80 - irandom(160);
    var bird_y = 0;
    var bird_dir = 270 - 30 + irandom(60);
    
    for (var i = 0; i < 4; i += 1)
    {
        new_bird = instance_create(bird_x-i*18, bird_y, Bird_obj);
        new_bird.direction = bird_dir;
        if (i > 0)
        {
            new_bird = instance_create(bird_x+i*18, bird_y, Bird_obj);
            new_bird.direction = bird_dir;
        }
        bird_y -= 10;
    }
    
    with (Bird_obj) { speed = 2; }
}

alarm[1] = 180;
