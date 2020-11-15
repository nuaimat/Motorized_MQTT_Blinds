
$fn=144;

module cylinder_outer(height,radius,fn){
    fudge = 1/cos(180/fn);
    echo("Fudge = ", fudge);
    echo("New Radius = ", radius*fudge);
    cylinder(h=height,r=radius*fudge,$fn=fn);
}
   
   
module Connector(rod_shaft_diameter) {
    difference() {
    cylinder(20, 9, 9, $fn = 12);
    
    // Rod shaft
    translate([0, 0, 9.01])
        cylinder_outer(11, rod_shaft_diameter / 2, 6);
        
    // Motor shaft
    translate([-5/2, -3.4/2, -0.1])
        cube([5, 3.4, 7]);
    };
    
}


Connector(6.0);

