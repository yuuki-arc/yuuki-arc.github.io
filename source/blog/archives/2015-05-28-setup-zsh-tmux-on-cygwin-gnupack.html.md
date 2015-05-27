---
title: gnupack(Cygwin) + oh-my-zsh + tmuxの環境を構築する
date: 2015-05-28 8:00 JST
tags: Windows,Cygwin,zsh,tmux
---

Windowsでターミナル環境を構築する手順です。
Windowsのターミナルツールはいろいろあって、どれにしようか悩むところではありますが、
個人的にMacの環境（oh-my-zsh,tmuxあたり）をなるべくそのまま使いたかったので、それに一番合うものを探しました。

とはいうものの、3月末あたりからいろいろ試してみて2ヶ月ほど経った今でも「これがベスト！」と思えるものがないのが実情なのですが、
妥協点には至りましたので、このあたりで記事を書いておこうと思います。

最初に、本題とは少しずれますが、使ってみた主なツールと採用できなかった理由を次の項に書きます。

## Windowsターミナル環境について

### ConEmu
純粋にターミナル環境のツールとしては一番使いやすいと思いました。  
zshの環境もスムーズに構築できました。…が、tmuxが起動しませんでした。  
また、ConEmu内でコマンドプロンプトを起動して、Chocolateyを使うとインストールできてるようで実際にはインストールできてない、
という点も、最初気付かずに地味にハマっていました。（これはツールのせいというより自分が悪いんですが）  
今はChocolatey使うときは純粋にコマンドプロンプトを立ち上げて使うようにしています。
いずれにしろ、tmuxは使いたかったので採用できませんでした。

### MobaXterm
周辺ツールが充実してて、最近までこれでいこうかなと思っていたツールです。
zsh + tmux環境も問題なく作れました。  
ですが、BusyBoxベースというのが思いのほかネックで、RubyまわりやmakeなどをするたびにBusyBox標準のコマンドではエラーになることがあり、
その都度調査しながら使ってました。
BusyBoxコマンドに起因するエラーは、apt-cygでi686-pc-cygwinまわりのパッケージを入れてそちらのlinuxコマンドを指定して解決したり、
ほかにもあったと思いますが、けっこうBusyBoxまわりは自分の環境としては不十分な部分が多かったです。  
さくっとインストールして本来の作業に入りたいのに、いちいちエラーで作業が止まって調査して…みたいなのがいい加減面倒くさくなってきたので採用しませんでした。　　

### babun
ちゃんと試したわけではありませんが、oh-my-zshの環境がデフォルトで揃っていたので入れて試してみるつもりでした。
ただ、デフォルトできっちりと揃いすぎていて、すでにoh-my-zshを入れていてdotfilesで管理している自分の構成には合わなかったので使いませんでした。  
どういうハマりどころがあるか未知数ですが、まっさらな環境でoh-my-zshを使ってみたい人にはいいかも。

### Cygwin（純正 / gnupack）
一番最初に入れたのは純正のCygwinだったのですが、最終的にgnupackのほうに戻ってきました。
最初に入れた時はapt-cygのハッシュアルゴリズム問題（参考：[2015-03-30: ハッシュアルゴリズムの変更 | apt-cyg - PIB](http://seesaawiki.jp/w/kou1okada/d/apt-cyg#20150330-hash-algorithm-changed)）に見事に引っかかって、
公式は全然音沙汰ないしどのfork使えばいいかいまいちわからないし…というような感じでCygwin面倒くさい！と思って敬遠したのですが、
最近試したらぜんぜん面倒くさいことはなかったので、最初の時はタイミングが悪かったですね。  
ちなみにapt-cygのforkに関しては、上でリンクをはったkou1okada氏のサイトで詳しく説明されていて状況がよくわかりました。
ほかにもCygwinまわりのパッチを公開してたり、今現在もアクティブに情報を発信されていて、とても助かってます。

というような感じで、いろいろ試したあとに改めて使ってみて、結局のところCygwinが一番ハマりどころが少なく、
問題に出くわしても解決しやすかったので、これを使うことにしました。
純正のCygwinでも環境構築はできますが、gnupackのほうが手間が少なくなるのでそちらを入れてます。
純正からgnupackに変えて戸惑ったのは設定の部分ぐらいです。
gnupackはstartup_config.iniというファイルがあってそこに設定を記述するということに気付かず、しばらく試行錯誤してました。  
ベストな環境とは思わないのですが、まぁ妥協できる環境かなというところで落ち着いてます。
まぁ…最近いろいろ調べてみて、Windowsでベストなターミナル環境は相当難しいと思っていて、
逆の考え方で、ここまで実現できるのであれば十分だろうという結論に至ってます。

## 1. ターミナル環境：gnupack(Cygwin)のセットアップ

### パッケージダウンロード
ということで前置きが長くなりましたが、実際にインストールに入っていきます。  
下記のサイトからgnupackをダウンロードします。

[gnupack プロジェクト日本語トップページ - OSDN](http://osdn.jp/projects/gnupack/)

今の最新版は13.02のようです。  
basicとdevelがありますが、gccやRuby、gitが標準で入っているdevelのほうをダウンロードします。
（gnupack_devel-13.02-2015.05.24.exe というファイルです。）

ダウンロードしたらファイルを解凍します。
解凍先はどこでも任意で構いませんが、ここでは `C:\` を指定することにします。

### configファイル編集
gnupackのホームディレクトリはデフォルトだとパッケージ内のディレクトリになりますが、
ここではWindowsと同じところをホームにしたいので以下の手順のように変更していきます。
以下、解凍したディレクトリを `%INST_DIR%`、Windowsのホームディレクトリを `%HOME%` として説明していきます。

1. `%INST_DIR%\startup_config.ini` をテキストエディタで開く。
2. 開いたファイルに記述されている下記の2行を `%HOME%` に変更する。  
    ```
        HOME      = %HOME%
        :
        Init_Current_Dir     = %HOME%
    ```
3. `%INST_DIR%\home\` ディレクトリにあるすべてのファイルを `%HOME%\` ディレクトリの中にコピーする。

もし、3.の手順を行った時に、すでに存在するファイルに対して上書きしようとしていたら、
そのあたりは各自の判断で選択してください。

`%INST_DIR%\startup_cygwin.exe` のショートカットを作成して、デスクトップなりタスクバーなりに置きます。

ショートカットリンクをダブルクリックするとgnupackのCygwinが起動すると思います。

## 2. シェル環境：zsh(oh-my-zsh)のセットアップ

### zshインストール
まず、apt-cygからzshとこの後に使うパッケージをインストールします。
インストール後、zshのバージョンも確認します。

```
$ apt-cyg install zsh curl
$ zsh --version
zsh 5.0.7 (i686-pc-cygwin)
```

次にzshを起動しますが、`.zshrc`ファイルがない状態で起動すると、
いろいろ聞かれて面倒なのと起動後のプロンプトが非常に見にくいので、
最低限の設定だけしておいてzshを起動します。

```
$ echo 'PROMPT="%F{cyan}[%n@%m %d]%f "' >> ~/.zshrc
$ zsh
```

### oh-my-zshインストール
これでzshが起動したので、oh-my-zshのインストールを行います。
インストールは、oh-my-zshの公式にしたがうだけでOKです。

[robbyrussell/oh-my-zsh #Basic Installation - GitHub](https://github.com/robbyrussell/oh-my-zsh#basic-installation)

上記に書いてあるように、次のコマンドを実行します。

```
$ curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

これで終わりですが、gnupack(Cygwin)の場合、インストールの最後に下記のエラーが出ます。

```
sh: 行 37: chsh: コマンドが見つかりません
```

gnupack(Cygwin)に`chsh`コマンドがないためですが、
oh-my-zshのインストールスクリプトを見るとこの後に実行している処理はないので（echoとかsourceだけ）、
少なくとも現時点ではエラーでも問題なさそうです。

### zshを読み込み直した時のエラー対応

ここでzshを読み込みなおしてみます。

```
$ source ~/.zshrc
compdef: unknown command or service: git
```

私の場合、読み込み直したら`compdef: 〜`というエラーがでましたが、
これは下記issueを参考に、次のコマンドを打って解決しました。  
[compdef: unknown command or service: git · Issue #630 · robbyrussell/oh-my-zsh - GitHub](https://github.com/robbyrussell/oh-my-zsh/issues/630#issuecomment-40465577)

```
$ compaudit | xargs -I % chmod g-w "%"
$ compaudit | xargs -I % chown [username] "%"
  ※ [username] の部分は各自のユーザー名に置き換えること。

$ rm ~/.zcompdump*
$ compinit
$ source ~/.zshrc
```

### ログインシェルの設定

最後にログインシェルをzshに切り替えます。  
gnupackの場合は `%INST_DIR%\startup_config.ini` に設定が書かれていて、
`SHELL`, `Cmdline_Image`の２箇所の書き換えと、
`zsh.exe`の１箇所を新しく行追加します。  
※いちおうこれで動いてるんですが、このあたりはドキュメントが見つからなかったので適切でない部分があるかも。

```
 [Process Variable]
    :
    SHELL     = /usr/bin/zsh
    :
 [startup_cygwin.exe]
    Cmdline_Image        = "%term.exe%" "%zsh.exe%" --login
    :
 [Local Variable]
    :
    zsh.exe         = %CYGWIN_DIR%\bin\zsh.exe
```

## 3. ターミナルマルチプレクサ：tmuxのセットアップ

まず、ビルドに必要なパッケージをapt-cygでインストールします。
基本は、下記tmuxの公式ページの流れ通りです。

[README - tmux download | sourceForge.net](http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/README#l21)

```
$ apt-cyg install tmux
```

これでtmuxが実行できるようになりました。

### socketエラーの対応

実行はできるようになったのですが、
これでtmuxを起動しようとすると下記のsocketエラーになります。

```
$ tmux
can't create socket: Permission denied
```

エラーの理由は `/tmp` ディレクトリに作られるディレクトリの権限絡みのようですが、
実のところよくわかってません。
純正のCygwinのときには問題なく起動してたんですが…。

ただ、下記のようにオプションで、
本来生成されるはずのdefaultファイルまできちんと指定すると回避できるようなので、
そのaliasを.zshrcに記述して対応することにします。  
※根本的な解決方法をご存知のかたがいたら教えて欲しいです。

```
$ echo 'alias tmux="tmux -S /tmp/tmux-$UID"' >> ~/.zshrc
$ source ~/.zshrc
```

すでにtmuxにaliasを設定している人は`-S ...`のオプションを付け加えればOKです。
また、場所は必ずしも `/tmp/...` でなくてもよくて、`$HOME/.tmux/socket` とかでも大丈夫です。
また、何も設定変えてないはずなのに急にtmuxが起動しなくなったな…という人は `-S` で指定しているファイルをいったん削除してみてください。
ここの例では `$ rm /tmp/tmux-$UID` という感じです。

### マウスを使う設定

マウスを使うにはtmuxの設定とmintty（Cygwinのターミナルツール）の設定が必要になるので、
それも設定します。

まず、tmuxのほうは、`.tmux.conf` というファイルに下記のような行を追加します。
設定内容の意味に関してはここでは書かないので他のサイトを参考にしてください。

```
set-window-option -g mode-mouse on
set-option -g mouse-utf8 on
set-option -g mouse-resize-pane on
set-option -g mouse-select-pane on
set-option -g mouse-select-window on
```

次にmintty側の設定は以下のようにします。

1. アプリケーションの左上端のアイコンをクリックして Options... を選択する
2. Mouseの項目
  - Right click action: Paste または Extend
  - Application mouse mode: Application
3. Windowの項目
  - Scrollbar: None

こうすることで、ペインごとにマウスのホイールスクロールなどが使えるようになります。
これでtmuxのセットアップは完了です。

## フォントやカラースキームなど

### フォント

WindowsではConsolasやRicty、Miguフォントのあたりが有名のようで、
Powerlineのパッチを適用する記事もよく見かけますが、
それらを1つにした **Cica** というフォントを公開されている方がいて、私はそれを使わせてもらっています。

[プログラミングに適した合成日本語等幅フォント Cica を公開します | さばなべ](http://sv.btnb.jp/cica-font)

フォントイメージは、上記サイトでWebフォントとして記事に適用されているので、
記事をご覧いただければどういうイメージになるかわかります。
Powerlineのパッチも適用済みなので、zipファイルをダウンロードして
解凍したフォントファイルをコピーするだけです。

1. 上記サイトからCica.zipのファイルをダウンロードして解凍する
2. コントロールパネル → デスクトップのカスタマイズ → フォント の順にクリックする
3. フォントフォルダが表示されるので、先ほど解凍したCicaフォルダの *.ttfをフォントフォルダにコピー＆ペーストする

このフォントですが、一応Powerlineが適用されているものの完全ではないようで、
「・」で表示されてしまう文字もあったりするので、私は別の文字に置き換えて使ってます。

### カラースキーム

minttyのカラースキームは、MacのiTerm2で使ってるJapanesqueというテーマを真似て設定しています。

[iTerm 2 で使えるカラースキーム、Japanesque を作った  - this A moment](http://this.aereal.org/entry/2013/01/02/222304)

Macだと上記のような外観になるのですが、とても気に入って使っているのでminttyもそれに合わせました。
気になる人がいましたら、githubにあげたので.minttyrcにコピペして使ってみてください。

https://github.com/yuuki-arc/mintty-color-schemes-Japanesque/blob/master/.minttyrc


## 最後に

まだtmuxまわりの外観など調整したいところはまだまだありますが、
現在こんな感じのターミナルになってます！

[![](2015-05-28/2015-05-28-windows-mintty.jpg)](http://yuukiar.co/img/2015-05-28/2015-05-28-windows-mintty.jpg)
