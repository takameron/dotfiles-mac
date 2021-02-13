#!/bin/sh

dirs=$(find "$PWD" -depth 1 -type d -not -name '.*')
for dir in $dirs;
do
  echo 📁 "$dir"
  sh "$dir"/install.sh
done