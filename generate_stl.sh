#!/bin/bash

mkdir -p ./stl/

#pieces_list="all Hydrogen Chlorine Oxygen Sulfur Nitrogen Carbon bond_end bond Alcohol Methane Ammonia Carbon_dioxide cyanide Alkane Cyclohexane 22dimethylpropane"
pieces_list="Hydrogen Oxygen Nitrogen Carbon bond_end"
for piece in $pieces_list
do
    echo generating $piece ...
    openscad -o ./stl/$piece.stl -D "piece=\"$piece\"" ./main.scad
done

for piece in Hydrogen
do
    echo generating withThread $piece ...
    openscad -o ./stl/$piece-withThread.stl -D "piece=\"$piece\"" -D "withThread=true" ./main.scad
done
