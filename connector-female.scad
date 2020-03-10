module connector_female(thickness=3, height=5) {
    difference() {
        union() {
            linear_extrude(height) {
                difference() {
                    circle(16/2 + thickness);
                    circle(17/2);
                }
            }
            
            linear_extrude(1.2) {
                difference() {
                    circle(16/2 + thickness);
                    circle(11/2);
                }
            }
        }

        linear_extrude(10, center=true)
        square([6,15.5], true);
    }
}

connector_female();
