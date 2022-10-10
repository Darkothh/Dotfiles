#!/bin/bash

DIR2GIT="$HOME/Downloads/repos/Dotfiles/.config"
DIRHOME="$HOME/Downloads/repos/Dotfiles/home"
sudo cp -r "$HOME/.tmux/plugins/custom/" "$DIR2GIT/tmux/"
sudo cp -r "$HOME/.local/share/fonts/" "$DIRHOME"
sudo cp -r "$HOME/.config/waybar" "$DIR2GIT"
sudo cp -r "$HOME/.config/obs-studio/" "$DIR2GIT"
sudo cp -r "$HOME/.config/hypr/" "$DIR2GIT"
sudo cp -r "$HOME/.config/BetterDiscord/themes/" "$DIR2GIT"
sudo cp -r "$HOME/.config/wezterm/" "$DIR2GIT"
sudo cp -r "$HOME/.config/rofi/" "$DIR2GIT"
sudo cp -r "$HOME/.config/kitty/" "$DIR2GIT"
# FILES
sudo cp "$HOME/.tmux.conf" "$DIR2GIT/tmux/"
sudo cp "$HOME/.local/bin/wrappedHl" "$DIR2GIT"
sudo cp "$HOME/.tmux/plugins/tmux/catppuccin-macchiato.tmuxtheme" "$DIR2GIT/tmux/"
sudo cp "$HOME/.zshrc" "$DIRHOME"
sudo cp "$HOME/.config/starship.toml" "$DIR2GIT"
