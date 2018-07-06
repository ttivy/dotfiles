#!/bin/bash

echo 'Install dotfiles'
# homeに移動
cd ~
# gitがなければインストール
type git &>/dev/null || sudo apt-get install git
# リポジトリをcloneする
git clone https://github.com/ttivy/dotfiles
# シンボリックリンクを生成
. ~/dotfiles/scripts/deploy.sh
echo 'Finished'

