module support(width, length) {
    linear_extrude(1, center=true) {
    union() {
        difference() {
            polygon([[0,0],[0,width], [length,width], [length,0]]);
            offset(-1) {
                polygon([[0,0],[0,width], [length,width], [length,0]]);
            }
        }

        difference() {
                offset(.5) {
                polygon([[0,0],[0,width], [length,0]]);
            };
            offset(-.5) {
                polygon([[0,0],[0,width], [length,0]]);
            };
        }

        difference() {
                offset(.5) {
                polygon([[0,0],[length,width], [length,0]]);
            };
            offset(-.5) {
                polygon([[0,0],[length,width], [length,0]]);
            };
        }
        
        difference() {
                offset(.5) {
                polygon([[0,0],[0,width], [length,0]]);
            };
            offset(-.5) {
                polygon([[0,0],[0,width], [length,0]]);
            };
        }

        difference() {
                offset(.5) {
                polygon([[0,0],[0,width], [length,width]]);
            };
            offset(-.5) {
                polygon([[0,0],[0,width], [length,width]]);
            };
        }

    }
}
}

module crate(width, length, height, openface = false) {
    if (openface) {
        support(width, length);
    }
    translate([0, 0, height]) {
        support(width, length);
    }

    rotate([90,0,0]){
        support(height, length);
    }
    translate([0, width, 0]) rotate([90,0,0]){
        support(height, length);
    }
    rotate([0,-90,0]){
        support(width, height);
    }
    translate([length, 0, 0]) rotate([0,-90,0]){
        support(width, height);
    }
}

crate(24, 18, 12);
