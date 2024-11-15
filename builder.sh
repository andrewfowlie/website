#!/bin/bash


action=$1


if [[ "$action" == "setup" ]]; then

    echo -e "\033[0;32mChecking hugo & themes/academic versions\033[0m"

    (
    cd themes/academic || exit
    git checkout v4.2.0
    )

    if hugo version | grep -q v0.59.0; then
        echo "Found hugo v0.59.0: $(hugo version)"
    else
        echo "Wrong or no version of hugo: $(hugo version)"
    fi

    (
    cd public || exit
    git checkout master
    )

fi

if [[ "$action" == "update" ]]; then

    echo -e "\033[0;32mCommitting website\033[0m"

    message=${2:-"update website"}

    git add -A
    git commit -m "${message}"
    git push

fi

if [[ "$action" == "deploy" ]]; then

    echo -e "\033[0;32mBuilding website\033[0m"

    hugo

    echo -e "\033[0;32mDeploying website\033[0m"

    message=${2:-"update website"}

    (
    cd public || exit
    git add -A
    git commit -m "${message}"
    git push
    )

fi
