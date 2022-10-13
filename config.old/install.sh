#!/bin/bash

printf "\n"
printf "\n"
printf "Quieres instalar Programas y dependencias? [y=yes/N]\n"
read installpkg
if [[ $installpkg = y ]]
then
  sudo pacman -Syu
  paru -S go jdk-openjdk fzf nvm zsh starship noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra rofi nvim brillo git
  printf "Programas y dependencias installados \n"
else
  printf "\n"
  printf "No instalar programas \n"
fi

printf "\n"
printf "\n"
printf "La shell por default es: $($SHELL)"
printf "Quieres installar hacer zsh default shell? [y=yes/N] \n"
printf "\n"
read zshpromt
if [[ $zshpromt = y ]]
then
  printf "\n"
  chsh -s $(which zsh)
  printf "Zsh ahora es la shell por default (recarga la termial)"
else
  printf "\n"
  printf "No se ha puesto zsh por default"
fi

printf "\n"
printf "\n"
printf "Copiar y mover archivos a .config? [y=yes/N] \n"
read cpfiles
if [[ $cpfiles = y ]]
then
  cp -r kitty rofi $HOME/.config/
  cp .zshrc /tmux/.tmux.conf $HOME
  printf "Se han movido \n"
else
  printf "No se han movido \n"
fi

printf "\n"
printf "\n"
printf "Instalar nvim dotfiles? [y=yes/N] \n"
read nviminstall
if [[ $nviminstall ]]
then
  git clone https://github.com/dylanfierro/nvim.git $HOME/.config
  printf "\n"
  printf "Se han instalado los archivos para nvim\n"
else
  printf "\n"
  printf "No se han instalado los archivos \n"
fi

printf "\n"
printf "\n"
printf "Quieres install npm y node? [y=yes/N] \n"
read npminstall
if [[ $npminstall = y ]] then
  nvm install Gallium
  printf "\n"
  printf "Se ha instalado npm y Node correctamente"
  printf "\n"
else
  printf "\n"
  printf "\No se ha instalado npm/Node"
  printf "\n"
fi
