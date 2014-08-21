---
title: 「このアプリケーションで開く」欄の表示がおかしい時の対処方法
date: 2012-12-22 11:24 JST
tags: Mac
---

Macでファイルのコンテキストメニューを開いた時に表示される「このアプリケーションで開く」の欄ですが、ずっとMacを使い続けてると表示がおかしくなっていくことがあります。

![このアプリケーションで開く](2012-12-22/20121222_2416929.png)

この例でいくと「Coda 2.app」「Evernote.app」「Skitch.app」が複数表示されていますが、他にも、すでにアンインストールしたアプリケーションが表示に残っている場合などあります。

このようにおかしくなっている表示をきれいな状態に戻したい場合、ターミナルを開いて以下のコマンドを実行することできれいな状態に戻すことができます。

```
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -f -all local,system,user
```

とくに実行結果などは表示されません。  
コマンドが終了したら再起動すれば正常な状態に戻ってます。
