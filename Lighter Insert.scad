linear_extrude(2) offset(2) square([90, 27.5]);
translate([0,0,2])
linear_extrude(17.5 + 2) {
	difference() {
		offset(2) square([90, 27.5]);
		square([90, 27.5]);
	}
}

