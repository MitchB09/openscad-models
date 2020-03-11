module geometric_planter(height, width, wall_thickness=0.5, sides=4, base_thickness, scale=1) {
	echo(base_thickness);
	base_thickness = base_thickness == undef ? wall_thickness : base_thickness;

	//Draws base layer
	linear_extrude(height=base_thickness) {
		difference() {
			circle(d=width, $fn=sides);
		}
	}
	
	//Draws twist
	translate([0,0,base_thickness]) {
		linear_extrude(height=height-wall_thickness, twist=90, slices=5, scale=scale) {
			difference() {
				circle(d=width, $fn=sides);
				circle(d=width-wall_thickness, $fn=sides);

			}
		}
	}
	
	translate([0,0,height]) {
		linear_extrude(height=base_thickness) {
			difference() {
				circle(d=width*scale, $fn=sides);
				circle(d=width*scale-wall_thickness*2, $fn=sides);
			}
		}
	}
}

geometric_planter(5, 15, sides=12, wall_thickness=0.5, base_thickness=0.5,
		scale=1.5);
