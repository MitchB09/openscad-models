/*
 * Bracket for mounting magnetic knife rack
 *
 * 2020-05-11
 *
 */

$fn = 100;
tolerance               = 0.4;

screw_diameter          = 3 + tolerance;
screw_head_diameter     = 7.5 + tolerance;

mount_width             = 20 - tolerance;
mount_depth             = 2.2 - tolerance;

incut_width             = 8.25 - tolerance;
incut_depth             = 4.5 - tolerance;




linear_extrude(mount_depth) {
    difference() {
        
        //Bracket Size
        circle(d = mount_width);
        
        // Hole for screw to mount on to
        circle(d = screw_head_diameter);
        translate([0,screw_head_diameter/2,0]) circle(d=screw_diameter);
        
        // Holes for screws to mount to knife rack
        translate([7.25, 0, 0]) circle(d=2);
        translate([-7.25, 0, 0]) circle(d=2);
    } 
}


