#!/bin/bash

mkdir -p ./images/

pieces_list="all Hydrogen Chlorine Oxygen Sulfur Nitrogen Carbon bond_end bond bond_1part bond_short Alcohol Methane Ammonia Carbon_dioxide Formaldehyde cyanide Alkane Cyclohexane 22dimethylpropane Dimethylhydrazine"
for piece in $pieces_list
do
    echo generating $piece ...
    openscad -q -o ./images/${piece}.png -D "piece=\"$piece\"" --imgsize 1024,1024 ./main.scad
done
