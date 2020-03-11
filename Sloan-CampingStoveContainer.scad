
module triangle_container(width, height, wall_thickness=1.2) {
	linear_extrude(wall_thickness) {
			offset(wall_thickness) {
				polygon([[0,0], [width,0], [width/2,sin(60) * width]]);
			}
	}

	linear_extrude(height) {
		difference() {
			offset(wall_thickness) {
				polygon([[0,0], [width,0], [width/2,sin(60) * width]]);
			}
			polygon([[0,0], [width,0], [width/2,sin(60) * width]]);
			
		}
	}
}

module triangle_container_case(width, height, wall_thickness=1.2) {
	
	triangle_container(width, height -10, wall_thickness);
	translate([0,0,height - 10]) {
		linear_extrude(10) {
			difference() {
				offset(wall_thickness-.4) {
					polygon([[0,0], [width,0], [width/2,sin(60) * width]]);
				}
				polygon([[0,0], [width,0], [width/2,sin(60) * width]]);
				
			}
		}
	}
}

module triangle_container_lid(width, height, wall_thickness=1.2) {

	triangle_container(width, height -10, wall_thickness);
	translate([0,0,height -10]) {
		linear_extrude(10) {
			difference() {
				offset(wall_thickness) {
					polygon([[0,0], [width,0], [width/2,sin(60) * width]]);
				}
				offset(.4)
				polygon([[0,0], [width,0], [width/2,sin(60) * width]]);
				
			}
		}
	}
}

width = 60;

// Case
triangle_container_case(width, 30, 2);

//Lid
translate([width + 20, 0, 0]) {
	triangle_container_lid(width, 30, 2);
}


