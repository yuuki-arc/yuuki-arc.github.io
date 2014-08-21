---
title: Mountain LionでRuby on Railsの環境を作る
date: 2012-12-16 16:37 JST
tags: Ruby on Rails, Mountain Lion, homebrew, rbenv, Mac
---

Ruby on Railsをインストールしましたが、手順が多少手間だったこととハマりどころがいくつかあったので作業メモを残しておきます。

## Command Line Tools for Xcode インストール

Xcode はMac App Storeからダウンロードできるのでそこで。  
[Mac App Store - Xcode](https://itunes.apple.com/jp/app/xcode/id497799835?mt=12)

Xcode をダウンロードしてもデフォルトではCommand Line Toolsは入ってないのでインストールしたら起動してダウンロードしてください。  
[Preferences] &rarr; [Downloads] &rarr; [Components] でダイアログを開いて、[Command Line Tools] の [Install] ボタンでインストールできます。

## Homebrew インストール

以下のコマンドでインストールできます。  
インストールしたら -v オプションで確認。

```
$ ruby -e &quot;$(curl -fsSkL raw.github.com/mxcl/homebrew/go)&quot;
$ brew -v
Homebrew 0.9.3
```

## rbenv, ruby-build インストール

homebrewを使ってインストールします。

```
$ brew install rbenv
$ brew install ruby-build
$ echo &#39;eval &quot;$(rbenv init -)&quot;&#39; &gt;&gt; ~/.bash_profile
$ . ~/.bash_profile
$ rbenv
```

## Ruby インストール

Mountain Lionの場合、デフォルトでrubyがインストールされていますが、バージョンが1.8.7（あるいはそれ以下）のため、最新のrubyのバージョンをhomebrewを使って落としてくることにします。

まず最新のバージョンを確認します。

```
$ rbenv install -l
Available versions:
1.8.6-p383
1.8.6-p420
1.8.7-p249
1.8.7-p302
1.8.7-p334
1.8.7-p352
1.8.7-p357
1.8.7-p358
1.8.7-p370
1.8.7-p371
1.9.1-p378
1.9.2-p180
1.9.2-p290
1.9.2-p318
1.9.2-p320
1.9.3-dev
1.9.3-p0
1.9.3-p125
1.9.3-p194
1.9.3-p286
1.9.3-p327
1.9.3-preview1
1.9.3-rc1
2.0.0-dev
2.0.0-preview1
2.0.0-preview2
jruby-1.5.6
jruby-1.6.3
jruby-1.6.4
jruby-1.6.5
jruby-1.6.5.1
jruby-1.6.6
jruby-1.6.7
jruby-1.6.7.2
jruby-1.6.8
jruby-1.7.0
jruby-1.7.0-preview1
jruby-1.7.0-preview2
jruby-1.7.0-rc1
jruby-1.7.0-rc2
jruby-1.7.1
maglev-1.0.0
maglev-1.1.0-dev
rbx-1.2.4
rbx-2.0.0-dev
rbx-2.0.0-rc1
ree-1.8.6-2009.06
ree-1.8.7-2009.09
ree-1.8.7-2009.10
ree-1.8.7-2010.01
ree-1.8.7-2010.02
ree-1.8.7-2011.03
ree-1.8.7-2011.12
ree-1.8.7-2012.01
ree-1.8.7-2012.02
```

リストを見ると `1.9.3-p327` が最新のようです。  
※もしこのリストよりも古いバージョンしか出てこない場合はhomebrewのバージョンが古いと思われるのでbrew updateしてください。

rbenvコマンドでインストールします。  
インストールが終わったらrbenv globalでrubyのバージョンを切り替えます。

```
$ rbenv install 1.9.3-p327
$ rbenv global 1.9.3-p327
```

rubyのバージョンがきちんと切り替わってるか確認します。

```
$ ruby -v
ruby 1.9.3p327 (2012-11-10 revision 37606) [x86_64-darwin12.2.1]
```

もし切り替わってなかった場合は、ターミナルを一度終了して起動しなおしてからもう一度コマンドを打って確認してみてください。

## Ruby on Rails インストール

RubygemsをアップデートしてからRuby on Railsをインストールします。  
Railsのインストール時間を省略するため、ドキュメントはインストールしないようにオプションで。  
rbenv rehashのおまじないをかけて終了です。  
バージョンを確認して最新になっていればOK。

```
$ gem update
$ gem install rails --no-ri --no-rdoc
$ rbenv rehash
$ rails -v
Rails 3.2.9
```

これでRuby on Railsの環境が整いました。
