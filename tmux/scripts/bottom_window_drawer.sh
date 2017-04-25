#!/bin/bash
# vim: set filetype=sh :
#
# Author: Cody Hiar
# Date: 2017-04-25
#
# Purpose: To either close or open a bottom drawer window
#
# Set options:
#   e: Stop script if command fails
#   u: Stop script if unset variable is referenced
#   x: Debug, print commands as they are executed
set -eu

# Main loop of program
main() {
  NUM_PANES=$(tmux list-panes | wc -l)
  if [[ "$NUM_PANES" == 1 ]]; then
    tmux split-window -c '#{pane_current_path}'
    tmux resize-pane -t 2 -y 20
  else
    tmux kill-pane -t 2
  fi
}
main
