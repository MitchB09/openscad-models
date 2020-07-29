//module connector

width = 40;
height = 10;
tolerance = 0.4;
thickness = width/10;
$fn = 100;

module connector_female(width, height, tolerance=0.04) {
    
    //Bottom disc
    linear_extrude(thickness) circle(width);

    difference() {
        //Outer part
        linear_extrude(height) difference() {
            circle(width);
            circle(width-thickness+tolerance/2);
        }

        //Inner Ring
        translate([0,0, ((height-thickness)/2) + thickness]) {
            rotate_extrude()
            translate([width+tolerance/2-thickness/4-thickness, 0, 0])
            circle(thickness/2);
        }
    }
}

module connector_male(width, height, tolerance=0.4) {
    
    //Bottom disc
    linear_extrude(thickness) circle(width);
    
    //Inner Circle
    linear_extrude(height) {
        difference() {
            circle(width-thickness-tolerance/2);
            circle(width-thickness-tolerance/2-thickness);
        }
    }
    
    //Inner Ring
    translate([0,0, ((height-thickness)/2) + thickness]) {
        rotate_extrude()
        translate([width-thickness-tolerance/2-thickness/4, 0, 0])
        circle(thickness/2);
    }
}

connector_female(width, height);
translate([0, 100, 0]) {
    connector_male(width, height);

}
