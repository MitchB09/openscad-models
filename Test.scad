echo(version=version());

// rotate_extrude() rotates a 2D shape around the Z axis. 
// Note that the 2D shape must be either completely on the 
// positive or negative side of the X axis.
color("red")
rotate_extrude(convexity = 10, $fn = 6)
translate([2, 0, 0])
circle(r = 1);