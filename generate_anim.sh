#!/bin/bash

# required image magick
# $ apt-get install imagemagick

mkdir -p ./anim/

pieces_list="Alcohol Methane Ammonia Carbon_dioxide Formaldehyde cyanide Alkane Cyclohexane 22dimethylpropane Dimethylhydrazine"
for piece in $pieces_list
do
    echo generating $piece ...
    openscad -q -o ./anim/${piece}.png -D "piece=\"$piece\"" -D "annimate_bond_length=true" --animate 20 --imgsize 256,256 ./main.scad
    echo generating animation $piece ...
    convert -delay 20 -loop 0 ./anim/${piece}*.png ./anim/${piece}.gif
    echo cleanup animation $piece ...
    rm ./anim/${piece}*.png
done
