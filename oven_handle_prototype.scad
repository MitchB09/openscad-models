$fn=60;

module bracket_panel(width, length, thickness, screw_position) {


    difference() {
        linear_extrude(thickness) {
            square([width, length]);
        }

        if (screw_position != undef) {
            union() {
                translate([screw_position[0], screw_position[1],0])
                rotate([0,0,90]) {
                    linear_extrude(thickness * 5, center=true)
                    circle(3);
                }

                //mirrors the above
                translate([width - screw_position[0], length - screw_position[1],0])
                rotate([0,0,90]) {
                    linear_extrude(thickness * 5, center=true)
                    circle(3);
                }
            }
        }
    }
}

module half_handle() {
    rotate([-90,0,90])
    difference() {
        translate ([-10,0,0]) {
        
            translate([0,0,0])
            linear_extrude(30, scale=0.5) circle(5);

            rotate([0, -75, 0])
            translate([30,0,-10])
            linear_extrude(70, scale=0.5) circle(7.5);
        }

        translate([0,-15,0]) cube([30,30,60]);
    }
}

module handle() {
    half_handle();
    mirror([0,1,0]) half_handle();
}

thickness=3;
width=50;
length=50;

//bracket_panel(width, length, thickness, [2/5 * width, 1/5 * length]);

translate([4,0,0])
rotate([0,-90,0]) {
    bracket_panel(30, length, 4);
}

offset=[0,25,15];
translate(offset) handle();