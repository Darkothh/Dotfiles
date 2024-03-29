#!/bin/bash
RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[0m')

veri() {
	if [[ ! -d $HOME/"$1" ]]; then
		$2
	fi
	# tput cuu1
	# tput el
}

trap 'printf "\n";stop;exit 1' 2
menu() {
	banner
	printf "1)Instalar Programas y dependecias \n"
	printf "2)Terminal menu \n"
	printf "3)instalar Neovim \n"
	printf "4)instalar Node (nvm) \n"
	printf "q)salir \n"

	read -rp $'Opcion: ' option

	if [[ $option == 1 ]]; then
		installprog
	elif [[ $option == 2 ]]; then
		clear
		terminalmenu
	elif [[ $option == p ]]; then
		prueba
	elif [[ $option == 3 ]]; then
		clear
		vimenu
	elif [[ $option == 4 ]]; then
		nodemenu
	elif [[ $option == q ]]; then
		stop
	else
		clear
		printf "\e[1;93m [!] Opcion invalida! \e[0m\n"
		menu
	fi
}

prueba() {
	printf "(1/3)Instalado Plugins \n"
	veri "dasjdhas" "echo 'no existe $?'"
}

installprog() {
	printf "${BOLD}Comprobando instalaciones...${RESET}\n"
	programs=(
		trash
		xclip
		github-cli
		go
		jdk-openjdk
		feh
		kitty
		nvm
		lazygit
		zsh
		ripgrep
		tmux
		nemo
		lf
		ueberzug
		ecryptfs-utils
		starship
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		noto-fonts-extra
		rofi
		neovim
		unzip
		brillo
		git
		lsd
		bat
	)

	if command -v "yay" &>/dev/null; then
		for i in "${programs[@]}"; do
			if ! pacman -Qi "$i" &>/dev/null; then
				#    printf "${RED}$i No esta instalado${RESET}\n"
				#    printf "Instalar $i? [y=yes/N]\n"
				#    read -rp $'Opcion: ' option
				#    if [ "$option" = y ]; then
				#      printf "Instalando $i\n"
				yay -S "$i" --noconfirm
				#      printf "${GREEN}Se instalo $i${RESET}\n"
				#    else
				#      printf "${RED}No se instalo $i${RESET}\n"
				#    fi
				clear
			else
				printf "${GREEN}$i instalado${RESET}\n"
				tput cuu1
				tput el
			fi
		done
		printf "${GREEN}Todo se instalo correctamente${RESET}\n"
		menu
	else
		printf "${RED} Yay no instalado ${RESET}\n"
		installyay
	fi

}

terminalmenu() {
	banner
	printf "1)Hacer zsh default shell ${YELLOW}(Default shell: $SHELL)${RESET}\n"
	printf "2)Instalar Plugins para zsh y tmux \n"
	printf "3)Volver \n"
	printf "q)salir \n"
	read -rp $'Opcion: ' option

	if [[ $option == 1 ]]; then
		zshdefault
	elif [[ $option == 2 ]]; then
		plugInstall
	elif [[ $option == 3 ]]; then
		clear
		menu
	elif [[ $option == p ]]; then
		prueba
		clear
	elif [[ $option == q ]]; then
		stop
	else
		clear
		printf "\e[1;93m [!] Opcion invalida! \e[0m\n"
		terminalmenu
	fi
}

zshdefault() {
	if (("$EUID" == 0)); then
		printf "Verificando archivo zshrc \n"
		if (! echo "$SHELL" | grep "zsh" &>/dev/null); then
			printf "Haciendo zsh shell por default... \n"
			chsh -s "$(which zsh)"
		fi
		if [ ! -f "$HOME/.zshrc" ]; then
			tput cuu1
			tput el
			printf "Linkeando archivo zshrc... \n"
			ln -s /home/dark/.zshrc "$HOME"
			sleep 1
			tput cuu1
			tput el
			printf "Listo!\n"
		fi
	fi
	clear
	printf "${GREEN}Zsh ahora es la shell por default (recarga la termial)${RESET}\n"
	terminalmenu
}

plugInstall() {
	if (("$EUID" == 0)); then
		printf "Verificando archivo zshrc \n"
		if [ ! -f "$HOME/.zshrc" ]; then
			tput cuu1
			tput el
			printf "Linkeando archivo zshrc... \n"
			ln -s /home/dark/.zshrc "$HOME"
			sleep 1
			tput cuu1
			tput el
			printf "Listo!\n"
		fi
		printf "Verificando starship files\n"
		if [ ! -d "$HOME/.config/starship/" ]; then
			REPO="/home/dark/Downloads/repos/Dotfiles"
			printf "Moviendo archivos\n"
			ln -s $REPO/cfg/starship/root/starship "$HOME/.config/"
		fi
	fi
	printf "Instalando Oh my zsh \n"
	if [ ! -d "$HOME"/.oh-my-zsh ]; then
		sh -c "$(curl -fsSL https://raw.github.com/TroubleC0re/ohmyzsh/master/tools/install.sh)" &>/dev/null
		tput cuu1
		tput el
		printf "${GREEN}Se ha instalado Oh my zsh${RESET}\n"
	fi

	printf "(1/3)Instalado Plugins \n"
	if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &>/dev/null
	fi
	tput cuu1
	tput el
	printf "(2/3)Instalado Plugins \n"
	if [ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &>/dev/null
	fi
	tput cuu1
	tput el
	if [[ ! -d $HOME/.tmux/ ]]; then
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm &>/dev/null
	fi
	printf "(3/3)Instalado Plugins \n"
	sleep 1
	if [ ! -d "$HOME"/.fzf ]; then
		git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf &>/dev/null
		~/.fzf/install
	fi
	tput cuu1
	tput el
	clear
	printf "${GREEN}Se han instalado todos los plugins${RESET}\n"
	printf "${RED}/!\ Reinicia la terminal o ejecuta source ~/.zshrc${RESET}\n"
	terminalmenu
}

vimenu() {
	banner
	printf "1)Instalar neovim\n"
	printf "2)Instalar Dotfiles\n"
	printf "3)Volver \n"
	printf "q)salir \n"
	read -rp $'Opcion: ' option

	if [[ $option == 1 ]]; then
		installneovim
	elif [[ $option == 2 ]]; then
		installdotfiles
	elif [[ $option == 3 ]]; then
		clear
		menu
	elif [[ $option == q ]]; then
		stop
	else
		clear
		printf "\e[1;93m [!] Opcion invalida! \e[0m\n"
		terminalmenu
	fi
}

installneovim() {
	if command -v nvim &>/dev/null; then
		clear
		printf "${GREEN}/!\ Neovim ya esta instalado!${RESET}\n"
		vimenu
	else
		paru -S neovim
	fi
}

installdotfiles() {
	programs=(
		nvim
		node
		go
		java
	)
	for i in "${programs[@]}"; do
		if ! command -v "$i" &>/dev/null; then
			echo "$i No esta instalado"
			# return
		fi
	done
	if [ -d "$HOME"/.config/nvim ]; then
		printf "Existe una carpeta llamada ${RED}nvim${RESET} en ${RED}$HOME/.config/nvim${RESET}\n"
		printf "Quieres renombrarla y continuar? [y=yes/N]\n"
		read -rp $'Opcion: ' option
		if [ "$option" = y ]; then
			clear
			printf "Renombrando...\n"
			mv "$HOME"/.config/nvim/ "$HOME"/.config/nvim."$(date +%Y-%m-%d_%H-%M-%S)"
			sleep 1
			tput cuu1
			tput el
			printf "${GREEN}Renombrado${RESET}\n"
			printf "Instalado archivos...\n"
			git clone https://github.com/TroubleC0re/nvim.git "$HOME/.config/nvim" &>/dev/null
			tput cuu1
			tput el
			printf "${GREEN}Instalado${RESET}\n"
			vimenu
		else
			clear
			printf "${YELLOW}Volviendo${RESET}"
			vimenu
		fi
	else
		printf "Instalado archivos...\n"
		git clone https://github.com/TroubleC0re/nvim.git "$HOME/.config/nvim" &>/dev/null
		clear
		printf "${GREEN}Instalado${RESET}\n"
		vimenu
	fi
}

nodemenu() {
	banner
	printf "1)Instalar node ${YELLOW}(Con nvm)${RESET}\n"
	printf "2)Instalar paquetes de npm\n"
	printf "3)Volver \n"
	printf "q)salir \n"
	read -rp $'Opcion: ' option

	if [[ $option == 1 ]]; then
		installnode
	elif [[ $option == 2 ]]; then
		installpaquetes
	elif [[ $option == 3 ]]; then
		clear
		menu
	elif [[ $option == q ]]; then
		stop
	else
		clear
		printf "\e[1;93m [!] Opcion invalida! \e[0m\n"
		terminalmenu
	fi
}

installnode() {
	if ! command -v "nvm" &>/dev/null; then
		echo "Nvm No esta instalado"
	fi
}

nodemenu() {
	banner
	printf "1)Instalar node ${YELLOW}(Con nvm)${RESET}\n"
	printf "2)Instalar paquetes de npm\n"
	printf "3)Volver \n"
	printf "q)salir \n"
	read -rp $'Opcion: ' option

	if [[ $option == 1 ]]; then
		installnode
	elif [[ $option == 2 ]]; then
		installpaquetes
	elif [[ $option == 3 ]]; then
		clear
		menu
	elif [[ $option == q ]]; then
		stop
	else
		clear
		printf "\e[1;93m [!] Opcion invalida! \e[0m\n"
		terminalmenu
	fi
}

installyay() {
	if ! command -v "yay" &>/dev/null; then
		echo "Instalando yay"
		git clone https://aur.archlinux.org/yay.git /tmp/yay
		cd /tmp/yay/ && makepkg -si
		installprog
	else
		installprog
	fi
}

banner() {
	printf "${BLUE}    ⠀⠀⠀⠀⠀ ⠀⠀ ＿＿＿   ${RESET}\n"
	printf "${BLUE} 　　　　  ／＞　　フ ${RESET}\n"
	printf "${BLUE}　   　　　| 　_　 _  ${RESET}\n"
	printf "${BLUE}　 　　　／  ミ＿)ノ  ${RESET}\n"
	printf "${BLUE}　　 　 /　　　 　 |  ${RESET}\n"
	printf "${BLUE}　　　 /　 ヽ　　 ﾉ   ${RESET}\n"
	printf "${BLUE}　 　  │　　|　|　|   ${RESET}\n"
	printf "${BLUE}　／￣|　　 |　|　|   ${RESET}\n"
	printf "${BLUE}　| (￣ヽ＿_ヽ_)__)   ${RESET}\n"
	printf "${BLUE}　＼二つ              ${RESET}\n"
}

stop() {
	printf "${RED} Saliendo ${RESET}\n"
}

menu
