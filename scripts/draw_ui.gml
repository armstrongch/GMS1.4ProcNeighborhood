var x1 = view_xview[0];
var x2 = view_xview[0] + view_wview[0];
var y1 = view_yview[0] + view_hview[0] - 160;
var y2 = view_yview[0] + view_hview[0];



draw_set_color(global.light_color);
draw_rectangle(x1, y1, x2, y2, false);

x1 += 12;
x2 -= 12;
y1 += 12;
y2 -= 12;

draw_set_color(global.dark_color);
draw_rectangle(x1, y1, x2, y2, false);

x1 += 8;
x2 -= 8;
y1 += 8;
y2 -= 8;

draw_set_color(global.light_color);
draw_rectangle(x1, y1, x2, y2, false);

var ui_width = x2 - x1;
var ui_height = y2 - y1;

var circle_x = x1 + ui_width*0.75;
var circle_y = y1 + ui_height*0.5;
var circle_rad = ui_height*0.4;

draw_set_color(global.dark_color);
draw_circle(circle_x, circle_y, circle_rad, false);

for (var i = 0; i < 8; i += 1)
{
    var dir = 45/2 + 45*i;
    draw_set_color(global.light_color);
    draw_line_width(circle_x, circle_y,
        circle_x + cos(dir/180*pi)*circle_rad,
        circle_y - sin(dir/180*pi)*circle_rad, 6);
}

