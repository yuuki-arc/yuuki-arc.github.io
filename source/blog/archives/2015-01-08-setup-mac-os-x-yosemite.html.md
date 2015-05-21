---
title: homesick+Brew-file+MackupでMac環境構築（OS X Yosemite編）
date: 2015-01-08 02:00 JST
tags: Mac,Yosemite,homebrew,Mackup,Brew-file,homesick,dotfiles,zsh
---

これまでMavericksでしたが、マシンが不安定になってきたこととハードディスクの容量を圧迫してきたため、
YosemiteにクリーンインストールしてゼロからMacの環境を構築しました。  

環境構築するにあたって主に使用するツールは下記になります。

* [homesick](https://github.com/technicalpickles/homesick)でdotfiles管理
* [Brew-file](https://github.com/rcmdnk/homebrew-file)でhomebrew(+brew-cask)の各種アプリをインストール
* [Mackup](https://github.com/lra/mackup)でdropbox経由でアプリ設定を同期


Brew-fileに関しては、作者の方の紹介エントリがありますのでそちらを参照ください。  
[brew-file: Brewfileを扱うbrewallを改名した - rcmdnk’s blog](http://rcmdnk.github.io/blog/2014/08/26/computer-mac-homebrew/)

いちおうブログに残しますがあくまで個人メモというような形なので、
だいぶ個人の環境に依存してるところがあるかもということをあらかじめ書いておきます。


## 1. セットアップ準備

### SSH公開鍵
githubからセットアップ情報を取得するのでSSH接続するため鍵の作成を行います。  
参考: https://help.github.com/articles/generating-ssh-keys/

#### 作成

```console
$ ssh-keygen -t rsa -C hoge@hoge.com -f ~/.ssh/github_rsa
※passphraseは空でいいので何も入力しないでそのままEnterを押す

$ cat ~/.ssh/github_rsa.pub >> ~/.ssh/authorized_keys
$ chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys
$ echo "IdentityFile ~/.ssh/github_rsa" >> ~/.ssh/config
```

#### SSH公開鍵をgithubに登録

```console
$ pbcopy < ~/.ssh/github_rsa.pub
```

githubの[SSH keys](https://github.com/settings/ssh)ページで **Add SSH Key** ボタンで登録

### Xcode関連のインストール
この後のdotfiles環境構築するにあたって、
Xcode及びCommand Line Toolsが入っていることが前提となるため事前にインストールします。

```console
$ xcode-select --install
$ sudo xcodebuild -license
※ `license agreements` が表示されるので `agree` を入力してEnterを押す
```

## 2. dotfilesをベースに環境構築

### homesickインストール
[homesick](https://github.com/technicalpickles/homesick)を使ってdotfilesをローカルにクローンします。  
`homesick clone` は省略形で書くとhttpsで取得してしまうため、明示的にSSH接続で取得してます。

```console
$ sudo gem install homesick
$ homesick clone git@github.com:yuuki-arc/dotfiles.git
$ homesick symlink dotfiles
```

### Brew-fileでアプリの一括インストール
homebrewパッケージ管理には[Brew-file](https://github.com/rcmdnk/homebrew-file)を使っているので、
下記の手順でインストールします。
また、brew-caskのインストール先は個人的に `/usr/local/Caskroom` にしたいので、あらかじめexportしておきます。  
※homebrewとbrew-caskはBrew-fileのインストールと同時に入るため明示的に入れなくてもOK。


```console
$ curl -fsSL https://raw.github.com/rcmdnk/homebrew-file/install/install.sh |sh
$ brew file set_repo -r yuuki-arc/Brewfile
$ export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/usr/local/Caskroom"
$ brew file update
```

クリーンインストール後にセットアップしていて気付いたのですが、下記の点に関しては今後の改善材料です。

* 依存関係でひっかかるアプリがあるのでその都度個別に `brew install` しないといけない
* サービスの自動起動設定(※)は個別に行う必要がある

#### ※ サービスの自動起動設定
```
ln -sfv /usr/local/opt/mysql55/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/jenkins/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/mongodb/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
```

### シェルをzshに切り替え
これまでの手順で必要なものは揃ってるので下記のコマンドを入力すればOK。

```console
$ sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
$ cat /etc/shells
$ chsh -s /usr/local/bin/zsh
```

## 3. Mackupでアプリ毎の設定をリストア
アプリ毎に設定している内容を[Mackup](https://github.com/lra/mackup)を使ってリストアします。
Dropboxで同期しているので、事前にDropboxを起動してローカルに同期しておきます。  
※ Mackup管理のファイルがhomesick管理のファイルとバッティングする可能性があることに注意。
（Mackupでどのファイルがリストアされるか、アプリごとに確認しておく）

Mackupはpipでインストールします。  
pipはデフォルトで入っているようです？（ここは最初からなのか、いつの間にか入ったのか曖昧）

1. Dropboxのアプリを起動してローカルにファイルを同期する
2. Mackupでリストアする

```
$ pip install mackup
$ mackup restore
```

私の場合は、iTerm2の設定もMackupで管理していて、この手順によってiTerm2の設定もリストアされたので、
以降の手順についてはiTerm2を起動して作業します。（単に使いやすさの話で、ターミナルで引き続き作業でも問題無い）

## 4. 周辺ツールのインストール

git cloneで入れるところ、Brew-fileではうまくいかなかったものをここで入れます。
※Brew-fileでうまくいかなかったのは私の記述の問題かも？

```console
$ git clone https://github.com/amatsuda/gem-src.git ~/.rbenv/plugins/gem-src
$ git clone https://github.com/laprasdrum/phpenv.git ~/.phpenv
$ brew install vim --with-python --with-ruby --with-perl
$ brew cask install --caskroom=/Applications google-chrome
$ brew cask install --caskroom=/Applications firefox-ja
$ brew cask alfred link
```

## 5. OS Xの環境設定

OS Xの環境設定を行います。  
コマンドで設定できる箇所はコマンドで設定していきます。

```
# Finder - 隠しファイル表示
defaults write com.apple.finder AppleShowAllFiles -bool yes
# Finder - タイトルをフルパス表示
defaults write com.apple.finder _FXShowPosixPathInTitle -bool yes
# QuickLook - 閲覧中ファイルの文字列を選択コピー可能に
defaults write com.apple.finder QLEnableTextSelection -bool yes

killall Finder

# Dock - MissonControlのアニメーションスピードを速く
defaults write com.apple.dock expose-animation-duration -float 0.15
# Dock - スペース表示高速化
defaults write com.apple.dock workspaces-swoosh-animation-off -bool yes
#  ダッシュボードを無効化
defaults write com.apple.dashboard mcx-disabled -bool yes
## アプリ隠しをDock上で半透明で表現
defaults write com.apple.Dock showhidden -bool yes

killall Dock

# マウスの速度を変える
defaults write .GlobalPreferences com.apple.trackpad.scaling 5

# ネットワーク接続時の.DS_Store作成を抑制
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# 保存ダイアログを常に展開状態にする
defaults write -g NSNavPanelExpandedStateForSaveMode -bool yes
```


上記以外の箇所は下記エントリのように設定しました。

* [MacBook Proを購入して最初にやること - システム環境設定](/blog/2012/01/08/setup-mac-system/)
* [MacBook Proを購入して最初にやること - Finder](/blog/2012/01/08/setup-mac-finder/)

## 6. その他の設定

その他、下記のような内容を設定しました。

* アンチウィルスソフト（これは **1. セットアップ準備** の前にインストール）
* 有料ツールのライセンス情報を入力
* Microsoft Officeなどの個別にインストールするツール

他にも使っていくうちに設定しないといけないものがでてくるとは思いますが、ひとまずこんな感じで。
