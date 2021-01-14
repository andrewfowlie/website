#!/bin/bash

echo -e "\033[0;32mChecking hugo versions\033[0m"

(
cd themes/academic
git checkout v4.2.0
)

if hugo version | grep -q v0.59.0; then
    echo "Found hugo v0.59.0: $(hugo version)"
else
    echo "Wrong or no version of hugo: $(hugo version)"
fi

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
