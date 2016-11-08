#!/bin/sh

# Unsplash Source API
# https://source.unsplash.com/

# Random
# https://source.unsplash.com/random

# Category
# https://source.unsplash.com/category/ {CATEGORY NAME}
# buildings, food, nature, people, technology, objects

# Size
# widthxheight ex. 1600x900
size_w520=1600x900
size_brix=2560x1440

# Location
#bg_location=${HOME}'/.wallpaper/background'
bg_location='/home/hyshka/.wallpaper/background.jpg'
bg_location_png='/home/hyshka/.wallpaper/background.png'
#bg_ext_location='/home/hyshka/.wallpaper/background_ext.jpg'
#bg_ext_location_png='/home/hyshka/.wallpaper/background_ext.png'

if [ "$HOSTNAME" = brix ]; then
    wget https://source.unsplash.com/category/nature/$size_brix/ -O $bg_location
else
    wget https://source.unsplash.com/category/nature/$size_w520/ -O $bg_location
fi

# Conver to PNG
convert	$bg_location $bg_location_png
#convert	$bg_ext_location $bg_ext_location_png

# Set new background
setroot --store -z $bg_location_png

