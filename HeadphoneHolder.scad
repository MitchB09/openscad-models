$fn=256;
thickness=6;

width=30;

desk_depth=70;
desk_thickness=30;

headphone_depth=40;
headphone_thickness=20;

arcsize=25;

difference() {
    linear_extrude(width) {
        union() {
            
            difference() {
                offset(thickness) square([desk_depth, desk_thickness], false);
                translate([-thickness-1, 0, 0]) square([desk_depth+thickness+1, desk_thickness], false);
            }



            translate([desk_depth-headphone_depth, -thickness, 0]) mirror([0,1,0]) {
                difference() {
                    offset(thickness) square([headphone_depth-thickness, headphone_thickness+8], false);
                    square([headphone_depth+thickness, headphone_thickness], false);
                    square([headphone_depth-thickness, headphone_thickness+3], false);
                } 
            }

            translate([desk_depth-headphone_depth-arcsize-thickness, -arcsize-thickness, 0]) intersection() {
                difference() {
                    offset(thickness) circle(arcsize);
                    circle(arcsize);
                }
                square([arcsize, arcsize], false);
            }
        }
        
    }

    
    //Causes Manifold Issues
    /*
    translate([60-headphone_depth+3+1,-50-headphone_thickness-thickness-1,width/2]) Rotate([0,90.01,0])
    {
        linear_extrude(headphone_depth-6) {
            difference() {
                offset(10) circle(50);
                circle(50);
            }
        }
    }
    */
}
