#!/bin/bash

# Check if a file is provided as argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename=$1

# Check if file exists
if [ ! -f "$filename" ]; then
    echo "File '$filename' not found."
    exit 1
fi

# Read the file, convert to lowercase, and split into words
words=$(tr '[:upper:]' '[:lower:]' < "$filename" | tr -sc '[:alpha:]' '\n' | sort)

# Count occurrences of each word and store in associative array
declare -A word_count
while read -r word; do
    ((word_count[$word]++))
done <<< "$words"

# Sort words by frequency and display the top 5 most frequent words
echo "Top 5 most frequent words:"
for word in "${!word_count[@]}"; do
    echo "${word_count[$word]} $word"
done | sort -rn | head -5
