font = "Liberation Sans";

cube_length=121;
cube_width=32;

letter_size = 50;
letter_height = 5;



movem=300;
cover_length=cube_length+30;
cover_width=cube_width+20;
cover_height=cube_width+10;
cover_scale=0.85;


difference() {
    linear_extrude(cover_height, scale=cover_scale)
    difference() {
        offset(7) square([cover_length, cover_width], true);
    }


    linear_extrude(cover_height-5, scale=cover_scale)
    difference() {
        square([cover_length, cover_width], true);
    }
    
    translate([0,0,cover_height])
    mirror([0,0,1]) 
    linear_extrude(2)
    text("Butter", 
        size = 35, 
        font = font, 
        halign = "center", 
        valign = "center", 
        $fn = 16);

}

/* Butter Stick */
//linear_extrude(cube_width)
//square([cube_length, cube_width], true);