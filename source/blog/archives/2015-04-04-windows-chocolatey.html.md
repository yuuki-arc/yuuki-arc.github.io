---
title: Windows 7でパッケージ管理システム「Chocolatey」を導入する
date: 2015-04-04 18:00 JST
tags: Windows,Chocolatey
---

パッケージ管理システムとは、コマンド一つでツールやソフトウェアのインストールやアップデート、アンインストールなどが簡単にできるようになるツールのことです。

MacではMacPortsや最近だとHomebrewが有名ですが、
まだまだMac環境には及ばないもののWindowsでも最近はChocolateyというものがあります。
（チョコレーティと呼ぶそう）  
Windowsの特質上、Chocolateyからのアンインストールは不完全なようですが、
それでも手軽にインストールしたりパッケージ管理できるのはそれだけで十分なメリットといえます。

ここでは、その「Chocolatey」のインストール方法と使い方について書いていきます。

## 参考
Chocolateyは **v0.9.9.x** から大幅にドキュメントが更新されていて、該当バージョン以降は下記のwikiを参照するのがよいようです。

[Home · chocolatey/choco Wiki](https://github.com/chocolatey/choco/wiki)

## 前提条件

ここでは **v0.9.9.4（2015年4月4日時点の最新版）** をベースにします。
これからインストールする人は気にしなくともよいですが、
**v0.9.8.24** からChocolateyのインストール先が変更になっていて、
現在は `C:\ProgramData\chocolatey` にインストールされます。

## 1. Chocolateyインストール

インストール方法は、コマンドプロンプトやPowerShellを使う方法などいくつかあります。
コマンドプロンプトからインストールするのが一番手軽なので、その方法で進めることにします。

1. コマンドプロンプトを右クリックして **「管理者として実行」** を選択する
2. 以下のコマンドを貼り付けて実行

```
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))) >$null 2>&1" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```

実行が終わったら下記のコマンドでインストールされているか確認できます。
正常にインストールできていれば `Chocolatey v0.9.9.4` が表示されるはずです。

```
C:\> clist -lo
Chocolatey v0.9.9.4
0 packages installed.
```

ここでいったんWindowsを再起動しておきます。
理由は、Chocolateyのインストールによって環境変数が追加されるためです。
追加された環境変数を確実に読み込ませるために、Windowsを再起動しておいたほうが安全だからです。

```
ChocolateyInstall=C:\Chocolatey
Path=...:C:Chocolatey\bin:...
```

これでChocolateyが使えるようになったので、次からはパッケージを入れていきます。

## 2. ChocolateyGUIインストール

Chocolateyはコマンドベースですが、GUIツールも用意されています。
そこでGUIツールをChocolateyを使ってインストールしてみます。

**「管理者として実行」しているコマンドプロンプト** で実行します。  
※ コマンドプロンプトは「管理者として実行」でないとインストールに失敗します。

```
C:\> cinst -y chocolateygui
```

いろいろメッセージが流れますが、下記のように成功メッセージが流れていればOKです。

```
 :
PowerShell v4.0.20141001
 :
 powershell has been installed successfully.

ChocolateyGUI v0.13.1
 :
 chocolateygui has been installed successfully.

Chocolatey installed 2/2 package(s). 0 package(s) failed.
 See the log for details.
```

終わったらスタートメニューにChocolateyGUIが追加されているので起動してみましょう。

![](2015-04-04/2015_04_04_17_28.png)

## コマンド各種

下記のコマンドリファレンスを見るのが一番ですが、ひと通り使用方法を書きます。

[CommandsReference · chocolatey/choco Wiki](https://github.com/chocolatey/choco/wiki/CommandsReference)

* 基本は `choco ...` というコマンドで、省略形が `c...` になる
* `[pkgname]` は複数指定できる
* オプション指定は `-`、`--`、`/` のどれでも同じ意味になる  
  （リファレンスには、一文字オプションで `--` は使うべきでないと記載）

### インストール

パッケージをインストールします。  
`-y` をつけるとスクリプト毎の実行確認がでなくなるので楽です。

```
C:\> choco install [pkgname]
C:\> cinst [pkgname]
C:\> cinst [pkgname] [pkgname] -y
```

### アップグレード

パッケージをアップグレードします。  
パッケージ名に `all` を指定すると、インストールしているパッケージすべてをアップグレードします。

```
C:\> choco upgrade [pkgname]
C:\> cup [pkgname]
C:\> cup all
```

### アンインストール

パッケージをアンインストールします。
ただし、Chocolateyの管理対象から外れるだけでファイル自体は残っているため、
パッケージ毎に推奨される方法で別途アンインストールが必要になります。

```
C:\> choco uninstall [pkgname]
C:\> cuninst [pkgname]
```

### Chocolateyで管理できるパッケージの全一覧

パッケージ管理対象の一覧が表示されます。
表示されるまで少し時間がかかります。
`search` も `list` も同じで違いはないです。

```
c:\> choco search
c:\> choco list
c:\> clist
```

### インストール済みパッケージ一覧

`--localonly`、`-lo`、`-l` をつけることでインストール済みパッケージの一覧を表示できます。

```
c:\> choco list --localonly
c:\> clist -lo
c:\> clist -l
```

### ヘルプ

コマンド名に `-h` をつけるとそのコマンドのヘルプが参照できます。

```
c:\> choco -h
c:\> choco install -h
c:\> cinst -h
```

### 非推奨となったコマンド

下記のコマンドは非推奨になっているので今後使えなくなります。

```
c:\> choco update ...
c:\> choco version ...
c:\> cver ...
```
