$fn = 1000;


module half_circle_frame(bottle_radius, thickness) {
	linear_extrude(thickness)
	difference() {
		difference() {
			square(bottle_radius*2 + thickness*2, true);
			circle(bottle_radius);
		}
		translate([-bottle_radius-(thickness*2),-(0.5*bottle_radius),0])
		square(bottle_radius*2 + thickness*4);
	}

}

module bottle_holder(bottle_radius, length, thickness=10) {
	translate([0,0, bottle_radius+thickness])
	rotate([90,0,0]) {
		translate([0,0,length])
			half_circle_frame(bottle_radius, thickness);
		half_circle_frame(bottle_radius, thickness);
	}
	translate([-thickness,-length, 0])
	cube([2*thickness, length, thickness], false);
}

bottle_holder(72, 90, 5);