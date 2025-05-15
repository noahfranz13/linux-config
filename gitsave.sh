#!/bin/bash

# first check if this is a git repository
if [[ ! $(git rev-parse --is-inside-work-tree) ]]; then
    echo "ERROR: This is not a git repository!"
    exit 1
fi

# first display status and prompt to continue
git status

echo
echo "Enter a commit message to continue, or type n to stop..."
read -p "# " MSG
if [[ "$MSG" == "n" ]]; then
  echo "Exiting..."
  exit 0
else
  echo "Okay, commiting and pushing!"
fi
echo

# then commit and push to the github
git add .
git commit -m "$MSG"
git push
