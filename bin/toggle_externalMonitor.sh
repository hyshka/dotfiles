#!/bin/bash

if (xrandr | grep "LVDS1"); then
    IN="LVDS1"
else
    IN="LVDS2"
fi

if (xrandr | grep "VGA-1-1"); then
    EXT="VGA-1-1"
else 
    EXT="VGA-1-2"
fi
 

if (xrandr | grep "$EXT disconnected"); then
    xrandr --output $IN --auto --primary --output $EXT --off 
else
    xrandr --output $IN --auto --primary --output $EXT --auto --above $IN
fi
