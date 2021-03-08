#!/bin/bash

noteFilename="/home/dandan/.notes/src/note-$(date +%d-%m-%Y).md"

if [ ! -f $noteFilename ]; then
  echo "# Note for $(date +%d-%m-%Y)" > $noteFilename
fi

nvim -c "norm Go" \
  -c "norm Go## $(date +%H:%M)" \
  -c "norm G2o" \
  -c "norm zz" \
  -c "startinsert" $noteFilename
