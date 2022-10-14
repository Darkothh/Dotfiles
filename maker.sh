#!/bin/bash
RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[0m')

CONFPATH="$HOME/.config/"
HOMEDIR="$HOME/"
PATH2CP="$HOME/Downloads/repos/Dotfiles/"

verificar() {
paths=(
"kitty"
"alacritty"
"awesome"
"picom"
"starship"
"wallpapers"
".zshrc"
".fehbg"
)
TOTAL=${#paths[@]}
COUNTER=1

for i in ${paths[@]}; do
  printf "${BOLD}Buscando carpetas ($COUNTER/$TOTAL)${RESET}\n"
  sleep 0.1
  tput cuu1
  tput el
  let COUNTER++
  if [ -d "$CONFPATH$i" ]; then
    patverif+=("$i")
  elif [ -f "$CONFPATH$i" ]; then
    patverif+=("$i")
  elif [ -d "$HOMEDIR$i" ]; then
    patverif+=("$i")
  elif [ -f "$HOMEDIR$i" ]; then
    patverif+=("$i")
  else
    printf "${RED}No se encontro $i${RESET}\n"
  fi
done
}
DEVPATH="$HOME/Downloads/repos/Dotfiles/dev/pruebas/"
copiar() {
TOTAL=${#patverif[@]}
COUNTER=1
for i in ${patverif[@]}; do
  if cp -r "$CONFPATH$i" "$PATH2CP" &> /dev/null; then
    printf "${BOLD}Copiando $i($COUNTER/$TOTAL)${RESET}\n"
  elif cp "$CONFPATH$i" "$PATH2CP" &> /dev/null; then
    printf "${BOLD}Copiando $i($COUNTER/$TOTAL)${RESET}\n"
  elif cp -r "$HOMEDIR$i" "$PATH2CP" &> /dev/null;then
    printf "${BOLD}Copiando $i($COUNTER/$TOTAL)${RESET}\n"
  elif cp "$HOMEDIR$i" "$PATH2CP" &> /dev/null;then
    printf "${BOLD}Copiando $i($COUNTER/$TOTAL)${RESET}\n"
  else
    printf "${RED}No se encontro $i\n${RESET}\n"
  fi
  tput cuu1
  tput el
  let COUNTER++
done
printf "${GREEN}Se han copiado todos los archivos correctamente${RESET}\n"
}
verificar
copiar
