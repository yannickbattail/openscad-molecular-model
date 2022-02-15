c_angle = 109.47;

module hole() {
    translate([0, 0, 18]) cube(20, center = true);
    translate([0, 0, 4 + epsi]) {
        if (bond_pin_with_clip) {
            cylinder(r = bond_pin_radius, h = 4, center = false);
            cylinder(r = bond_pin_radius + bond_pin_stop, h = bond_pin_stop * 2, center = false);
        } else {
            cylinder(r = bond_pin_radius, h = 4, center = false);
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
    color("red") {
        difference() {
            sphere(10);
            hole();
            rotate([c_angle, 0, 0]) {
                hole();
            }
        }
    }
    if ($children >= 1) {
        rotate([c_angle, 0, 0]) {
            bond(bond_length);
            translate([0, 0, bond_length + 16]) {
                rotate([180, 0, 0]) children(0);
            }
        }
    }
    if ($children >= 2) {
        bond(bond_length);
        translate([0, 0, bond_length + 16]) {
            rotate([180, 0, 0]) children(1);
        }
    }
}

module Sulfur() {
    color("yellow") {
        difference() {
            sphere(10);
            hole();
            rotate([c_angle, 0, 0]) {
                hole();
            }
        }
    }
    if ($children >= 1) {
        rotate([c_angle, 0, 0]) {
            bond(bond_length);
            translate([0, 0, bond_length + 16]) {
                rotate([180, 0, 0]) children(0);
            }
        }
    }
    if ($children >= 2) {
        bond(bond_length);
        translate([0, 0, bond_length + 16]) {
            rotate([180, 0, 0]) children(1);
        }
    }
}

module Nitrogen() {
    color("blue") {
        difference() {
            sphere(10);
            hole();
            rotate([c_angle, 0, 0]) {
                hole();
            }
            rotate([c_angle, 0, 120]) {
                hole();
            }
        }
    }
    if ($children >= 1) {
        rotate([c_angle, 0, 0]) {
            bond(bond_length);
            translate([0, 0, bond_length + 16]) {
                rotate([180, 0, 0]) children(0);
            }
        }
    }
    if ($children >= 2) {
        rotate([c_angle, 0, 120]) {
            bond(bond_length);
            translate([0, 0, bond_length + 16]) {
                rotate([180, 0, 0]) children(1);
            }
        }
    }
    if ($children >= 3) {
        bond(bond_length);
        translate([0, 0, bond_length + 16]) {
            rotate([180, 0, 0]) children(2);
        }
    }
}

module Carbon() {
    color("DarkSlateGray") {//black
        difference() {
            sphere(10);
            rotate([0, 0, 0]) {
                hole();
            }
            rotate([c_angle, 0, 0]) {
                hole();
            }
            rotate([c_angle, 0, 120]) {
                hole();
            }
            rotate([c_angle, 0, - 120]) {
                hole();
            }
        }
    }
    if ($children >= 1) {
        rotate([c_angle, 0, 0]) {
            bond(bond_length);
            translate([0, 0, bond_length + 16]) {
                rotate([180, 0, 0]) children(0);
            }
        }
    }
    if ($children >= 2) {
        rotate([c_angle, 0, 120]) {
            bond(bond_length);
            translate([0, 0, bond_length + 16]) {
                rotate([180, 0, 0]) children(1);
            }
        }
    }
    if ($children >= 3) {
        rotate([c_angle, 0, - 120]) {
            bond(bond_length);
            translate([0, 0, bond_length + 16]) {
                rotate([180, 0, 0]) children(2);
            }
        }
    }
    if ($children >= 4) {
        bond(bond_length);
        translate([0, 0, bond_length + 16]) {
            rotate([180, 0, 0]) children(3);
        }
    }
}
