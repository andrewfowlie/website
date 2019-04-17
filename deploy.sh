#!/bin/bash

echo -e "\033[0;32mCommitting website\033[0m"

message=${1:-"Updating website"}

git add -A
git commit -m "${message}"
git push 

echo -e "\033[0;32mDeploying website\033[0m"

message=${1:-"Deploying website"}

(

# Build website

hugo

cd public

# Add changes to git

git add -A
git commit -m "${message}"
git push 

)
