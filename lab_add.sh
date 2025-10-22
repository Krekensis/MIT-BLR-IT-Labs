#!/bin/bash

# Usage:
#   ./lab_manager.sh <add|update> <repo_path_or_url> <semester_folder> <lab_folder_name> [branch]
#
# Examples:
#   ./lab_manager.sh add ../Lab1 sem2 Lab1 main
#   ./lab_manager.sh add https://github.com/YourUser/Lab1.git sem2 Lab1 main
#   ./lab_manager.sh update https://github.com/YourUser/Lab1.git sem2 Lab1 main

set -e

ACTION=$1
REPO=$2
SEMESTER=$3
LAB_NAME=$4
BRANCH=${5:-main}

if [ -z "$ACTION" ] || [ -z "$REPO" ] || [ -z "$SEMESTER" ] || [ -z "$LAB_NAME" ]; then
  echo "Usage: $0 <add|update> <repo_path_or_url> <semester_folder> <lab_folder_name> [branch]"
  exit 1
fi

REMOTE_NAME="temp_${LAB_NAME}"

echo "Adding remote: $REMOTE_NAME from $REPO"
git remote add "$REMOTE_NAME" "$REPO"

git fetch "$REMOTE_NAME" "$BRANCH"

TARGET_PATH="${SEMESTER}/${LAB_NAME}"

if [ "$ACTION" = "add" ]; then
  echo "Adding $LAB_NAME into $TARGET_PATH"
  git subtree add --prefix="$TARGET_PATH" "$REMOTE_NAME" "$BRANCH" -m "Add $LAB_NAME subtree"
elif [ "$ACTION" = "update" ]; then
  echo "Updating $LAB_NAME in $TARGET_PATH"
  git subtree pull --prefix="$TARGET_PATH" "$REMOTE_NAME" "$BRANCH" -m "Update $LAB_NAME subtree"
else
  echo "Unknown action: $ACTION (use 'add' or 'update')"
  git remote remove "$REMOTE_NAME"
  exit 1
fi

# Step 4: Clean up temporary remote
echo "Removing temporary remote..."
git remote remove "$REMOTE_NAME"

echo "✅ Done! $ACTION completed for $LAB_NAME"
