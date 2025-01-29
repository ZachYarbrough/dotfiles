#!/bin/bash

# If no argument is provided, navigate to the notes directory 
if [ -z "$1" ]; then
    cd "$HOME/Documents/notes"
    nvim "."

    exit 1
fi

cd "$HOME/Documents/notes/unprocessed"

# Get the current date in YYYY-MM-DD format
current_date=$(date "+%Y-%m-%d")

# Replace spaces with hyphens in the passed title
formatted_title="${current_date}_${1// /-}.md"

touch "${formatted_title}"

# Inject Markdown content into the file
echo "---" >> "${formatted_title}"
echo "id: ${current_date}_${1// /-}" >> "${formatted_title}"
echo "aliases: []" >> "${formatted_title}"
echo "area: " >> "${formatted_title}" 
echo "tags: []" >> "${formatted_title}" 
echo "---" >> "${formatted_title}"

nvim "${formatted_title}"

