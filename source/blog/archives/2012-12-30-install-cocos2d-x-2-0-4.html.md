---
title: Cocos2d-xをインストールしてXcodeで使う
date: 2012-12-30 15:51 JST
tags: Cocos2d-x, Xcode, Mac
---

Cocos2d-xというマルチプラットフォームのゲーム開発用フレームワークがあります。  
これをMacにインストールして、Xcodeで使えるようにしていきます。

## 1. Xcode インストール

Mac App Storeからダウンロードしてインストールします。  
[Mac App Store - Xcode](https://itunes.apple.com/jp/app/xcode/id497799835?mt=12)

## 2. Cocos2d-x ダウンロード

Cocos2d-xのサイトから最新の安定版をダウンロードしてきます。  
[Cocos2d-x | Download](http://www.cocos2d-x.org/projects/cocos2d-x/wiki/Download)

今の最新版はcocos2d-2.0-x-2.0.4でした。

## 3. Cocos2d-x インストール

ダウンロードしたファイルを解凍します。  
解凍したフォルダを開くと install-templates-xcode.sh というファイルがありますので、ターミナルを開いて実行します。

```
$ sudo ./install-templates-xcode.sh
Password:
cocos2d-x template installer
Installing Xcode 4 cocos2d-x iOS template
----------------------------------------------------
...creating destination directory: /Users/[ユーザー名]/Library/Developer/Xcode/Templates/cocos2d-x/
...copying cocos2d files
...copying CocosDenshion files
...copying extension files
...copying template files
done!
Installing Xcode 4 Chipmunk iOS template
----------------------------------------------------
...copying Chipmunk files
done!
Installing Xcode 4 Box2d iOS template
----------------------------------------------------
...copying Box2D files
done!
Installing Xcode 4 lua iOS template
----------------------------------------------------
...copying lua files
done!
Installing Xcode 4 JS iOS template
----------------------------------------------------
...copying js files
done!
...copying spidermonkey files
done!
done!
$
```

これでインストールができました。

## 4. Cocos2d-x のプロジェクトを作成

試しにXcodeでcocos2d-xのプロジェクトを作成してみます。  
プロジェクト作成ウィンドウのテンプレート選択で「cocos2d-x」が増えてますのでそれを選びます。

![](blog/images/2012-12-30/20121230_2427857.png)

次の画面のProduct NameやらCompany Identifierの項目は適当に入力してください。  
プロジェクトを作成したら、あとはRunボタンを押すだけでサンプルが起動します。

![](blog/images/2012-12-30/20121230_2427858.png)

グラフィカルなHello Worldが起動しました。  
これでCocos2d-xの環境が整ったのでいろいろゲームアプリを作成していこうと思います！
