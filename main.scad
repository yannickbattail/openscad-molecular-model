include <threads.scad>
include <atoms.scad>
include <bond.scad>
include <molecules.scad>
$fn=100;

// atome or molecule
piece = "Alcohol"; // [all:All pieces, Hydrogen:H Hydrogen, Chlorine:Cl Chlorine, Oxygen:O Oxygen, Sulfur:S Sulfur, Nitrogen:N Nitrogen, Carbon:C Carbon, bond_end:bond end, bond:Whole bond, Alcohol:CH3-CH2-OH Alcohol, Methane:CH4 Methane, Ammonia:NH3 Ammonia, Carbon_dioxide:CO2 Carbon dioxide, cyanide:HCN Hydrogen cyanide, Alkane:CH2- Alkane, Cyclohexane:C6H12 Cyclohexane, 22dimethylpropane:C5H12 2.2-dimethylpropane]

// molecular bond with thread
withThread = false; // [true, false]

// bond tength
bond_length = 24; // [0:100]

// molecular bond with thread
fillament_diameter = 1.75; // [0.05:0.01:5]

// Number of carbon for Alkane
number_of_C = 6;  // [1:20]

if (piece == "all") {
    all_pieces();
}
if (piece == "Alcohol") {
    Alcohol();
}
if (piece == "Methane") {
    Methane();
}
if (piece == "Ammonia") {
    Ammonia();
}
if (piece == "Carbon_dioxide") {
    Carbon_dioxide();
}
if (piece == "cyanide") {
    cyanide();
}
if (piece == "Alkane") {
    Alkane(number_of_C);
}
if (piece == "Cyclohexane") {
    Cyclohexane();
}if (piece == "22dimethylpropane") {
    TwoTwodimethylpropane();
}
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
else if (piece == "bond") {
    bond(bond_length);
}
else if (piece == "bond_end") {
    bond_end();
}
