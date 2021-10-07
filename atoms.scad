
module hole() {
    translate([0,0,18]) {
        cube(20, center=true);
    }
    translate([0,0,4]) {
        if (withThread) {
            //RodEnd(4, 4, 4);
            RodStart(4, 0, 4);
        } else {
            cylinder(r=2, h=4, center=false);
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

module all_pieces() {

    translate([0, 0,0]) Hydrogen();
    translate([0, 0,20]) Chlorine();
    translate([0,20,]) Oxygen();
    translate([0,20,20]) Sulfur();
    translate([0,40,0]) Nitrogen();
    translate([0,60,0]) Carbon();

    rotate([0,0,0]) {
        translate([0,20,36/*28*/]) {
            bond_end();
        }
    }
    rotate([0,0,0]) {
        translate([0,0,28/*20*/]) {
            bond(bond_length);
        }
    }
}

