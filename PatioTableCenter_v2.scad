use <threads.scad>;

hole_diameter=56.8;
umbrella_diameter=33.5;
overlap=5;
tolerance=0.4;
$fn=12;
thread_size=2;

cap=true;

if (cap) {
    color("#FF0000") {
        difference() {
            union() {
                linear_extrude(7) circle(d=hole_diameter-tolerance);
                translate([0,0,7]) metric_thread(diameter=
                    hole_diameter-1-tolerance, 
                    pitch=thread_size, 
                    length=8
                );
            }
            
            
            linear_extrude(15) circle(d=umbrella_diameter+tolerance);
        }
    }

    linear_extrude(2)
    difference() {
        circle(d=hole_diameter+(overlap*2));
        circle(d=umbrella_diameter+tolerance);
    }
} else {
    difference() {
        linear_extrude(5) circle(d=hole_diameter+(overlap*2));
        metric_thread(diameter=
                hole_diameter-1-tolerance, 
                pitch=thread_size, 
                length=5,
                internal=true
            );
    }
}