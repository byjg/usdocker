#!/usr/bin/env bash

_usdocker()
{
  local cur prev
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  service="${COMP_WORDS[1]}"
  command="${COMP_WORDS[2]}"

  if [ "$prev" == "usdocker" ]; then
      _script_commands="$(usdocker .autocomplete get) env"

  elif [ "$cur" != "env" ] && [ "$prev" != "env" ] && [ "$COMP_CWORD" == "2" ]; then
      _script_commands="`usdocker .autocomplete get $prev` env"

  elif [ "$prev" == "setup" ]; then
      _script_commands="--reset --reset-env --reset-data"

  elif [ "$service" == "docker-compose" ] && [ "$prev" == "up" ]; then
      _script_commands="`ls ~/.docker/machine/machines/` local"

  elif [ "$service" == "docker-compose" ] && [ "$command" == "up" ] && [ "$COMP_CWORD" == 4 ]; then
      _script_commands="`ls docker-compose-* | cut -d- -f3 | cut -d. -f1`"

  else
      _script_commands=""

  fi

  COMPREPLY=( $(compgen -W "${_script_commands}" -- ${cur}) )

  return 0
}
complete -F _usdocker usdocker