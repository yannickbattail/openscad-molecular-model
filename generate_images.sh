#!/bin/bash

mkdir -p ./images/

pieces_list="all Hydrogen Chlorine Oxygen Sulfur Nitrogen Carbon bond_end bond Alcohol Methane Ammonia Carbon_dioxide cyanide Alkane Cyclohexane 22dimethylpropane"
for piece in $pieces_list
do
    echo generating $piece ...
    openscad -o ./images/$piece.png -D "piece=\"$piece\"" ./main.scad
done
