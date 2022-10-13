#!/bin/bash

# files=(
#   $HOME/.fzf
#   $HOME/.oh-my-zsh
#   $HOME/Documents/prueba
# )
#
# for i in "${files[@]}"; do
#   [ ! -d "$i" ] && echo "$i existe" || echo "$i No existe"
# done


  sh -c "$(curl -fsSL https://raw.github.com/TroubleC0re/ohmyzsh/master/tools/install.sh)" &> /dev/null
