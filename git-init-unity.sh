#!/bin/bash

# TODO: Make arguments can be flagged so don't have to use hardcoded argument indexes. Lookup getopts.

# Getting remote origin from first argument.
REPO_ORIGIN=$1

# Getting project name from current folder name, if there is a second parameter, use that instead.
# Also, modify the string so it conforms Github repository name convention. (All lowercase, hypen '-' instead of whitespace ' ')
PROJECT_NAME=${PWD##*/}
if [ -n "$2" ]; then
    PROJECT_NAME=$2
fi
PROJECT_NAME="${PROJECT_NAME// /-}"
PROJECT_NAME=${PROJECT_NAME,,}

# Commit message default to "first commit", if there is a third parameter, use that instead.
COMMIT_MESSAGE="first commit"
if [ -n "$3" ]; then
    COMMIT_MESSAGE=$3
fi

# Initializing git
git init

# Creating README.md file and writing project name to it.
echo "# $PROJECT_NAME" >>README.md

echo "Downloading latest version of Unity.gitignore"
# Downloading latest version of Unity.gitignore from gitignore repository and writing to the .gitignore
curl https://raw.githubusercontent.com/github/gitignore/master/Unity.gitignore --output .gitignore

# Add, commit and push to origin.
git add .
git commit -m "$COMMIT_MESSAGE"
git branch -M main
git remote add origin "$REPO_ORIGIN"
git push -u origin main
