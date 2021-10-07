
module bond_end() {
    color("Silver") {
        difference() {
            union () {
                cylinder(h=1,r1=5,r2=6,center=false);
                translate([0,0,1]) {
                    cylinder(h=7,r1=6,r2=2,center=false);
                }
                translate([0,0,-4]) {
                    if (withThread) {
                        RodStart(4, 0, 4);
                    } else {
                        cylinder(r=2, h=4, center=false);
                    }
                }
            }
            cylinder(h=8,r=fillament_diameter/2,center=false);
        }
    }
}

module fillament(h) {
    color("Chartreuse") cylinder(h=h,r=fillament_diameter/2,center=false);
}

module bond(h = 24) {
    translate([0,0,8]){
        bond_end();
        fillament(h);
    }
    translate([0,0,h+8]) rotate([0,180,0]) bond_end();
}
