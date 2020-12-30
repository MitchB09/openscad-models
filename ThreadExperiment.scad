use <threads.scad>;

$fn=12;

head_height = 5;
head_diameter = 30;

screw_length = 8;
screw_diameter = 20;

linear_extrude(head_height) circle(d=head_diameter);
difference() {
    translate([0,0,head_height]) {
        metric_thread(
            diameter=screw_diameter, 
            length=screw_length
        );
    }

    translate([0,0,7]) linear_extrude(10) square([screw_diameter/2, screw_diameter + 2], true);
}


translate([head_diameter * 1.5,0,0])
difference() {
    linear_extrude(head_height) circle(d=head_diameter);
    metric_thread(diameter=screw_diameter, length=head_height+1, internal=true);
}