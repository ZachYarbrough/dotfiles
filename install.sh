#!/bin/bash

create_symlinks () {
  # Creates symlinks for config files
  ln -s ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc
  ln -s ~/.dotfiles/git/gitconfig.symlink ~/.gitconfig
  ln -s ~/.dotfiles/git/gitconfig.local.symlink ~/.gitconfig.local
  
  # Creates symlink for tmux directory
  ln -s ~/.dotfiles/tmux ~/.tmux
  ln -s ~/.dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf

  # Creates symlink for nvim directory
  mkdir ~/.config
  ln -s ~/.dotfiles/nvim ~/.config/nvim

  # Creates symlink for bash scripts
  mkdir ~/bin
  ln -s ~/.dotfiles/bin ~/bin
}

setup_brew_files () {
  # Installs homebrew
  -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Installs dependencies based on the Brewfile
  brew bundle --file ~/.dotfiles/homebrew/Brewfile
}

start_cron_jobs () {
    # Create a cron job for git-backup.sh that will run every hour
    echo "0 * * * * ~/Documents/scripts/git-backup.sh ~/Documents/notes" | crontab -
}

create_symlinks
setup_brew_files
start_cron_jobs
