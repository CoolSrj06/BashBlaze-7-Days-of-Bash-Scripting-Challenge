#!/bin/bash

backup_dir="$1"
backup_limit=3

if [ -z "$backup_dir" ]; then
    echo "No location given"
    exit 1
fi

# Create a timestamp for the backup folder

timestamp=$(date +'%Y-%m-%d_%H-%M-%S')

# Create the backup folder with the current timestamp
tar -cvzf backup_$timestamp.tar.gz $backup_dir

echo "Backup created"

# Get a list of all backup tar files from the asked directory sorted by name in reverse order
 backup_list=$(find "$backup_dir" -maxdepth 1 -type f -name 'backup_*.tar.gz' | sort -r)

# Determine the number of backups exceeding the backup limit
 backup_count=$(echo "$backup_list" | wc -l)
 backup_excess=$((backup_count - backup_limit))

# Remove excess backup folders (older backups)
if [ "$backup_excess" -gt 0 ]; then
    echo "Removing $backup_excess older backup(s):"
    echo "$backup_list" | tail -n "$backup_excess" | xargs rm -rf
fi

