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

module triangle_container(width, height, box_width, box_depth, wall_thickness=1.2) {
	linear_extrude(wall_thickness) {
        offset(wall_thickness) {
            container_shape(width, box_width, box_depth);
        }
	}

	linear_extrude(height) {
		difference() {
			offset(wall_thickness) {
				container_shape(width, box_width, box_depth);
			}
			container_shape(width, box_width, box_depth);
        }
			
    }
}

module triangle_container_case(width, height, box_width, box_depth, box_height=90, wall_thickness=1.2, overlap = 15) {
	
	triangle_container(width, height-(overlap/2), box_width, box_depth, wall_thickness);
    linear_extrude(height-box_height) {
        center_align_offset =  (width-box_width)/2;
        polygon([
            [center_align_offset,0],
            [width-center_align_offset,0],
            [width-center_align_offset,-box_depth],
            [center_align_offset,-box_depth]
        ]);
    }

	translate([0,0,height-(overlap/2)]) {
		linear_extrude(overlap) {
			difference() {
				offset(wall_thickness/2 -.2) {
					container_shape(width, box_width, box_depth);
				}
				container_shape(width, box_width, box_depth);
				
			}
		}
	}
}

module triangle_container_lid(width, height, box_width, box_depth, wall_thickness=2, overlap = 15) {

	triangle_container(width, lid_height-(overlap/2), box_width, box_depth, wall_thickness);
	translate([0,0,lid_height-(overlap/2)]) {
		linear_extrude(overlap) {
			difference() {
				offset(wall_thickness) {
					container_shape(width, box_width, box_depth);
				}
				offset(wall_thickness/2 + .2)
				container_shape(width, box_width, box_depth);
			}
		}
	}
}




width = 58;
height = 115;
box_width = 26;
box_depth = 15;
box_height = 90;
lid_height = 20;

// Case
triangle_container_case(width, height - lid_height, box_width, box_depth, box_height - lid_height, 2, 20);

//Lid
translate([width + 20, 0, 0])
triangle_container_lid(width, lid_height, box_width, box_depth, 2, 20);

