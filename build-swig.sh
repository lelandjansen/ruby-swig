#/usr/bin/env bash
script_directory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for file in $(find $script_directory/lib -name "*.i"); do
  swig -ruby $file
done
