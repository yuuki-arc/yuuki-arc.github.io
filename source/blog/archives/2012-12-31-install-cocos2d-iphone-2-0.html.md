---
title: Cocos2d-iphoneをインストールしてXcodeで使う
date: 2012-12-31 21:34 JST
tags: Cocos2d-iphone, Xcode, Mac
---

先日、Cocos2d-xをインストールしましたが、今度はiPhone用のCocos2d-iphoneをインストールしてみます。

手順はCocos2d-xとまったく同じ…なのですが、環境によってはエラーになる可能性があるのでそのあたりも含めて書いていきます。

## 1. Xcode インストール

Mac App Storeからダウンロードしてインストールします。  
[Mac App Store - Xcode](https://itunes.apple.com/jp/app/xcode/id497799835?mt=12)

## 2. Cocos2d for iPhone ダウンロード

Cocos2d for iPhoneのサイトから最新の安定版をダウンロードしてきます。  
[cocos2d for iPhone | Download](http://www.cocos2d-iphone.org/download)

今の最新版はcocos2d-iphone-2.0でした。

## 3. Cocos2d for iPhoneインストール

ダウンロードしたファイルを解凍します。  
解凍したフォルダを開くと `install-templates-xcode.sh` というファイルがありますので、ターミナルを開いて実行します。

```terminal
$ ./install-templates.sh -u -f
cocos2d-iphone template installer
Installing Xcode 4 cocos2d iOS template
----------------------------------------------------
removing old libraries: /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/
...creating destination directory: /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/
...copying cocos2d files
...copying CocosDenshion files
...copying CocosDenshionExtras files
...copying Kazmath files
...copying template files
done!
Installing Xcode 4 Chipmunk iOS template
----------------------------------------------------
...copying Chipmunk files
done!
Installing Xcode 4 Box2d iOS template
----------------------------------------------------
...copying Box2d files
done!
Installing Xcode 4 CCNode file templates...
----------------------------------------------------
...creating destination directory: /Users/hoge/Library/Developer/Xcode/Templates/File Templates/cocos2d v2.x/
done!
```

これでインストールができました。
ただ、上記のようにスムーズにいけばすぐに終わるのですが、 `install-templates.sh` でエラーが表示されてインストールできないことがあります。  
その場合は、次の3x.の項目を参考にしてください。

## 3x. Cocos2d for iPhoneインストールでエラーになる

`install-templates.sh` を実行すると下記のようなエラーメッセージが表示される場合があります。

```terminal
$ ./install-templates.sh -u -f
cocos2d-iphone template installer
Installing Xcode 4 cocos2d iOS template
----------------------------------------------------
...creating destination directory: /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/
mkdir: /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/: Permission denied
mkdir: /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_cocos2d.xctemplate/libs/: Permission denied
...copying cocos2d files
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_cocos2d.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_cocos2d.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
mkdir: /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_cocosdenshion.xctemplate/libs/: Permission denied
...copying CocosDenshion files
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_cocosdenshion.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_cocosdenshion.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
mkdir: /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_cocosdenshionextras.xctemplate/libs/: Permission denied
...copying CocosDenshionExtras files
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_cocosdenshionextras.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
mkdir: /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_kazmath.xctemplate/libs/: Permission denied
...copying Kazmath files
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_kazmath.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_kazmath.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
...copying template files
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x&quot; failed: Permission denied (13)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
done!
Installing Xcode 4 Chipmunk iOS template
----------------------------------------------------
mkdir: /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_chipmunk.xctemplate/libs/: Permission denied
...copying Chipmunk files
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_chipmunk.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_chipmunk.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
done!
Installing Xcode 4 Box2d iOS template
----------------------------------------------------
mkdir: /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_box2d.xctemplate/libs/: Permission denied
...copying Box2d files
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_box2d.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
rsync: mkdir &quot;/Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x/lib_box2d.xctemplate/libs&quot; failed: No such file or directory (2)
rsync error: error in file IO (code 11) at /SourceCache/rsync/rsync-42/rsync/main.c(544) [receiver=2.6.9]
rsync: connection unexpectedly closed (8 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /SourceCache/rsync/rsync-42/rsync/io.c(452) [sender=2.6.9]
done!
Installing Xcode 4 CCNode file templates...
----------------------------------------------------
...creating destination directory: /Users/hoge/Library/Developer/Xcode/Templates/File Templates/cocos2d v2.x/
mkdir: /Users/hoge/Library/Developer/Xcode/Templates/File Templates/cocos2d v2.x/: Permission denied
mv: rename /Users/hoge/Library/Developer/Xcode/Templates/cocos2d v2.x//CCNode class.xctemplate to /Users/hoge/Library/Developer/Xcode/Templates/File Templates/cocos2d v2.x/: No such file or directory
done!
```

エラーメッセージから推測できますが、`mkdir` で *Permission denied* と出てるので、権限回りがあやしいことに気づくと思います。

```terminal
$ cd /Users/hoge/Library/Developer/Xcode/
$ ls -l
total 1040
drwxr-xr-x  7 hoge  staff     238 12 30 18:13 DerivedData
drwxr-xr-x  4 root    staff     136 12 31 18:15 Templates
drwxr-xr-x  6 hoge  staff     204 12 29 22:03 UserData
drwxr-xr-x  2 hoge  staff      68 10 18 21:38 iOS Device Logs
-rw-r--r--  1 hoge  staff  532480 12 18 01:35 iOS Device Logs.db
$ sudo chown -R hoge Templates
$ ls -l
total 1040
drwxr-xr-x  7 hoge  staff     238 12 30 18:13 DerivedData
drwxr-xr-x  4 hoge  staff     136 12 31 18:15 Templates
drwxr-xr-x  6 hoge  staff     204 12 29 22:03 UserData
drwxr-xr-x  2 hoge  staff      68 10 18 21:38 iOS Device Logs
-rw-r--r--  1 hoge  staff  532480 12 18 01:35 iOS Device Logs.db
```

XcodeのTemplatesフォルダがrootの権限になっていたので、chownでユーザー権限に変更しました。  
これで `install-templates.sh` で正常にインストールできるはずです。

## 4. Cocos2d-iphone のプロジェクトを作成

cocos2d-xと同様にプロジェクトを作成してRunすればサンプルが見られます。

![](blog/images/2012-12-31/20121231_2429682.png)

![](blog/images/2012-12-31/20121231_2429683.png)

グラフィカルなHello Worldが起動しました。  
これでCocos2d-iphoneの環境も整いました！
