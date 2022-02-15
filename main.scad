include <atoms.scad>
include <bond.scad>
include <molecules.scad>

/* [parameters] */

// atome or molecule
part = "Alcohol";// [all:All parts, Hydrogen:H Hydrogen, Chlorine:Cl Chlorine, Oxygen:O Oxygen, Sulfur:S Sulfur, Nitrogen:N Nitrogen, Carbon:C Carbon, bond_end:bond end, bond:Whole bond, bond_1part: bond in 1 part,bond_short:short bond, Alcohol:CH3-CH2-OH Alcohol, Methane:CH4 Methane, Ammonia:NH3 Ammonia, Carbon_dioxide:CO2 Carbon dioxide, Formaldehyde:CH2O Formaldehyde, cyanide:HCN Hydrogen cyanide, Alkane:X(CH2) Alkane, Cyclohexane:C6H12 Cyclohexane, 22dimethylpropane:C5H12 2.2-dimethylpropane, Dimethylhydrazine:H2NN(CH3)2 1.1-dimethylhydrazine]

// Number of carbon for Alkane
number_of_carbon = 6;  // [1:20]

/* [Molecular bond] */

// molecular bond with clip
bond_pin_with_clip = true; // [true, false]

// Molecular bond pin radius
bond_pin_radius = 2.5; // [1:0.5:3.5]

// Molecular bond pin length
bond_pin_length = 4; // [1:0.5:5]

// Molecular bond pin torus size at the end of the pin
bond_pin_stop = 0.5; // [0:0.05:1]

// Molecular bond pin split thickness
bond_pin_split = 1; // [0:0.1:3]

// Molecular bond pin difference between inset and outset
bond_pin_err = 0.2; // [0:0.05:1]

// Molecular bond length
molecular_bond_length = 26; // [0:100]

// Fillament diameter
fillament_diameter = 1.75; // [0.05:0.01:5]

/* [Animation] */

// Animation rotation
animation_rotation = false;

// Animate bond length
annimate_bond_length = false;

// Animate number of carbon for Alkane
annimate_number_of_C = false;

/* [Hidden] */
$fn = 100;

number_of_C = annimate_number_of_C?round($t * 10):number_of_carbon;
bond_length = annimate_bond_length?round($t * 50):molecular_bond_length;
epsi = 0.001; // epsilon constant

$vpt = animation_rotation?[4, 3, 15]:$vpt;
$vpr = animation_rotation?[60, 0, 365 * $t]:$vpr;
$vpd = animation_rotation?500:$vpd;

if (part == "all") {
    all_parts();
}
// molecules
else if (part == "Alcohol") {
    Alcohol();
}
else if (part == "Methane") {
    Methane();
}
else if (part == "Ammonia") {
    Ammonia();
}
else if (part == "Carbon_dioxide") {
    Carbon_dioxide();
}
else if (part == "Formaldehyde") {
    Formaldehyde();
}
else if (part == "cyanide") {
    cyanide();
}
else if (part == "Alkane") {
    Alkane(number_of_C);
}
else if (part == "Cyclohexane") {
    Cyclohexane();
}
else if (part == "22dimethylpropane") {
    TwoTwodimethylpropane();
}
else if (part == "Dimethylhydrazine") {
    Dimethylhydrazine();
}
// atomes
else if (part == "Hydrogen") {
    Hydrogen();
}
else if (part == "Chlorine") {
    color("Green") Chlorine();
}
else if (part == "Oxygen") {
    Oxygen();
}
else if (part == "Sulfur") {
    Sulfur();
}
else if (part == "Nitrogen") {
    Nitrogen();
}
else if (part == "Carbon") {
    Carbon();
}
// bonds
else if (part == "bond") {
    bond(bond_length);
}
else if (part == "bond_end") {
    bond_end();
}
else if (part == "bond_1part") {
    bond_1part();
}
else if (part == "bond_short") {
    bond_short();
}

module all_parts() {
    translate([0, 0, 0]) Hydrogen();
    translate([0, 0,25]) Chlorine();
    translate([0,25, 0]) Oxygen();
    translate([0,25,25]) Sulfur();
    translate([0,50, 0]) Nitrogen();
    translate([0,75, 0]) Carbon();

    translate([0,0, 45]) bond_end();
    translate([0,25,45]) bond_short();
    translate([0,50,12]) bond(bond_length);
    translate([0,75,20]) bond_1part();
}
