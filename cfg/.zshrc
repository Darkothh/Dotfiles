export ZSH="$HOME/.oh-my-zsh"
export ZK_NOTEBOOK_DIR="$HOME/.notes"
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export TERMINAL="kitty"

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

#STARSHIP THEME
# export STARSHIP_CONFIG="$HOME/.config/starship/color/starship.toml" #COLORED 
export STARSHIP_CONFIG="$HOME/.config/starship/dark/starship.toml" #DARK
bindkey -v
# Alias
alias cdc='cd ~/.config/nvim'
alias cdd='cd /home/core/Downloads/repos/Dotfiles/cfg/'
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
alias v='nvim'

unsetopt BEEP
stty stop undef

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ $KEYMAP = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select


plugins=( 
  zsh-autosuggestions
  zsh-syntax-highlighting
  sudo
)

source /usr/share/nvm/init-nvm.sh
eval "$(starship init zsh)"
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
function erase_history { local HISTSIZE=0; }

#compdef please

_please_completion() {
  eval $(env _TYPER_COMPLETE_ARGS="${words[1,$CURRENT]}" _PLEASE_COMPLETE=complete_zsh please)
}

compdef _please_completion please
erase_history
please
