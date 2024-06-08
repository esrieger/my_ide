#!/bin/bash
script=$1
shift
for arg in $@
do
  if [[ $arg == /mnt/c* ]]
  then
    arg_list+="$(wslpath -w $arg) "
  else
    arg_list+="$arg "
  fi
done

echo $script $arg_list
cmd.exe /c $(wslpath -w $script) $arg_list
