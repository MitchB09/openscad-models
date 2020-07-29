use <threads.scad>;

$fn=12;

linear_extrude(5) circle(d=12);
translate([0,0,5]) metric_thread(diameter=8, length=8);

translate([20,0,0])
difference() {
    linear_extrude(5) circle(d=12);
    metric_thread(diameter=8, length=8, internal=true);
}