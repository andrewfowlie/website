#!/bin/bash

echo -e "\033[0;32mCommitting website\033[0m"

git add -A
git commit -m "Updating website"
git push 

echo -e "\033[0;32mDeploying website\033[0m"

(

# Build website

hugo

cd public

# Add changes to git

git add -A
git commit -m "Deploying website"
git push 

)
