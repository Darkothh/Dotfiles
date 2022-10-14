#!/bin/bash

# programs=(
# nvim
# node
# dasdajs
# )
# for i in "${programs[@]}"; do
#   if ! command -v "$i" &> /dev/null; then
#     echo "$i No esta instalado"
#   else
#     echo "$i instalado"
#   fi
# done

RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[0m')

CONFPATH="$HOME/.config/"
paths=(
"kitty"
"alacritty"
"awesome"
"picom"
"starship.toml"
)
TOTAL=${#paths[@]}
COUNTER=1
for i in ${paths[@]}; do
  printf "${BOLD}Buscando carpetas ($COUNTER/$TOTAL)${RESET}\n"
  let COUNTER++
  if [ -d $CONFPATH"$i" ]; then
    printf "$i Its a directory\n"
  elif [ -f $CONFPATH"$i" ]; then
    printf "$i Its a file "
  else
    printf "${RED}No se encontro $i${RESET}\n"
  fi
done

# mv ./nvim/ ./nvim.$(date +%Y-%m-%d_%H-%M-%S)
# trap 'printf "ERROOOROROOROR"' 2
# checkinstall() {
# printf "${BOLD}Verificando instalacion de $1...${RESET}\n"
# if pacman -Qi "$1" &> /dev/null; then
#   printf "${GREEN}$1 Esta instalado${RESET}"
# else
#   if paru -S "$1";then
#     printf "Instalar $1? [y=yes/N]\n"
#     read -rp $'Opcion: ' option
#     if [ $option = y ]; then
#       printf "Instalando $1\n"
#     else
#       printf "${RED}No se instalo $0${RESET}\n"
#     fi
#   else
#     printf "${RED}El paquete ${BOLD}$1${RESET} no existe${RESET}"
#   fi
# fi
# }
# checkinstall() {
# printf "${BOLD}Verificando instalacion de $1:${RESET}\n"
# if ! pacman -Qi "$1" &> /dev/null; then
#   printf "${RED}$1 No esta instalado${RESET}\n"
#   printf "Instalar $1? [y=yes/N]\n"
#   read -rp $'Opcion: ' option
#   if [ $option = y ]; then
#     printf "Instalando $1\n"
#     if [ ]
#     printf "${GREEN}Se instalo $1${RESET}\n"
#   else
#     printf "${RED}No se instalo $1${RESET}\n"
#   fi
# else
#   printf "${GREEN}$1 instalado${RESET}\n"
#   sleep 1
#   tput cuu1
#   tput el
# fi
# }
# checkinstall "cowsay"
