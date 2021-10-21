#!/bin/bash

mkdir -p ./images/

pieces_list="all Hydrogen Chlorine Oxygen Sulfur Nitrogen Carbon bond_end bond bond_1part bond_short Alcohol Methane Ammonia Carbon_dioxide Formaldehyde cyanide Alkane Cyclohexane 22dimethylpropane Dimethylhydrazine"
for piece in $pieces_list
do
    echo generating $piece ...
    openscad -o ./images/${piece}.png -D "piece=\"$piece\"" ./main.scad
done
