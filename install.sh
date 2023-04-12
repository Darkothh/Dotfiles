#!/bin/bash

REPO=$HOME/Downloads/repos/Dotfiles/cfg
SCRIPTS_DIR=/home/dark/Downloads/repos/Dotfiles/bin
CONF=$HOME/.config/

carpetas() {
  printf "\n\n"
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
      ln -s $REPO/$i $CONF
      printf "Se linkeo la carpeta '$i'\n"
    else
      printf "ya existe '$i'\n"
    fi
  done
}

archivos() {
  printf "\n\n"
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

firefox() {
  printf "\n\n"
  printf "Firefox"
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
}

bin() {
  printf "\n\n"
  printf "Comprobando scripts\n"
  if [[ $EUID == 0 ]]; then
    names=(
      lf-ueberzug
      lf-ueberzug-cleaner
      lf-ueberzug-previewer
      lfrc-ueberzug
    )
    for i in ${names[@]}
    do
      if [[ ! -f /usr/local/bin/$i ]]; then
        cp $SCRIPTS_DIR/$i /usr/local/bin/
        printf "Se linkeo el archivo '$i'\n"
      else
        printf "ya existe '$i'\n"
      fi
    done
  else
    printf "No tienes permisos para mover los scripts de lf, corre el programa como administrador!!\n"
  fi
}

root(){
  filename=(
    .zshrc
    .tmux.conf
  )
  for i in ${filename[@]}
  do
    if [[ ! -f $HOME/$i ]]; then
      sudo ln -s $REPO/$i $HOME
      printf "Se linkeo el archivo '$i'\n"
    else
      printf "ya existe '$i'\n"
    fi
  done
}

if [[ ! $EUID == 0 ]]; then
  firefox
  carpetas
  archivos
  bin
else
  root
  bin
fi

