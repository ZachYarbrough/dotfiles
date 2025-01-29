#!/bin/bash

# Directory containing your Markdown files
source_dir="$HOME/Documents/notes/unprocessed"
# Directory where you want to move the files based on the second line
target_base_dir="$HOME/Documents/notes/processed"

mkdir -p "$target_base_dir"

# Loop through all .md files in the source directory
for file in "$source_dir"/*.md; do
    # Check if the file exists (in case no .md files are found)
    if [ ! -f "$file" ]; then
        echo "No Markdown files found in $source_dir"
        break
    fi

    # Get the second line of the file
    second_line=$(sed -n '2p' "$file")

    # Use awk to split the second line on ":" and trim whitespace from the second part
    area=$(echo "$second_line" | awk -F': ' '{print $2}' | xargs)


    # Check if the second line is not empty
    if [ -z "$area" ]; then
        echo "Skipping $file: no area found."
        continue
    fi

    # Crate a target directory based on the second line content
    target_dir="$target_base_dir/$area"
    mkdir -p "$target_dir"

    # Move the file to the corresponding target directory
    mv "$file" "$target_dir/"
    echo  "Moved $file to $target_dir"
done
