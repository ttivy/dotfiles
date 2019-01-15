#!/bin/bash

echo 'Deploy dotfiles'
# 最新版をpullする
cd ~/dotfiles
git fetch origin master
git reset --hard origin/master
# シンボリックリンクを生成
cd ~/dotfiles/home
for f in .??*
do
    [[ "$f" == ".DS_Store" ]] && continue

    echo "$f"
    ln -snf ./"$f" ~/"$f"
done
echo 'Finished'

