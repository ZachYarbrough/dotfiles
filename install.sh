#!/bin/bash

create_symlinks () {
  # Creates symlinks for config files
  ln -s $HOME/.dotfiles/zsh/zshrc.symlink $HOME/.zshrc
  ln -s $HOME/.dotfiles/git/gitconfig.symlink $HOME/.gitconfig
  ln -s $HOME/.dotfiles/git/gitconfig.local.symlink $HOME/.gitconfig.local

  # Creates symlink for nvim directory
  mkdir $HOME/.config
  ln -s $HOME/.dotfiles/nvim $HOME/.config/nvim
  
  # Creates symlink for tmux directory
  ln -s $HOME/.dotfiles/tmux $HOME/.tmux
  mkdir $HOME/.config/tmux
  ln -s $HOME/.dotfiles/tmux/tmux.conf.symlink $HOME/.config/tmux/tmux.conf

  # Creates symlink for bash scripts
  mkdir $HOME/bin
  ln -s $HOME/.dotfiles/bin $HOME/bin
}

setup_brew_files () {
  # Installs homebrew
  -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Installs dependencies based on the Brewfile
  brew bundle --file $HOME/.dotfiles/homebrew/Brewfile
}

start_cron_jobs () {
    # Create a cron job for git-backup.sh that will run every hour
    echo "0 * * * * $HOME/bin/git-backup.sh $HOME/Documents/notes" | crontab -
}

create_symlinks
setup_brew_files
start_cron_jobs
