---
title: pow + rbenv で便利なRackサーバ環境を構築
date: 2013-03-24 19:17 JST
tags: pow, rbenv, Ruby on Rails, Mac
---

Mac OS XのMountain LionでRack環境をローカルに構築する手順です。  
powの便利なところはプロジェクト毎にURLを割り当てられるだけでなく、同一LAN内であれば他PCからでもスマホからでも見れることです。  

powのインストールにはいくつか方法がありますが、個人的にはcurlでインストールするのがベストではないかと思います。  
homebrewを使う方法やソースからビルドなどもありますが、依存ライブラリが最新バージョンだとpowが動作しなかったりと余計なハマりどころがあるので、brewでないと嫌だとかそういったこだわりが無い限りはあまりオススメできないかと。。。（実際にnode.jsのバージョン依存で、原因がわかるまでにかなり時間を費やしました）

## 1. pow インストール

powをインストールします。

```
$ curl get.pow.cx | sh
```

これだけでインストール完了です。  
（こんなに簡単なら最初からこっちでインストールしておけばよかった）

次にアプリケーションをpowで動作させるための設定手順です。

## 2. powの共通設定

rbenvを読みこませるために次のように設定します。  
全プロジェクト共通で設定を行う場合は .powconfig に追加します。

```
$ echo 'eval "$(rbenv init -)"' >> ~/.powconfig
```

## 3. プロジェクト毎の環境設定

まず、powで動作させたいアプリケーションへのシンボリックリンクをはります。  
ここでは、設定したいプロジェクトをprojectとします。

```
$ cd ~/.pow
$ ln -s ~/[プロジェクトのディレクトリ]/project project
```

また、プロジェクト毎にpowの設定をしたい場合はprojectフォルダに .powrc を置きます。  
例えば、仮にproject_bだけrubyのバージョンを2.0.0-preview1にしたいとします。

```
$ echo 'rbenv local 2.0.0-preview1' >> ~/.pow/project_b/.powrc
```

これでproject_bのプロジェクトのみ、ruby 2.0.0-preview1で動作するようになります。

## 3. powの再起動

最後にpowを再起動して完了です。  
restart.txtというのをプロジェクトフォルダのtmpディレクトリに置くと再起動してくれます。

```
$ touch ~/.pow/project/tmp/restart.txt
```

以上のようにして環境の構築が完了です。  
あとは次のようなURLを叩けば、アプリケーションにアクセスできるようになります。

```
http://[プロジェクト名].dev/
http://project.dev/
http://project_b.dev/
```

また、同一LAN内の他PCやスマートフォンなどから参照する場合は次のURLになります。  
※仮にIPアドレスを `192.168.0.10` とします。

```
http://[プロジェクト名].[IPアドレス].xip.io/
http://project.192.168.0.10.xip.io/
http://project_b.192.168.0.10.xip.io/
```
