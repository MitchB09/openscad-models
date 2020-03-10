module connector_female(thickness=3, height=5, scale=1) {
    difference() {
        union() {
            difference() {
                linear_extrude(height, scale=scale) circle(16/2 + thickness);
                linear_extrude(height+0.1) circle(17/2);
            }
            
            linear_extrude(1.2) {
                difference() {
                    circle(16/2 + thickness);
                    circle(11/2);
                }
            }
        }

        linear_extrude(10, center=true)
        square([6,14], true);
    }
}

connector_female();
