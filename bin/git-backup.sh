#!/bin/bash

# check if the user passed an argument through
if [ -z "$1" ]; then
    echo "Usage: git-backup.sh <path/to/directory>"
    exit 1
fi

# checks if the directory is valid
if [ -d "$1" ]; then

    # cd into the .git directory
    cd "$1"

    # checks if the directory has a .git directory
    if [ -d ".git" ]; then

	# checks if there are staged/unstaged changes
	if [[ `git status --porcelain` ]]; then
	    # get the current date (i.e. 2025-01-31 12:31:34 AM)
	    current_date=$(date "+%Y-%m-%d %H:%M:%S %p")
	  
	    # pull. add, commit, and push to main
	    git pull origin main
	    git add .
	    git commit -m "Automatic backup @(${current_date})"
	    git push origin main
	fi
    else
	echo -e "path provided is not a valid git directory.\nPlease ensure the path is correct and a .git directory is present."
    fi
else
    echo -e "The path provided is not a valid directory. Please ensure the path is correct."
fi

