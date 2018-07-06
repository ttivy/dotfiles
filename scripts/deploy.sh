#!/bin/bash

echo 'Deploy dotfiles'
# 最新版をpullする
cd ~/dotfiles
git fetch origin master
git reset --hard origin/master
# シンボリックリンクを生成
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -snf ./dotfiles/"$f" ~/"$f"
    echo "$f"
done
echo 'Finished'

