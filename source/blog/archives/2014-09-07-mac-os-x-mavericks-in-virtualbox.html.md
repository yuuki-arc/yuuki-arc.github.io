---
title: VirtualBoxで仮想Mac OS X(Mavericks)環境を構築する
date: 2014-09-07 12:35 JST
tags: VirtualBox,Mac,Mavericks
---

Mac OS Xで動作するVirtualBoxで、さらにMac OS Xの仮想環境を構築しようという内容です。  
試したのは2〜3ヶ月前ですが今でも問題なく作れるはず。

仮想環境を構築するためにはiESDというツールを使います。
作者の方のページに環境構築方法も書いてましたのでそのまま参考にしました。

[OS X on OS X - 夏樹の時間](http://ntk.me/2012/09/07/os-x-on-os-x/)

## 1. OS X Mavericksのインストーラをダウンロード
App StoreからMavericksをダウンロードします。  
インストール中に作られるファイルを使うので、すでにMavericksの人も同じようにダウンロードしてください。

ダウンロードするとアプリケーションフォルダに **OS X Mavericks インストール.app** が作られます。
このとき、同時にインストーラが立ち上がりますがキャンセルしてください。

## 2. VirtualBox用のOS X Mavericksイメージを作成

下記のコマンドを実行します。  
カレントディレクトリに Mavericks.dmg が作られます。

```
$ gem install iesd
$ iesd -i /Applications/Install\ OS\ X\ Mavericks.app -o Mavericks.dmg -t BaseSystem
```

### マシンによっては必要な手順

#### *Intel Haswell CPU (Macs after 2013)* の場合

下記のコマンドが必要になります。
私のMacは対象だったのでこのコマンドを実行しました。  
※ "Mac OS X Mavericks" の箇所は、環境によって異なるかもしれませんが *&lt;vmname&gt;* が入ります。

```
$ VBoxManage modifyvm "Mac OS X Mavericks" --cpuidset 00000001 000306a9 00020800 80000201 178bfbff
```

#### *Mac Pro Early 2009* または *ECC memory搭載* のMacの場合

iesd実行時に `--uninstall-extension` のオプションも合わせて指定する必要があるようです。

```
$ iesd -i /Applications/Install\ OS\ X\ Mavericks.app -o Mavericks.dmg -t BaseSystem --uninstall-extension AppleTyMCEDriver.kext
```

## 3. VirtualBoxで新規VMを作成

VirtualBoxを起動して新規にVMを作成します。
私の場合は以下の様な設定にしました。

![](2014-09-07/2014-09-07-1-virtualbox-settings.png)

## 4. Mavericksを仮想環境でインストール

作成したVMを起動して、Mavericks.dmgをセットします。  
OS X インストーラが起動したら、まずはディスクフォーマットを行います。
ディスクフォーマットは以下の手順で行います。

1. 画面上部のメニューバーから[ユーティリティ]を選択する
2. [ディスクユーテリィティ...]を選択する
3. ダイアログが表示された後、左のリストからディスクを選択する
4. [消去]タブを選択する
5. フォーマットを[Mac OS 拡張 (ジャーナリング)]にして[消去]ボタンを押す

これでディスクがフォーマットされます。  
フォーマットが完了したらディスクユーティリティを終了して、インストーラの続きを行います。

その後は、指示の通りインストールを行っていきます。  
一度再起動するタイミングがありますが、そのときにDVD仮想ドライブからディスクを取り出してください。  
そのまま起動すればインストール完了です。

これで、Mac OS XのVirtualBoxの中で、Mac OS X Mavericksが使えるようになります。

![](2014-09-07/2014_09_07-1-after-install.png)

ただ、実際に起動して使用した感想ですが……レスポンスはあまりよくないです。
とくにグラフィック回りが顕著で、ワンテンポ、ツーテンポぐらい遅れて反応する感覚です。  
メモリを増やしたりCPUのコア数を増やしたりしてみましたが、改善は見られなかったので何らかの用途で使うにも忍耐がいるかもしれません。
