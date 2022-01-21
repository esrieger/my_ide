#!/bin/bash

# Rename current database to have backup
if [ -f compile_commands.json ]
then
  mv compile_commands.json compile_commands_tmp.json
fi

rm -rf tmp/
file_list=$(find -name compile_commands.json)

mkdir tmp

ndx=0
for file in $file_list
do
  cp $file tmp/compile_commands$ndx.json
  ndx=$(($ndx+1))
done

file_list=$(ls tmp/*)

echo '[' > compile_commands.json
for file in $file_list
do
  last_line=$(wc -l < $file)
  sed -n "2,${last_line}p" $file >> compile_commands.json
done

echo ']' >> compile_commands.json
