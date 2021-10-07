#!/bin/bash

cat ./main.scad ./threads.scad ./atoms.scad ./moleculeBond.scad ./molecules.scad | grep -v include > molecular_model.scad
