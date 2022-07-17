#!/usr/bin/env bash

# zshをデフォルトシェルにする
chsh -s $(which zsh)

LC_ALL=C xdg-user-dirs-update --force

rm -rf $HOME/デスクトップ \
$HOME/ダウンロード \
$HOME/テンプレート \
$HOME/公開 \
$HOME/ドキュメント \
$HOME/音楽 \
$HOME/画像 \
$HOME/ビデオ
