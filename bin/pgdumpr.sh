#!/bin/bash
# vim: set filetype=sh :
#
# Author: Bryan Hyshka
# Date: 2017-05-03
#
# Purpose: To dump postgres database from a host and scp locally
#
# Set options:
#   e: Stop script if command fails
#   u: Stop script if unset variable is referenced
#   x: Debug, print commands as they are executed
set -eu

ORIGIN_HOST="$1"
DATABASE="$2"
PORT="${3:-22}"

# Main loop of program
main() {
  TIMESTAMP=$(date +%F)

  ssh -t -p "$PORT" "$ORIGIN_HOST" "sudo -u postgres bash -c \"pg_dump --no-owner -d "$DATABASE" > /tmp/"$DATABASE"-"$TIMESTAMP".sql\"" && scp -P "$PORT" "$ORIGIN_HOST":/tmp/"$DATABASE"-"$TIMESTAMP".sql .
}
main
