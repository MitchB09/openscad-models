

module connector_male(radius, overlap, tolerance=0.4)
{
    translate([0,0,overlap/2])
    rotate_extrude(angle=45, convexity=10)
        translate([-radius, 0]) circle(radius/5);
    translate([0,0,overlap/2])
    rotate_extrude(angle=45, convexity=10)
        translate([radius, 0]) circle(radius/5);
    cylinder(r=radius, h=overlap);
    
}

//Outer Piece 
module connector_female(radius, overlap, thickness=5, tolerance=0.4)
{

    difference() {
        cylinder(r=radius+tolerance+thickness, h=overlap);
        
        translate([0,0,-.5]) cylinder(r=radius+tolerance, h=overlap+1);
        
        translate([0,0,overlap/2]) {
            rotate_extrude(angle=360, convexity=10)
                translate([radius, 0]) circle(radius/5+tolerance);
            cylinder(r=radius, h=overlap);
        }
        rotate_extrude(angle=48, convexity=10)
            translate([radius, 0]) square([radius/5+tolerance, overlap/2]);
        
        rotate_extrude(angle=48, convexity=10)
            translate([-radius-(radius/5+tolerance), 0]) square([radius/5+tolerance, overlap/2]);
    }
    
    //}
}

radius=8;
overlap=10;
tolerance=0.4;
thickness=3;
$fn=100;

//connector_male(radius, overlap, tolerance=tolerance);

//translate([radius*3, 0, 0])
connector_female(radius, overlap, thickness=thickness, tolerance=tolerance);

