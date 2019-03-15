#!/bin/bash
COUNTER=0

while [ 1 ]
do
  # Check whether or not socket exists
  if [ -S /tmp/.X11-unix/X0 ]
  then
    echo 'X has started'
    exit 0
  fi

  ((++COUNTER))

  if [ $COUNTER -gt 40 ]
  then
    echo 'Timed out'
    exit 1
  fi

  sleep 1
done
