
module bond_end() {
    color("Silver") {
        difference() {
            union () {
                cylinder(h=1,r1=5,r2=6,center=false);
                translate([0,0,1]) {
                    cylinder(h=7,r1=6,r2=2,center=false);
                }
                translate([0,0,-4]) {
                    if (bond_pin_with_thread) {
                        RodStart(bond_pin_radius*2 - bond_pin_err, 0, 4);
                    } else {
                        cylinder(r=bond_pin_radius - bond_pin_err, h=4, center=false);
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

module bond_1part() {
    bond_end();
    translate([0,0,15]) rotate([0,180,0]) bond_end();
}

module bond_short() {
    color("Silver")
    translate([0,0,-4]) {
        if (bond_pin_with_thread) {
            RodStart(bond_pin_radius*2 - bond_pin_err, 0, 8);
        } else {
            cylinder(r=bond_pin_radius - bond_pin_err, h=8, center=false);
        }
    }
}
