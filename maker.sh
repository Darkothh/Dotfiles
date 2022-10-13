#!/bin/bash

CONFPATH="$HOME/.config/"
paths=(
prueba
prueba1
prueba2
)
for i in ${paths[@]}; do
  if [ ! -d $HOME"$i" ]; then
    printf "$i No existe\n"
  fi
done
