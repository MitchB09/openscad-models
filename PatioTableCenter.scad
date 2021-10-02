hole_diameter=56.8;
umbrella_diameter=32;
overlap=5;
tolerance=0.4;
$fn=256;

linear_extrude(10)
difference() {
    circle(d=hole_diameter-tolerance);
    circle(d=umbrella_diameter+tolerance);
}

linear_extrude(2)
difference() {
    circle(d=hole_diameter+(overlap*2));
    circle(d=umbrella_diameter+tolerance);
}
