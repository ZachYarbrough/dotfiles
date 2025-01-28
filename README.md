# Zach's Dotfiles

## Installation for MacOS

Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.
```
xcode-select --install
```

Clone repo into new hidden directory.
```
# Use SSH (if set up)...
git clone git@github.com:ZachYarbrough/dotfiles.git

# Or use HTTPS and switch remotes later.
git clone https://github.com/ZachYarbrough/dotfiles.git
```

Run the below command to create symlinks in the Home directory for all config files in the repo as well as install homebrew and its dependencies.
```
bash ~/.dotfiles/install.sh
```
