use <SnapContainer.scad>;

width = 26;
height = 30;
box_width = 26;
box_depth = 18;
box_height = 30;
lid_height = 0;

// Case
triangle_container_case(width, height - lid_height, box_width, box_depth, box_height - lid_height, 2, 20);

//Lid
translate([width + 20, 0, 0])
triangle_container_lid(width, lid_height, box_width, box_depth, 2, 20);

