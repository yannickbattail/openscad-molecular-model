# openscad-molecular-model

3D molecular model made in OpenSCAD

Print 2 bond_end and glue a piece of filament to link them.

You can change the variable `fillament_diameter`, if you want to use an iron wire instead of filament.

## Customizer variables

### piece

model to be generated: atome, molecule or bond

default value: CH3-CH2-OH Alcohol

possibles values:

- all:All pieces (atomes + bonds)
- Hydrogen:H Hydrogen
- Chlorine:Cl Chlorine
- Oxygen:O Oxygen
- Sulfur:S Sulfur
- Nitrogen:N Nitrogen
- Carbon:C Carbon
- bond_end:bond end
- bond:Whole bond
- bond_1part: bond in 1 part
- bond_short: short bond
- Alcohol:CH3-CH2-OH Alcohol
- Methane:CH4 Methane
- Ammonia:NH3 Ammonia
- Carbon_dioxide:CO2 Carbon dioxide
- Formaldehyde:CH2O Formaldehyde
- cyanide:HCN Hydrogen cyanide
- Alkane:X(CH2) Alkane
- Cyclohexane:C6H12 Cyclohexane
- 22dimethylpropane:C5H12 2,2-dimethylpropane
- Dimethylhydrazine:H2NN(CH3)2 1.1-dimethylhydrazine]

### bond_pin_with_clip

Molecular bond and atomes use clip.

default value: true

possibles values:

- true
- false

### bond_pin_err

Molecular bond pin difference between inset and out set (from 0 to 1)

default value: 0.2

### bond_pin_radius

Molecular bond pin radius (from 0 to 6)

default value: 4

### bond_length

Molecular bond length (from 0 or more)

default value: 24

### fillament_diameter

Fillament diameter (for the holes in bonds)

default value:  1.75

### number_of_C

Number of carbon for the model: Alkane

default value:  6

Note: the greater, the longer the render will be.

## scripts

### concat_files.sh

Concat all *.scad file in one file to be used in
Thingivers [Customizer](https://www.thingiverse.com/apps/customizer/run?thing_id=4982157).

```bash
./concat_files.sh
```

### generate_images.sh

Generate images for al models: atomes molecules and bonds in folder `images`

```bash
./concat_files.sh
```

### generate_stl.sh

Generate stl atomes and bonds in folder `stl`

```bash
./concat_files.sh
```

You can generate stl for every models by uncommenting the line `#pieces_list=...`
