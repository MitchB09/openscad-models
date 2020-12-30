/*
 *  Mitch Bilensky
 *  
 *  all units were mm when testing
 */
 
// Total Thickness (height) of the Desk
desk_thickness=30;

// Total Gap (vertical space) for Headphones
headphone_gap=20;

union(){
    
    $fn=256;
    
    //Holder line thickness
    thickness=6;
    
    //total holder width
    width=30; 
    
    // Total overhang on desk
    desk_depth=70; 
    
    // Total overhang and gap for headphone 
    headphone_depth=40;
    

    // Suppoting arc size 
    // TODO make this calculated?
    arcsize=25;  

difference() {
    linear_extrude(width) {
        union() {
            
            //Desk Overhang
            difference() {
                offset(thickness) square(
                    [desk_depth, desk_thickness], 
                    false
                );
                translate([-thickness-1, 0, 0]) square(
                    [desk_depth+thickness+1, desk_thickness],
                    false
                );
            }


            // Headphone Hanger
            translate(
                [desk_depth-headphone_depth, 
                -thickness, 0]
            ) mirror([0,1,0]) {
                difference() {
                    offset(thickness) square(
                        [headphone_depth-thickness,
                        headphone_gap+8], 
                        false
                    );
                    square(
                        [headphone_depth+thickness,
                        headphone_gap], 
                        false
                    );
                    square(
                        [headphone_depth-thickness,
                        headphone_gap+3], 
                        false
                    );
                } 
            }

            // Supporting arc
            translate(
                [desk_depth-headphone_depth-arcsize-thickness,
                -arcsize-thickness, 0]
            ) intersection() {
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
    translate([60-headphone_depth+3+1,-50-headphone_gap-thickness-1,width/2]) Rotate([0,90.01,0])
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

}
