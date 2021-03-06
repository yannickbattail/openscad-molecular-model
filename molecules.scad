module rHydrogen() {
    bond(bond_length);
    translate([0, 0, bond_length + 16]) rotate([0, 180, 0]) Hydrogen();
}

module Alcohol() {
    Carbon();
    rotate([120, 0, 120]) rHydrogen();
    rotate([120, 0, - 120]) rHydrogen();

    // -OH
    rotate([120, 0, 0]) {
        bond(bond_length);
        translate([0, 0, bond_length + 16]) rotate([0, 90, 180]) {
            rotate([0, 90, 120]) Oxygen();
            rotate([- 90, 0, 30]) rHydrogen();
        }
    }

    // -CH3
    bond(bond_length);
    translate([0, 0, bond_length + 16]) rotate([0, 180, 0]) {
        Carbon();
        rotate([120, 0, 0]) rHydrogen();
        rotate([120, 0, 120]) rHydrogen();
        rotate([120, 0, - 120]) rHydrogen();
    }
}

module Methane() {
    Carbon();

    rotate([0, 0, 0]) rHydrogen();
    rotate([120, 0, 0]) rHydrogen();
    rotate([120, 0, 120]) rHydrogen();
    rotate([120, 0, - 120]) rHydrogen();
}

module Ammonia() {
    Nitrogen();
    rotate([120, 0, 0]) rHydrogen();
    rotate([120, 0, 120]) rHydrogen();
    rotate([120, 0, - 120]) rHydrogen();
}

module ring(ring_diameter, pipe_diameter, angle = 360, angle_start = 0) {
    rotate([0, 0, angle_start]) {
        rotate_extrude(angle = angle) {
            translate([ring_diameter, 0, 0])
                circle(r = pipe_diameter / 2);
        }
    }
}

module round_fillament2() {
    translate([0, - 3, - 20]) {
        rotate([0, 90, 0]) {
            color("Chartreuse") ring(20, fillament_diameter, 90, 45);
        }
    }
}

module oxide_bond() {
    rotate([120, 0, 0]) {
        translate([0, 0, 8]) bond_end();
    }
    round_fillament2();
}

module oxide() {
    translate([0, 0, bond_length + 16])
        {
            rotate([120, 0, 0]) Oxygen();

            oxide_bond();

            rotate([0, 0, 180]) {
                oxide_bond();
            }
        }
}

module Carbon_dioxide() {
    rotate([120, 0, 0]) {
        Carbon();
        rotate([0, 0, 0]) {
            translate([0, 0, 8]) bond_end();
        }
        rotate([120, 0, 0])     translate([0, 0, 8]) bond_end();
        rotate([120, 0, 120])   translate([0, 0, 8]) bond_end();
        rotate([120, 0, - 120]) translate([0, 0, 8]) bond_end();
    }
    rotate([0, 0, 90])
        {
            oxide();
        }
    rotate([180, 0, 0])
        {
            oxide();
        }
}

// CH2O
module Formaldehyde() {
    rotate([120, 0, 0]) {
        Carbon();
        rotate([0, 0, 0])   translate([0, 0, 8]) bond_end();
        rotate([120, 0, 0]) translate([0, 0, 8]) bond_end();
    }
    rotate([0, 0, 90]) oxide();
    rotate([120, 0, 120]) rHydrogen();
    rotate([120, 0, - 120]) rHydrogen();
}


module round_fillament3() {
    rotate([60, 0, 0]) {
        translate([0, 4, 20]) {
            rotate([90, 45, - 43]) {
                color("Chartreuse") ring(20, fillament_diameter, 90);
            }
        }
    }
}

module cyanide() {
    Carbon();

    rotate([0, 0, 0]) rHydrogen();
    rotate([120, 0, 0]) {
        translate([0, 0, 8]) bond_end();
        round_fillament3();
    }
    rotate([120, 0, 120]) {
        translate([0, 0, 8]) bond_end();
        round_fillament3();
    }
    rotate([120, 0, - 120]) {
        translate([0, 0, 8]) bond_end();
        round_fillament3();
    }

    translate([0, 0, - 40]) rotate([180, 0, 180])
        {
            Nitrogen();
            rotate([120, 0, 0]) translate([0, 0, 8]) bond_end();
            rotate([120, 0, 120]) translate([0, 0, 8]) bond_end();
            rotate([120, 0, - 120]) translate([0, 0, 8]) bond_end();
        }
}

module Alkane(i = 8, first = true) {
    rotate([120, 0, 180]) {
        Carbon();

        if (first) {// first C has a H
            rotate([120, 0, 0]) rHydrogen();
        }
        rotate([120, 0, 120]) rHydrogen();
        rotate([120, 0, - 120]) rHydrogen();
        bond(bond_length);
        i = i - 1;
        if (i > 0) {
            // next CH2-
            translate([0, 0, bond_length + 16]) rotate([60, 0, 0]) Alkane(i, false);
        } else {// the last C last has a H
            rotate([0, 0, 0]) rHydrogen();
        }
    }
}

module Cyclohexane(i = 6) {
    Carbon();
    rotate([120, 0, 120]) rHydrogen();
    rotate([120, 0, - 120]) rHydrogen();
    bond(bond_length);
    i = i - 1;
    if (i > 0) {
        // next CH2-
        translate([0, 0, bond_length + 16]) rotate([60, 0, 0]) Cyclohexane(i);
    }
}

module CH3() {
    bond(bond_length);
    translate([0, 0, bond_length + 16]) rotate([0, 180, 0]) {
        Carbon();
        rotate([120, 0, 0]) rHydrogen();
        rotate([120, 0, 120]) rHydrogen();
        rotate([120, 0, - 120]) rHydrogen();
    }
}

module NH2() {
    bond(bond_length);
    translate([0, 0, bond_length + 16]) rotate([60, 0, 0]) {
        Nitrogen();
        rotate([120, 0, 120]) rHydrogen();
        rotate([120, 0, - 120]) rHydrogen();
    }
}

//2,2-dimethylpropane
module TwoTwodimethylpropane(i = 6) {
    Carbon();
    rotate([0, 0, 0]) CH3();
    rotate([120, 0, 0]) CH3();
    rotate([120, 0, 120]) CH3();
    rotate([120, 0, - 120]) CH3();
}

//1,1-dimethylhydrazine  H2NN(CH3)2
module Dimethylhydrazine(i = 6) {
    Nitrogen();

    rotate([120, 0, 0]) CH3();
    rotate([120, 0, 120]) CH3();
    rotate([120, 0, - 120]) NH2();
}

// C8H10N4O2 1,3,7-Trimethylxanthine
module Caffeine(i = 6) {
    Nitrogen();

    rotate([120, 0, 0]) CH3();
    rotate([120, 0, 120]) CH3();
    rotate([120, 0, - 120]) NH2();
}
