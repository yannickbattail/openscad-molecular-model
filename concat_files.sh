#!/bin/bash

cat ./main.scad ./atoms.scad ./bond.scad ./molecules.scad | grep -v include > molecular_model.scad
