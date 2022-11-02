#!/bin/bash

REPO=$HOME/Downloads/repos/Dotfiles
CONF=$HOME/.config/

carpetas() {
foldnames=(
  alacritty
  awesome
  kitty
  rofi
  starship
  wallpapers
)
for i in ${foldnames[@]}
do
  if [[ ! -d $HOME/.config/$i ]]; then
    ln -s $REPO/cfg/$i $CONF
    printf "Se linkeo la carpeta '$i'\n"
  else
    printf "ya existe '$i'\n"
  fi
  # echo "$i"
done
}
archivos() {
  filename=(
  .fehbg
  .zshrc
  .tmux.conf
)
for i in ${filename[@]}
do
  if [[ ! -f $HOME/$i ]]; then
    ln -s $REPO/$i $HOME
    printf "Se linkeo el archivo '$i'\n"
  else
    printf "ya existe '$i'\n"
  fi
done
}

if [[ -d $HOME/.mozilla/ ]]; then
  cd $HOME/.mozilla/firefox/
  printf "Firefox: Existe carpeta .mozila\n"
  prueba=(*.default-release)
  if [[ ! -d $prueba/chrome ]]; then
    ln -s $HOME/Downloads/repos/Dotfiles/cfg/firefox/chrome/ ~/.mozilla/firefox/$prueba
    echo "Firefox: Se ha instalado la carpeta, reinicia firefox"
  else
    printf "Ya existe carpeta una carpeta llamada 'chrome'\n"
  fi
else
  printf "No existe carpeta '$HOME/.mozila'"
fi

clear
printf "Comprobando scripts"

bin() {
names=(
  lf-ueberzug
  lf-ueberzug-cleaner
  lf-ueberzug-previewer
  lfrc-ueberzug
)

for_i
}


carpetas
archivos
# bin
