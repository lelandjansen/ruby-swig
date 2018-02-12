#!/usr/bin/env bash
script_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for file in $script_directory/lib/*.i; do
  swig -ruby $file;
done
