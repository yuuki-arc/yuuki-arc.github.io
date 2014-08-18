---
title: Sublime Text 2の導入手順
date: 2013-04-07 10:36 JST
tags: Mac, Sublime Text 2
---

今さらながらといった感はありますが、Sublime Text 2を導入してみました。

どんなものかなと思って入れてみたのですが、実際に使ってみるとエディタはもうこれだけでいいなーと思うぐらい気に入ってライセンスも即購入しました！

今までテキストエディタはCotEditorとMacVim、プログラム（おもにRuby）にはCoda 2を使っていましたが、導入してからはSublime Text 2だけで十分になっています。
各所で話題になっているのもわかりますね。

ということでSublime Text 2の導入手順です。

&nbsp;

## 1. アプリケーションのダウンロード

まずはアプリケーションをダウンロードします。  
[http://www.sublimetext.com/](http://www.sublimetext.com/)

## 2. メニューの日本語化

次にメニューを日本語化します。  
日本語でなくともいいという人は飛ばして構いません。  
日本語化ファイルは次の場所からダウンロードできます。  
[【Windowsアプリケーション】Sublime Text 2 メニュー日本語化 | ゆーがいぶろぐ](http://blog.huwy.org/article/292827228.html)

以下の２つのファイルがダウンロードできます。

 * メニューバー (Main.sublime-menu)
 * コンテキストメニュー (Context.sublime-menu)

この２つのファイルを次のフォルダにコピーします。  
元のファイルは念のため別の場所に退避するなどして残しておきましょう。

```
/Users/[ユーザー名]/Library/Application Support/Sublime Text 2/Packages/Default/
```

これで起動すれば、メニューが日本語化されます。

## 3. パッケージ管理プラグインのインストール

Sublime Textにはパッケージと呼ばれる様々なプラグインがありますが、これらを活用することでSublime Textの便利さが非常に実感できます。  
その前準備として、Sublime Package Controlというパッケージ管理プラグインを入れます。

プラグインはSublime Textを開いている状態でインストールできます。  
起動している状態で [control + `] と入力するとコンソールが画面下部に出てきますので、次のコマンドを入力してエンターを押します。

```
import urllib2,os; pf='Package Control.sublime-package'; ipp=sublime.installed_packages_path(); os.makedirs(ipp) if not os.path.exists(ipp) else None; urllib2.install_opener(urllib2.build_opener(urllib2.ProxyHandler())); open(os.path.join(ipp,pf),'wb').write(urllib2.urlopen('http://sublime.wbond.net/'+pf.replace(' ','%20')).read()); print('Please restart Sublime Text to finish installation')
```

Sublime Textを再起動すると使えるようになります。


## 4. 各種プラグインのインストール

Sublime Package Controlを起動していろいろなプラグインをインストールできるようになります。  
[Command + Shift + P] と入力すると「Command Palette」が開くので、「install」と入力してエンターを押すと起動できます。  
参考までに、私が今のところ入れてるプラグインは以下になります。

*   jQuery
*   jQuery Snippets pack
*   BracketHighlighter
*   SideBarEnhancements
*   SublimeLinter
*   SublimeERB
*   SublimeRailsNav
*   Sublime Text 2 Ruby Tests
*   AutoFileName
*   ColorPicker
*   Hayaku &ndash; tools for writing CSS faster
*   HTML5
*   SublimeCodeIntel
*   All autocomplete
*   local history
*   Sublime Function Display name
*   OmniMarkupPreviewer
*   MarkdownEditing
*   SublimeREPL
*   ConvertToUTF8
*   FileDiffs
*   DashDocs
