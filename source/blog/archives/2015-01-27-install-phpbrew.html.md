---
title: PHPBrew で PHP の複数バージョン管理を行う
date: 2015-01-27 23:50 JST
tags: php, PHPBrew
---

PHPの複数のバージョンを管理できるツールとして、有名どころとしてphpenvやPHPBrewがあります。
どちらもとても優れたツールですが、PHPBrewのほうが個人的に使い勝手がいいと思っています。
また、phpenvは注意しないとrbenvと干渉してしまうため（phpenvのほうが干渉する）、
ここではPHPBrewについて書いていきます。

## 1. インストール手順

インストールは簡単で下記のように入力していきます。

```
$ curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew
$ chmod +x phpbrew
$ sudo mv phpbrew /usr/bin/phpbrew
```

インストール後、初期設定を行います。

```
$ phpbrew init
```

.bashrcか.zshrcに以下のコマンドを記載して、シェル起動時にPHPBrewの設定が読み込まれるようにします。
※bashもzshも同じ記載内容

```
source ~/.phpbrew/bashrc
```

<!--
これで最低限の設定は完了ですが、Homebrewを使っている場合は下記のコマンドを入力しておくと、
ライブラリによって `php install` 時にはHomebrewで入れたディレクトリを考慮してくれるようです。

```
$ phpbrew lookup-prefix homebrew
```
-->

これでPHPの複数バージョン管理ができるようになりました。
使い方はphpbrewのヘルプをみるとだいたい分かるかと思います。

## phpbrew コマンド一覧（例）

```
phpbrew list
phpbrew known --update
phpbrew known --old
phpbrew install 5.4.0 +default
phpbrew install --test 5.4.0
phpbrew use 5.6.4
phpbrew switch 5.6.4
phpbrew off
phpbrew switch-off
```


## phpbrew コマンドの詳細ヘルプ

例えば `phpbrew known` のコマンドを調べたいときは次のようにします。

```
$ phpbrew help known
NAME
known - List known PHP versions

SYNOPSIS
/usr/bin/phpbrew known [options]


OPTIONS
-m, --more
Show more older versions

-o, --old
List old phps (less than 5.3)

-u, --update
Update release list


phpbrew 1.18.4		powered by https://github.com/c9s/CLIFramework
```
