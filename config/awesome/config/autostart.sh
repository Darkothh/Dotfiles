#!/bin/bash
cd $(dirname $0)

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
run $HOME/.fehbg
run picom --config=./picom/picom.conf -b
