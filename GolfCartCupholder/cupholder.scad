$fn = 100;
use <../Connectors_v2.scad>;

thickness = 3;
linear_extrude(50) translate([0,-35,90]) rotate([90,0,0]) cylinder(30, 25);

difference() {
    
    
    //Main Cylinder 
    difference() {
        union() {
            linear_extrude(105 + thickness) { circle(34 + thickness); }
            translate([0,-35,90]) rotate([90,0,0]) connector_female(15, 10);
            translate([0,-20,90]) rotate([90,0,0]) linear_extrude(15) circle(15);
        }
        translate([0,0, thickness]) { linear_extrude(121) { circle(34); } }
    };

    //Lower Cut in Cylinder
    rotate([0,-90,0]) {
        linear_extrude(100, center=true) {
            polygon([
                [15 + thickness, -31],
                [80 + thickness, -31],
                [40 + thickness, 31],
                [15 + thickness, 31]
            ]);
        }
    }
    
    //Upper Cut in Cylinder
    rotate([0,-90,0]) {
        linear_extrude(100, center=true) {
            polygon([
                [100 + thickness, -31],
                [120 + thickness, -31],
                [120 + thickness, 40],
                [70  + thickness, 40]
            ]);
        }
    }
}

translate([200,0,0]) {
    
}