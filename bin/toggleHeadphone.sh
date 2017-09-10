#!/bin/sh
# vim: set filetype=sh :
#
# Author: Bryan Hyshka
# Date 2017-09-04
#
# Purpose: toggle headphone and speaker outputs with amixer
#
# Set options
#   e: Stop script if command fails
#   u: Stop script if unset variable is referenced
#   x: Debug, print commands as they are executed
set -eu

# Main loop of program#
main() {
# enable headphone
#amixer -c 0 sset "Left Speaker Mixer Left DAC" off
#amixer -c 0 sset "Right Speaker Mixer Right DAC" off
#amixer -c 0 sset "Headphone Left" on 
#amixer -c 0 sset "Headphone Right" on

# disable headphone
amixer -c 0 sset "Left Speaker Mixer Left DAC" on
amixer -c 0 sset "Right Speaker Mixer Right DAC" on
amixer -c 0 sset "Headphone Left" off 
amixer -c 0 sset "Headphone Right" off
}
main
