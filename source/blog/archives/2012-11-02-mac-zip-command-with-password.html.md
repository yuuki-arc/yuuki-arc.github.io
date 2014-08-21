---
title: Macでパスワード付きのzip圧縮を行う
date: 2012-11-02 13:34 JST
tags: Mac
---

MacWinZipper (WinArchiver)などのソフトを使わなくとも、簡単なコマンドだけでパスワード付きのzip圧縮ができます。

```
$ zip -e -r original.zip original_dir
Enter password:
Verify password:
adding: original_dir/ (stored 0%)
adding: original_dir/original.xls (deflated 69%)
```

zipコマンドを打って、パスワードを入力するだけです。  
Macのパスワード付き圧縮ソフトは有料であったり、制限付きで使うものが多いですが、無料で手っ取り早くパスワード付きzip圧縮ファイルを作りたいときには便利ですね。
