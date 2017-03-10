#!/bin/sh

read -n 1 input

case $input in
    1 ) tmux select-layout even-horizontal ;;
    2 ) tmux select-layout even-vertical ;;
    3 ) tmux select-layout main-horizontal ;;
    4 ) tmux select-layout main-vertical ;;
    5 ) tmux select-layout tiled ;;
esac

