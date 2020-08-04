#!/bin/sh
nvidia-settings --assign 'CurrentMetaMode="
   DPY-1: nvidia-auto-select @1200x1920 +0+0 {ViewPortIn=1200x1920, ViewPortOut=1920x1200+0+0, Rotation=270},
   DPY-2: 1920x1200 @1920x1200 +1200+0 {ViewPortIn=1920x1200, ViewPortOut=1920x1200+0+0}
   "'
