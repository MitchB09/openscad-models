total_diameter=12;
total_height=20;

hole_diameter=8;
hole_depth=14;

translate([0, 0, total_height])
rotate([0, 180, 0])
difference() {
    $fn=512;
    tolerance = 0.4;
    linear_extrude(total_height) circle(d=total_diameter);
    linear_extrude(hole_depth) circle(d=hole_diameter + tolerance);
}



