include <threads.scad>
include <atoms.scad>
include <bond.scad>
include <molecules.scad>
$fn=100;

// atome or molecule
piece = "Alcohol"; // [all:All pieces, Hydrogen:H Hydrogen, Chlorine:Cl Chlorine, Oxygen:O Oxygen, Sulfur:S Sulfur, Nitrogen:N Nitrogen, Carbon:C Carbon, bond_end:bond end, bond:Whole bond, bond_1part: bond in 1 part,bond_short:short bond, Alcohol:CH3-CH2-OH Alcohol, Methane:CH4 Methane, Ammonia:NH3 Ammonia, Carbon_dioxide:CO2 Carbon dioxide, Formaldehyde:CH2O Formaldehyde, cyanide:HCN Hydrogen cyanide, Alkane:X(CH2) Alkane, Cyclohexane:C6H12 Cyclohexane, 22dimethylpropane:C5H12 2.2-dimethylpropane, Dimethylhydrazine:H2NN(CH3)2 1.1-dimethylhydrazine]

// molecular bond with thread
bond_pin_with_thread = false; // [true, false]

// Molecular bond pin difference between inset and out set
bond_pin_err = 0.2; // [0:0.05:1]

// Molecular bond pin radius
bond_pin_radius = 6; // [1:0.5:6]

// Molecular bond length
bond_length = 24; // [0:100]

// Fillament diameter
fillament_diameter = 1.75; // [0.05:0.01:5]

// Number of carbon for Alkane
number_of_C = 6;  // [1:20]

if (piece == "all") {
    all_pieces();
}
// molecules
else if (piece == "Alcohol") {
    Alcohol();
}
else if (piece == "Methane") {
    Methane();
}
else if (piece == "Ammonia") {
    Ammonia();
}
else if (piece == "Carbon_dioxide") {
    Carbon_dioxide();
}
else if (piece == "Formaldehyde") {
    Formaldehyde();
}
else if (piece == "cyanide") {
    cyanide();
}
else if (piece == "Alkane") {
    Alkane(number_of_C);
}
else if (piece == "Cyclohexane") {
    Cyclohexane();
}
else if (piece == "22dimethylpropane") {
    TwoTwodimethylpropane();
}
else if (piece == "Dimethylhydrazine") {
    Dimethylhydrazine();
}
// atomes
else if (piece == "Hydrogen") {
    Hydrogen();
}
else if (piece == "Chlorine") {
    color("Green") Chlorine();
}
else if (piece == "Oxygen") {
    Oxygen();
}
else if (piece == "Sulfur") {
    Sulfur();
}
else if (piece == "Nitrogen") {
    Nitrogen();
}
else if (piece == "Carbon") {
    Carbon();
}
// bonds
else if (piece == "bond") {
    bond(bond_length);
}
else if (piece == "bond_end") {
    bond_end();
}
else if (piece == "bond_1part") {
    bond_1part();
}
else if (piece == "bond_short") {
    bond_short();
}

module all_pieces() {
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
