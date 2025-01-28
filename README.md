# Zach's Dotfiles
> I primarily work on a M2 Macbook Pro so all of my configs are geared towards the MacOS. I plan to eventually add instructions/setup for Windows as well.

## Installation for MacOS

Install Apple's Command Line Tools, which are prerequisites for Git and Homebrew.
```
xcode-select --install
```

Clone repo into new hidden directory.
```
# Use SSH (if set up)...
git clone git@github.com:ZachYarbrough/dotfiles.git ~/.dotfiles

# Or use HTTPS and switch remotes later.
git clone https://github.com/ZachYarbrough/dotfiles.git ~/.dotfiles
```

Run the below command to create symlinks in the Home directory for all config files in the repo as well as install homebrew and its dependencies.
```
bash ~/.dotfiles/install.sh
```
