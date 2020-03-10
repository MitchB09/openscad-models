rotate([0, 180, 0]) {
    linear_extrude(90, scale=1.25) {
        difference()
        offset(12)
        scale([1.0,1.34]) 
        circle(r=88.0); 
                scale([1.0,1.34]) 
        circle(r=88.0); 
        
    }
}