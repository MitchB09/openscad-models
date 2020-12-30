cable_diameter=10;
screw_diameter=1;
tolerance=0.2;

thickness=1.5;
width=8;

$fn=512;


difference () {
//Extended Ring
    linear_extrude(width)
    difference() {
        union() {
            translate([0, cable_diameter/2,0])
            
            //Ring
            offset(thickness) circle(d=cable_diameter);
            
            //Nail Extention
            offset(thickness) square(
                [cable_diameter*1.25,cable_diameter/4]);
        }
        //Ring Cutout
        translate([0, cable_diameter/2,0])
        circle(d=cable_diameter);   
        
        // Nail Extention Cutout
        square([cable_diameter*2+thickness*2,cable_diameter/4]);

    };

    //Nail Hole
    translate([cable_diameter,-thickness*2,width/2])
    rotate([-90,0,0])
    linear_extrude(cable_diameter*2)
    circle(screw_diameter);
}



 
