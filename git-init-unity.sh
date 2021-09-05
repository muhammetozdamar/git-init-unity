#!/bin/bash

while getopts 'r:p:m:' c; do
    case $c in
    r) REPO_ORIGIN=$OPTARG ;;
    p) PROJECT_NAME=$OPTARG ;;
    m) COMMIT_MESSAGE=$OPTARG ;;
    esac
done

# Getting project name from current folder name.
# Also, modify the string so it conforms Github repository name convention. (All lowercase, hypen '-' instead of whitespace ' ')
if [ -z "$PROJECT_NAME" ]; then
    PROJECT_NAME=${PWD##*/}
fi
PROJECT_NAME="${PROJECT_NAME// /-}"
PROJECT_NAME=${PROJECT_NAME,,}

# Commit message default to "first commit"
if [ -z "$COMMIT_MESSAGE" ]; then
    COMMIT_MESSAGE="first commit"
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
