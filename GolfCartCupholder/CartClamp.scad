//$fn = 100;
use <../Connectors_v2.scad>;

thickness = 3;
shaft_size = 20.4;
tolerance = 0.4;

// Male Connector
translate([0,0, (shaft_size + tolerance)/2]) {
    difference() {
        translate([0,0,-1]) connector_male(15, 10);
        union() {
            linear_extrude(25) difference() {
                offset(thickness) square(shaft_size+tolerance+thickness*2, center=true);
                square(shaft_size+tolerance+thickness*2, center=true);
            }
            rotate([180,0,0]) linear_extrude(3) {
                offset(thickness) square(shaft_size+tolerance+thickness*2, center=true);
            }
        }
    }
}


// Shaft Clamp
rotate([90,0,0]) linear_extrude(30, center=true) difference() {
    offset(thickness) square(shaft_size + tolerance, center=true);
    square(shaft_size + tolerance, center=true);
    
    //Corner Cut (Change translate to increase/decrease cut size)
    translate([-2, 2, 0]) rotate([180,0,0]) square(30);
}