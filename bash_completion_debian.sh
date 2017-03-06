#!/usr/bin/env bash

_usdocker()
{
  local cur prev
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [ "$prev" == "usdocker" ]
  then
      _script_commands=$(usdocker .autocomplete get)
  elif [ "$COMP_CWORD" == "2" ]
  then
      _script_commands=`usdocker .autocomplete get $prev`
  else
      _script_commands=""
  fi

  COMPREPLY=( $(compgen -W "${_script_commands}" -- ${cur}) )

  return 0
}
complete -F _usdocker usdocker