#!/bin/bash
# vim: set filetype=sh :
#
# Author: Bryan Hyshka
# Date: 2017-05-03
#
# Purpose: To dump postgres database from a host and scp to a new host
#
# Set options:
#   e: Stop script if command fails
#   u: Stop script if unset variable is referenced
#   x: Debug, print commands as they are executed
set -eu

# Main loop of program
main() {
  DATABASE=$1
  ORIGIN_HOST=$2
  DESTINATION_HOST=$3
  TIMESTAMP=$(date +%F)

  # dump database from origin
  ssh -t $2 'bash -c "sudo -u postgres bash -c \"pg_dump -d $DATABASE > /tmp/$DATABASE-$TIMESTAMP.sql\""'

  # scp database to destination
  scp -3 $2:/tmp/$DATABASE-$TIMESTAMP.sql $3:/tmp/$DATABASE-$TIMESTAMP.sql
}
main

# don't think I can do these here
# create and import db in postgres container
# don't know how to combine these since the db file is on host, not inside container
#docker exec -i $(docker-compose ps -q postgres) createdb -Upostgres $DATABASE
#docker exec -i $(docker-compose ps -q postgres) psql -Upostgres -d $DATABASE < /tmp/$DATABASE-$(date +%F).sql

