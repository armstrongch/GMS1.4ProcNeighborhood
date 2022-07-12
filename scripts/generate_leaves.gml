leaf_x = 944 + irandom(1360);
leaf_y = 304;
new_leaf = instance_create(leaf_x, leaf_y, Leaf_obj);
with(new_leaf)
{
    path_start(Leaf_pth, 3, path_action_stop, false);
}

alarm[2] = 15 + irandom(30);
