#!/bin/bash
: 'Copyright (C) 2021 FuhrerLemon, Hewel Ochoa'
#!/bin/bash

function readJson {  
  UNAMESTR=`uname`
  if [[ "$UNAMESTR" == 'Linux' ]]
  then
    SED_EXTENDED='-r'
  elif [[ "$UNAMESTR" == 'Darwin' ]]
  then
    SED_EXTENDED='-E'
  fi; 

  VALUE=`grep -m 1 "\"${2}\"" ${1} | sed ${SED_EXTENDED} 's/^ *//;s/.*: *"//;s/",?//'`

  if [ ! "$VALUE" ]
  then
    echo "Error: No se puede encontrar \"${2}\" en ${1}" >&2;
    exit 1;
  else
    echo $VALUE ;
  fi; 
}