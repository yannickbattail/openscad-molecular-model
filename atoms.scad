
module hole() {
    translate([0,0,18]) cube(20, center=true);
    translate([0,0,4+epsi]) {
        if (bond_pin_with_thread) {
            cylinder(r=bond_pin_radius, h=4, center=false);
            cylinder(r=bond_pin_radius+bond_pin_stop, h=bond_pin_stop*2, center=false);
        } else {
            cylinder(r=bond_pin_radius, h=4, center=false);
        }
    }
}

module Hydrogen() {
    color("white")
    difference() {
        sphere(10);
        hole();
    }
}

module Chlorine() {
    color("Green") Hydrogen();
}

module Oxygen() {
    color("red")
    difference() {
        sphere(10);
        hole();
        rotate([120,0,0]) {
            hole();
        }
    }
}
module Sulfur() {
    color("Yellow") Oxygen();
}

module Nitrogen() {
    color("blue")
    difference() {
        sphere(10);
        rotate([120,0,0]) {
            hole();
        }
        rotate([120,0,120]) {
            hole();
        }
        rotate([120,0,-120]) {
            hole();
        }
    }
}

module Carbon() {
    color("DarkSlateGray") //black
    difference() {
        sphere(10);
        rotate([0,0,0]) {
            hole();
        }
        rotate([120,0,0]) {
            hole();
        }
        rotate([120,0,120]) {
            hole();
        }
        rotate([120,0,-120]) {
            hole();
        }
    }
}
