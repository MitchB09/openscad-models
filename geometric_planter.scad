module geometric_planter(height, width, wall_thickness=0.5, sides=4, base_thickness) {
	echo(base_thickness);
	base_thickness = base_thickness == undef ? wall_thickness : base_thickness;

	//Draws base layer
	linear_extrude(height=base_thickness) {
		difference() {
			circle(d=width, $fn=sides);
			circle(1, $fn = 40);
		}
	}
	
	//Draws twist
	translate([0,0,base_thickness]) {
		linear_extrude(height=height-base_thickness, twist=270, slices=8) {
			difference() {
				circle(d=width, $fn=sides);
				circle(d=width-wall_thickness, $fn=sides);

			}
		}
	}
}

geometric_planter(height=5, width=15, sides=16, wall_thickness=1, base_thickness=0.5);
