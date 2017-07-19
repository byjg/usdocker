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
      _script_commands="$(usdocker .autocomplete get) env self-update"

  elif [ "$cur" != "env" ] && [ "$prev" != "env" ]  && [ "$prev" != "self-update" ] && [ "$COMP_CWORD" == "2" ]; then
      _script_commands="`usdocker .autocomplete get $prev` env"

  elif [ "$prev" == "setup" ]; then
      _script_commands="--reset --reset-env --reset-data --set"

  elif [ "$prev" == "--set" ]; then
      _script_commands="$(usdocker .autocomplete __set $service)"

  elif [ "$service" == "docker" ] && [ "$prev" == "ip" ]; then
      _script_commands="`docker ps --format '{{.Names}}'`"

  elif [ "$service" == "docker-compose" ] && [ "$prev" == "up" ]; then
      _script_commands="`ls ~/.docker/machine/machines/` local"

  elif [ "$service" == "docker-compose" ] && [ "$command" == "up" ] && [ "$COMP_CWORD" == 4 ]; then
      _script_commands="`ls docker-compose-* | cut -d- -f3 | cut -d. -f1`"

  elif [ "$service" == "elasticsearch" ] && ( [ "$prev" == "up" ] || [ "$prev" == "down" ] ); then
      _script_commands="dev master data"

  else
      _script_commands=""

  fi

  COMPREPLY=( $(compgen -W "${_script_commands}" -- ${cur}) )

  return 0
}
complete -F _usdocker usdocker