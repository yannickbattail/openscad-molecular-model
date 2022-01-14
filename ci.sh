#!/bin/bash

apt-get update
apt-get install -y imagemagick
./generate_anim.sh
./generate_image.sh
./generate_stl.sh
