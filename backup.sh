#!/bin/bash

# Variables
DIRECTORY_TO_BACKUP="$1"      # First argument is the directory to back up
BACKUP_FOLDER="backup"         # Backup folder
TIMESTAMP=$(date +"%Y%m%d_%H%M%S") # Current date and time
BACKUP_FILE="${DIRECTORY_TO_BACKUP##*/}_$TIMESTAMP.tar.gz" # Backup file name

# Create backup folder if it doesn't exist
mkdir -p "$BACKUP_FOLDER"

# Check if the directory exists
if [[ -d "$DIRECTORY_TO_BACKUP" ]]; then
    # Compress the directory
    tar -czf "$BACKUP_FOLDER/$BACKUP_FILE" -C "$DIRECTORY_TO_BACKUP" .
    echo "Backup of '$DIRECTORY_TO_BACKUP' created at '$BACKUP_FOLDER/$BACKUP_FILE'."
else
    echo "Error: Directory '$DIRECTORY_TO_BACKUP' does not exist."
fi
