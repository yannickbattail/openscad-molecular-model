module bond_end() {
    color("Silver") {
        difference() {
            union() {
                cylinder(h = 1, r1 = 5, r2 = 6, center = false);
                translate([0, 0, 1]) cylinder(h = 7, r1 = 6, r2 = 2, center = false);
                translate([0, 0, - bond_pin_length]) bond_pin();
            }
            // fillament hole
            translate([0, 0, 1 + epsi]) cylinder(h = 7, r = fillament_diameter / 2, center = false);
        }
    }
}


module bond_pin() {
    radius = bond_pin_radius - bond_pin_err;
    if (bond_pin_with_clip) {
        difference() {
            union() {
                cylinder(r = radius, h = bond_pin_length, center = false);
                translate([0, 0, bond_pin_stop])ring(radius, bond_pin_stop * 2);
            }
            // bon split
            translate([0, 0, bond_pin_length / 2]) cube([bond_pin_split, (radius + bond_pin_stop) * 2, bond_pin_length + epsi * 2], center = true);
            // troncate bond_pin_stop
            translate([0,  radius + bond_pin_stop / 2, bond_pin_length / 2]) cube([(radius + bond_pin_stop) * 2, bond_pin_stop, bond_pin_length], center = true);
            translate([0, -radius - bond_pin_stop / 2, bond_pin_length / 2]) cube([(radius + bond_pin_stop) * 2, bond_pin_stop, bond_pin_length], center = true);

        }
    } else {
        cylinder(r = bond_pin_radius - bond_pin_err, h = bond_pin_length, center = false);
    }
}

module fillament(h) {
    color("Chartreuse") cylinder(h = h, r = fillament_diameter / 2, center = false);
}

module bond(h = 24) {
    translate([0, 0, 8]) {
        bond_end();
        fillament(h);
    }
    translate([0, 0, h + 8]) rotate([0, 180, 0]) bond_end();
}

module bond_1part() {
    bond_end();
    translate([0, 0, 15]) rotate([0, 180, 0]) bond_end();
}

module bond_short() {
    spacing = 0.5;
    color("Silver")
        union() {
            translate([0, 0, - bond_pin_length - spacing]) bond_pin();
            cylinder(h = spacing * 2, r = bond_pin_radius + 1, center = true);
            translate([0, 0, bond_pin_length + spacing]) rotate([0, 180, 0]) bond_pin();
        }
}
