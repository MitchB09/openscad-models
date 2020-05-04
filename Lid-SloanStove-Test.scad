use <SnapContainer.scad>;

module incut(incut_width, incut_height, incut_offset) {
    translate([-10,5, incut_height/2 + 7 + 2]) {
        rotate([0,90,0]) {
            linear_extrude(width + 15) {
                polygon([[0,0],[incut_width,0],[0,incut_height/2]]);
                polygon([[incut_width + incut_offset,incut_offset],[incut_width + incut_offset,incut_height/2 + incut_offset],[incut_offset,incut_height/2 + incut_offset]]); 
                mirror([1,0,0]) {
                    polygon([[0,0],[incut_width,0],[0,incut_height/2]]);
                    polygon([[incut_width + incut_offset,incut_offset],[incut_width + incut_offset,incut_height/2 + incut_offset],[incut_offset,incut_height/2 + incut_offset]]); 
                }
            }
        }
    }
}

width = 58;
height = 30;
box_width = 26;
box_depth = 18;
box_height = 85;
lid_height = 5;

// Case
difference() {
    triangle_container_case(width, height - lid_height, box_width, box_depth, box_height - lid_height, 2, 20);
    //incut(30, 70, 5);
}

//Lid
//translate([width + 20, 0, 0])
//triangle_container_lid(width, lid_height, box_width, box_depth, 2, 20);





