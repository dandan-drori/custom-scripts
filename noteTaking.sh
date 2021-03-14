#!/bin/bash

noteFilename="$HOME/.notes/src/note-$(date +%d-%m-%Y).md"

if [ ! -f $noteFilename ]; then
  echo "# Notes for $(date +%d-%m-%Y)" > $noteFilename
fi

nvim -c "norm Go" \
  -c "norm zz" \
  -c "startinsert" $noteFilename
