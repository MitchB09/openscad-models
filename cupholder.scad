$fn = 64;
use <connector_female.scad>;

thickness = 3;

difference() {
    
    
    //Main Cylinder 
    difference() {
        union() {
            linear_extrude(105 + thickness) { circle(34 + thickness); }
            translate([0,-43,90]) rotate([-90,0,0]) connector_female(height=10, scale=1.5);
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