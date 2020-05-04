tolerance = 0.4;

module container_shape(width, box_width, box_depth) {
    polygon([[0,0], [width,0], [width/2,sin(60) * width]]);
    center_align_offset =  (width-box_width)/2;
    polygon([
        [center_align_offset,0],
        [width-center_align_offset,0],
        [width-center_align_offset,-box_depth],
        [center_align_offset,-box_depth]
    ]);
}

module triangle_container(width, height, box_width, box_depth, wall_thickness=2) {
	linear_extrude(wall_thickness) {
        offset(wall_thickness) {
            container_shape(width, box_width, box_depth);
        }
	}

    translate([0,0,wall_thickness]) {
        linear_extrude(height-wall_thickness) {
            difference() {
                offset(wall_thickness) {
                    container_shape(width, box_width, box_depth);
                }
                container_shape(width, box_width, box_depth);
            }
        }
    }
}

module triangle_container_case(width, height, box_width=0, box_depth=0, box_height=0, wall_thickness=2, overlap = 20) {
	
	triangle_container(width, height-overlap, box_width, box_depth, wall_thickness);
    linear_extrude(height-box_height) {
        center_align_offset =  (width-box_width)/2;
        polygon([
            [center_align_offset,0],
            [width-center_align_offset,0],
            [width-center_align_offset,-box_depth],
            [center_align_offset,-box_depth]
        ]);
    }

	translate([0,0,height-overlap]) {
		linear_extrude(overlap) {
			difference() {
				offset(wall_thickness/2 - tolerance/2) {
					container_shape(width, box_width, box_depth);
				}
				container_shape(width, box_width, box_depth);
				
			}
		}
        translate([width/2,-box_depth,overlap/2]) {
            rotate([90,0,0]) linear_extrude(wall_thickness) circle(5 - tolerance);
        }
	}
}

module triangle_container_lid(width, height, box_width=0, box_depth=0, wall_thickness=2, overlap = 20) {

	triangle_container(width, height, box_width, box_depth, wall_thickness);
	translate([0,0,height]) {
        difference() {
            linear_extrude(overlap) {
                difference() {
                    offset(wall_thickness) {
                        container_shape(width, box_width, box_depth);
                    }
                    offset(wall_thickness/2 + tolerance/2)
                    container_shape(width, box_width, box_depth);
                }
            }
            translate([width/2,-box_depth,overlap/2]) {
                rotate([90,0,0]) linear_extrude(wall_thickness+3) circle(5);
            }
        }
	}
}




width = 26;
height = 25;
box_width = 0;
box_depth = 0;
box_height = 0;
lid_height = 5;

// Case
triangle_container_case(width, height, box_width, box_depth, 
box_height - lid_height, 2, 20);

//Lid
translate([width + 20, 0, 0])
triangle_container_lid(width, lid_height, box_width, box_depth,
 2, 20);

