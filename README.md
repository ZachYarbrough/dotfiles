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

### Custom Utilities

I maintain a separate repository for my custom scripts to keep my dotfiles lightweight and modular.  
These utilities include tools and scripts I use regularly in my workflow.  

To install them, visit my utilities repository: https://github.com/ZachYarbrough/utilities

You can clone it anywhere you like, but I recommend placing it in `~/Documents/projects/utilities` or a similar location.  
Some scripts can be symlinked to `~/bin` so they are globally accessible from the terminal:

```bash
git clone https://github.com/ZachYarbrough/utilities.git ~/Documents/projects/utilities
ln -s ~/Documents/projects/utilities/fconv/fconv.sh ~/bin/fconv
```
