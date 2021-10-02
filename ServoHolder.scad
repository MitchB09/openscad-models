width=13;
length=23;
groove_length=32.3;
groove_hieght=2.6;
inset_hieght=18.5-groove_hieght;

wire_diameter=6;
wire_height=6;

$fn=128;
/*
color("#3333ff")
linear_extrude(inset_hieght)
square([width, length], true);

color("#3333ff")
translate([0,0,inset_hieght])   
linear_extrude(groove_hieght)
square([width, groove_length], true);

color("#ff3333")
translate([0,0,wire_height])
rotate([-90,0,0])
linear_extrude(20)
circle(d=wire_diameter);
*/

offset=2;
translate([0,0,-offset])
difference() {
    linear_extrude(inset_hieght+offset)
    square([width+offset, groove_length], true);

    translate([0,0,offset])
    linear_extrude(inset_hieght+1)
    square([width, length], true);
    
    translate([0,0,7+offset])
    rotate([-90,0,0])
    linear_extrude(20)
    circle(d=wire_diameter+offset);
    
    translate([0,0,6])
    rotate([-90,0,0])
    linear_extrude(20)
    square(6+offset, true);
}