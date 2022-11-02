export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export TERMINAL="kitty"

#STARSHIP THEME
# export STARSHIP_CONFIG="$HOME/.config/starship/color/starship.toml" #COLORED 
export STARSHIP_CONFIG="$HOME/.config/starship/dark/starship.toml" #DARK

# ZSH_THEME="powerlevel10k/powerlevel10k"
bindkey -v
# Alias
alias cdc='cd ~/.config/nvim'
alias cdd='cd /home/core/Downloads/repos/Dotfiles/'
alias cat='/bin/bat'
alias lf='lf-ueberzug'
alias catn='/bin/cat'
alias catnl='/bin/bat --paging=never'
alias g='git'
alias lg='lazygit'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'
alias lst='lsd --tree'
alias vim='nvim'

unsetopt BEEP
stty stop undef


plugins=( 
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
  colored-man-pages
  # zsh-vi-mode
)

source /usr/share/nvm/init-nvm.sh
eval "$(starship init zsh)"
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
