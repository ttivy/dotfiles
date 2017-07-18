#!/bin/bash

echo 'Install'
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snf ./dotfiles/"$f" ~/"$f"
    echo "$f"
done
