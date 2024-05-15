#!/bin/bash

# Define variables
REPO_NAME="my_project"
GITHUB_USER="yourusername"
GITHUB_EMAIL="your.email@example.com"
GITHUB_REPO_URL="https://github.com/$GITHUB_USER/$REPO_NAME.git"

# Check if Git is installed
if ! command -v git &> /dev/null
then
    echo "Git could not be found, please install it first."
    exit 1
fi

# Configure Git
echo "Configuring Git..."
git config --global user.name "$GITHUB_USER"
git config --global user.email "$GITHUB_EMAIL"

# Create a new directory and initialize a Git repository
echo "Creating directory $REPO_NAME and initializing Git repository..."
mkdir $REPO_NAME
cd $REPO_NAME
git init

# Create some files and directories
echo "Creating sample files and directories..."
mkdir dir1 dir2
touch dir1/file1.txt dir2/file2.txt

# Check the status of the repository
echo "Checking repository status..."
git status

# Add files to the staging area
echo "Adding files to staging area..."
git add .

# Commit changes
echo "Committing changes..."
git commit -m "Initial commit"

# Connect to the remote GitHub repository
echo "Connecting to GitHub repository..."
git remote add origin $GITHUB_REPO_URL

# Push changes to GitHub
echo "Pushing changes to GitHub..."
git branch -M main
git push -u origin main

# Create a sample file and make changes
echo "Making changes to a sample file..."
echo "Hello World" > dir1/file1.txt

# Check the status, add changes, commit, and push
echo "Committing and pushing changes..."
git status
git add .
git commit -m "Added Hello World to file1.txt"
git push origin main

# Pull any new changes from the remote repository
echo "Pulling changes from GitHub..."
git pull origin main

# Display the commit history
echo "Displaying commit history..."
git log --oneline

echo "Git setup and basic commands execution completed."
