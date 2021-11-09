#!/bin/bash

mkdir -p ./stl/

pieces_list="Hydrogen Oxygen Nitrogen Carbon bond_end bond_1part bond_short"
#pieces_list="all Hydrogen Chlorine Oxygen Sulfur Nitrogen Carbon bond_end bond bond_1part bond_short Alcohol Methane Ammonia Carbon_dioxide Formaldehyde cyanide Alkane Cyclohexane 22dimethylpropane Dimethylhydrazine"
for piece in $pieces_list
do
    echo generating $piece ...
    openscad -q -o ./stl/${piece}.stl -D "piece=\"$piece\"" ./main.scad
    echo generating $piece with clip ...
    openscad -q -o ./stl/${piece}_with_clip.stl -D "piece=\"$piece\"" -D "bond_pin_with_clip=true" ./main.scad
done
