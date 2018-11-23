#!/bin/bash
#   __ _       _   _             
#  / _| | __ _| |_| |_ ___ _ __  
# | |_| |/ _` | __| __/ _ \ '_ \ 
# |  _| | (_| | |_| ||  __/ | | |
# |_| |_|\__,_|\__|\__\___|_| |_|
#                                
# Moves all files found in a directory tree into
#   a single output directory.
#
shopt -s globstar

function usage() {
  echo usage: $0 '<dir-to-flatten> <out-dir>' 
}

if [[ $# -lt 2 ]]
then
  usage
  exit 1
fi

if [[ ! -d $1 && ! -d $2 ]]
then
  usage
  exit 2
fi

for i in $1/**
do
  echo Looking at "$i"
  if [[ ! -f "$i" ]]; then continue; fi

  md5sum=$(cat "$i" | md5sum | cut -f1 -d' ')
  extension="${i##*.}"

  if [[ -z "$extension" ]]
  then
    echo "No extension found... Skipping."
    continue
  fi

  mv -v "$i" "$2/$md5sum.$extension"
done
