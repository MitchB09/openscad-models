handle_length = 200;
handle_width = 60;
handle_height = 50;

base_length = 50;
base_width = 15;
base_height = 0;

mirror([0,1,0]) rotate([90,0,0])
intersection() {
    linear_extrude(handle_width)
    difference() {
        polygon([
            [0, handle_height],
            [handle_length, handle_height],
            [(handle_length-base_length)/2 + base_length, 0],
            [(handle_length-base_length)/2, 0]
        ]);
        
        offset(-12) {
            polygon([
                [0, handle_height],
                [handle_length, handle_height],
                [(handle_length-base_length)/2 + base_length, 0],
                [(handle_length-base_length)/2, 0]
            ]);
        }
    }
    mirror([-1, 0, 1])
    linear_extrude(handle_length)
    polygon([
        [0, handle_height],
        [handle_width, handle_height],
        [(handle_width-base_width)/2 + base_width, 0],
        [(handle_width-base_width)/2, 0]
    ]);
}
