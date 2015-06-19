---
title: Mac OS X Yosemiteでwaifu2xをインストールして使えるようにする
date: 2015-06-15 3:00 JST
tags: Mac,Yosemite,waifu2x
---

最近スマホゲームの素材探しをしていてその過程でwaifu2xというツールを知ったのですが、
素材加工のクオリティアップにかなり使えそうなのでセットアップ方法を残しておきます。

細かい説明はいろんなところで紹介されているのでここで説明しませんが、
簡単にいうと、waifu2xとは二次元画像を綺麗に拡大できるツールです。

自分の環境がMac OS X Yosemiteなので、Macでのセットアップ方法を探していたのですが、
見当たらなかったので、自分でセットアップした手順について書いていきます。
waifu2xは最近のトレンドのようで派生版があちこちにあるのですが、
いくつかMacで動いたのでそれらのセットアップ手順を紹介します。

### 見出し

- [この記事のwaifu2xについて](#この記事のwaifu2xについて)
  - [この記事で扱うwaifu2x](#この記事で扱うwaifu2x)
  - [この記事では扱わないが気になるwaifu2x](#この記事では扱わないが気になるwaifu2x)
- [1. ライブラリのインストール](#1.-ライブラリのインストール)
- [2. waifu2x(CUI版)のセットアップ](#2.-waifu2x(cui版)のセットアップ)
  - [waifu2x-converter-glsl (ueshita)](#waifu2x-converter-glsl-(ueshita))
  - [waifu2x-converter-cpp (WL-Amigo)](#waifu2x-converter-cpp-(wl-amigo))
- [3. waifu2x(GUI版)のセットアップ](#3.-waifu2x(gui版)のセットアップ)
  - [waifu2x-converter-qt (khws4v1)](#waifu2x-converter-qt-(khws4v1))

## この記事のwaifu2xについて

### この記事で扱うwaifu2x
コマンドラインで使える派生版を２つと、それをフロントエンドで使えるGUIを１つ紹介します。  
結論から書くと、今のところはコマンドラインで **waifu2x-converter-glsl** を使っていて、フロントエンドに **waifu2x-converter-qt** を使ってます。
フロントエンド側からは **waifu2x-converter-glsl** へのパスを設定してそれを使うようにします。

ただ、コマンドラインのほうは少々使いづらいです。
本来、パスを通せばどのディレクトリからでも実行できるようになってほしいのですが、
作業ディレクトリに依存している箇所があるため、実行するときはwaifu2x-converter-glslのディレクトリから実行しないとエラーになります。
このあたりはきちんと解決してから記事にしたかったのですが...あまり時間かけたくないので今のところはこれで我慢します。

それと、今後の他ツールの動向によっては変えていくこともあるかと思います。

#### CUI
- [ueshita/waifu2x-converter-glsl - GitHub](https://github.com/ueshita/waifu2x-converter-glsl)
  - OpenGLで動かせるようにしたバージョン。
- [WL-Amigo/waifu2x-converter-cpp - GitHub](https://github.com/WL-Amigo/waifu2x-converter-cpp)
  - オリジナル版をC++で書きなおしたバージョン。更新はもうされないそうです。

#### GUI
- [khws4v1/waifu2x-converter-qt - GitHub](https://github.com/khws4v1/waifu2x-converter-qt)
  - Macでも動かせるフロントエンドツール。
  - [waifu2x-converter-qtのバイナリ配布 | かひわし4v1.memo](http://khws4v1.myhome.cx/article/2015/06/07/waifu2x-converter-qt%E3%81%AE%E3%83%90%E3%82%A4%E3%83%8A%E3%83%AA%E9%85%8D%E5%B8%83/)
  - [waifu2x-converter-cppのGUIフロントエンド”waifu2x-converter-qt”のバイナリを公開しました※ | かひわし4v1.memo](http://khws4v1.myhome.cx/article/2015/06/01/waifu2x-converter-qt_linux_x64/)

### この記事では扱わないが気になるwaifu2x
ここでは扱いませんが、個人的にここはチェックしておきたいなというものを書いておきます。

- http://waifu2x.udp.jp/
  - Webから使える。気になるというか、これでwaifu2xを知ったので。
- [nagadomi/waifu2x - GitHub](https://github.com/nagadomi/waifu2x)
  - waifu2xのオリジナル。luaで書かれているようです。
- [tanakamura/waifu2x-converter-cpp](https://github.com/tanakamura/waifu2x-converter-cpp)
  - 現状いちばん頻繁に更新されてるので追っていきたいところですが、
    コード見るとWindowsとLinuxにしか対応してない箇所があって、そのままだとコンパイルエラーで通りませんでした。  
  - [waifu2x はやくした - J](http://d.hatena.ne.jp/w_o/20150602#1433229756)
- [lltcggie/waifu2x-caffe - GitHub](https://github.com/lltcggie/waifu2x-caffe)
  - GUIとCUI両方使えて機能も豊富な模様。  
    Caffeというフレームワーク（？）で実装されていてMacでも使えるようですが、開発環境を整えるのが面倒だったので今のところ何もしてません。
    でもよさそうなのでMacで使ってみたいですね。

## 1. ライブラリのインストール

セットアップに入っていきます。  

ライブラリのインストールにはHomebrewとgitを使います。
また この後インストールする waifu2x-converter-glsl のソースビルドにXCodeを使用します。
もしこれらが入っていなければ、他のサイトなどを参考にしてインストールしてください。

今回必要になるOpenCVとOpenGLのライブラリをインストールしていきます。
バージョンは現時点（2015年6月15日）の最新版であるOpenGL3.1.1とOpenCV3.0.0で、
両方ともHomebrewからインストールします。

```bash
$ brew tap homebrew/science
$ brew install opencv3 --with-opengl --with-qt5 --with-tbb --c++11
$ brew link --force opencv3

$ brew tap homebrew/versions
$ brew install glfw3 --universal
```

- **brew install するのは opencv ではなく opencv3** である点に注意してください。（opencvを指定するとOpenCV2系のバージョンが入ります）
- opencv3の `--with-qt5` はフロントエンドの方で必要になります。
  他のオプションは必要そうなのを入れてますが、いらないものもあるかもしれません。  
- `--force`でリンクするのは、opencv3の場合は自動的に `/usr/local/..` にシンボリックリンクがはられないためです。
  このオプションを指定すると強制的にOpenCV3へのリンクがはられるので、すでに同ディレクトリにOpenCVが入っている人は実行しないほうがいいです。
  ただし、その場合はXCodeプロジェクトで設定されているパスを書き換えないといけないです。（その場合のパターンはここでは説明しません）  
- glfw3の `--universal` はスタティックライブラリを生成するオプションで、
  waifu2x-converter-glsl のXCodeプロジェクトで指定してるので、インストールと同時に生成しておきます。

## 2. waifu2x(CUI版)のセットアップ

ここでは２つの派生版についてセットアップ手順を書いていきます。
waifu2xを使うにはどちらか1つセットアップできてればいいので、どちらか使いたい方を見てください。
簡単に違いを説明すると、

- waifu2x-converter-glsl (ueshita)
  - GPUを使うので実行中はグラフィックまわりの処理に負荷がかかる
  - waifu2x-converter-cpp(WL-Amigo)に比べて処理速度が速い
  - XCodeを使ったビルドでセットアップ手順が少々煩雑
  - 実行するときのカレントディレクトリはインストール場所固定
- waifu2x-converter-cpp (WL-Amigo)
  - CPUを使うので実行中は全体的に重くなる
  - waifu2x-converter-glslに比べて処理速度が遅い
  - CMakeを使ったビルドでモノが揃ってれば手順が簡単
  - パスを通せば、実行するときのカレントディレクトリは任意（※オプション指定が必要）

といった感じです。
処理速度はだいぶ違ってて、waifu2x-converter-glslのほうが目に見えて速いです。

### waifu2x-converter-glsl (ueshita)

まずOpenGL版のほうから説明していきます。

git cloneしてディレクトリに移動します。  
以降、このディレクトリでコマンドを入力していきます。

```bash
$ git clone https://github.com/ueshita/waifu2x-converter-glsl
$ cd [git cloneしたディレクトリ]
```

私の場合は下記の場所にインストールしたのでそのディレクトリに移動してます。

```bash
$ pwd
/Users/hoge/src/github.com/ueshita/waifu2x-converter-glsl
```

次にXCodeでビルドしていきます。  
XCodeのプロジェクトは作者の方がリポジトリに含めてくれているので、それを使います。

まず、ビルドする前に一回XCodeのアプリケーションを起動してプロジェクトを開きます。
そうしないとコマンドラインからのビルドでエラーになるからで、それを回避するためです。
プロジェクトのワークスペースがないといけないのですが、XCodeを起動すると作られるようです。

マウスでアプリケーションを指定してプロジェクトを開いてもいいですし、
コマンドラインから以下のように実行することでも起動できます。

```bash
$ open build/waifu2x-converter-glsl.xcodeproj
```

ワークスペースを作るためだけに開くので、起動したらすぐに終了していいです。

次のコマンドを実行するとXCodeでソースビルドを行います。
オプションのパラメータをわかりやすくするため、`\`で行を区切ってますが1行でもOKです。

```bash
xcodebuild \
-project build/waifu2x-converter-glsl.xcodeproj \
-scheme waifu2x-converter-glsl \
-configuration Release \
-derivedDataPath DerivedData
```

ちなみに、もしここで以下のエラーが表示されたらワークスペースが作られてませんので、
XCodeを起動してプロジェクトを開いてください。（一つ前に書いた作業のことです）

```bash
xcodebuild: error: 'build/waifu2x-converter-glsl.xcodeproj' does not exist.
```

`-derivedDataPath` で指定しているのがリリースバイナリが作られるディレクトリです。
このディレクトリに作られるファイルを起動出来る場所にコピーします。

```bash
$ cp DerivedData/Build/Products/Release/waifu2x-converter-glsl .
```

これで waifu2x-converter-glsl のセットアップは完了です。
ちなみにこのときの構成は以下のようになっています。

```bash
$ pwd
/Users/hoge/src/github.com/ueshita/waifu2x-converter-glsl

$ tree -pugL 1
.
├── [drwxr-xr-x hoge   staff   ]  DerivedData
├── [-rw-r--r-- hoge   staff   ]  LICENSE
├── [-rw-r--r-- hoge   staff   ]  README.md
├── [drwxr-xr-x hoge   staff   ]  build
├── [drwxr-xr-x hoge   staff   ]  include
├── [drwxr-xr-x hoge   staff   ]  models
├── [drwxr-xr-x hoge   staff   ]  shaders
├── [drwxr-xr-x hoge   staff   ]  src
└── [-rwxr-xr-x hoge   staff   ]  waifu2x-converter-glsl

6 directories, 3 files
```

このディレクトリからファイルを実行することでwaifu2xが使えるようになります。

ただし、ここで注意点があります。  
最初に書きましたが、これで使えるコマンドラインのほうは少々使いづらいです。
理由は、実行するときはこのwaifu2x-converter-glslのディレクトリに移動してから実行しないと使えないからです。

作業ディレクトリに依存しているのは `models` と `shaders` にあるモジュールです。
このうち、 `models` に関してはwaifu2x-converter-glslのオプションに `--model_dir` というのがあり、
ここでパスを指定することで回避できますが、 `shaders` に関しては同様のオプションがありません。
なので作者の方にお願いするか、githubで公開されてるのでコードを修正してプルリクするなりしないといけないです。
時間があれば見てみようかなと思いましたが、そこまで手が回らなかったので今のところこのままにしてます。

この問題に関してはインプット側の画像パスをフルパスにすればいいだけなので、
少々不便ではありますがこれでも十分使えるかなと思ってます。

また、GUI版をインストールして waifu2x-converter-glsl を使うようにすれば
この問題は関係なくなるので、GUI版メインで使う人は気にしなくていいです。

#### 実行方法（例）

```
$ cd ~/src/github.com/ueshita/waifu2x-converter-glsl
$ waifu2x-converter-glsl -i ~/Documents/test.jpg -m noise_scale -j 8 --scale_ratio 2.0 --noise_level 2
```

#### 実行結果
```
Noise reduction (Lv.2) filtering...
split blocks 2x3 ...
process block (1,1) ...
[=======] ok
:
process block (6,4) ...
[=======] ok
process successfully done!
```


### waifu2x-converter-cpp (WL-Amigo)

次に、他の派生版としてwaifu2x-converter-cpp(WL-Amigo)版もセットアップしてみます。

こちらもまずはgit cloneしてディレクトリを移動します。

```bash
$ git clone https://github.com/WL-Amigo/waifu2x-converter-cpp
$ cd [git cloneしたディレクトリ]
```

私の場合は下記の場所にインストールしたのでそのディレクトリに移動してます。

```bash
$ pwd
/Users/hoge/src/github.com/WL-Amigo/waifu2x-converter-cpp
```

カレントディレクトリに `CMakeLists.txt` のファイルを作って、以下の内容を貼り付けます。

```bash
cmake_minimum_required(VERSION 2.8)

project(waifu2x-converter-cpp CXX)

set(CMAKE_CXX_FLAGS "-std=c++11 -stdlib=libc++")
set(OpenCV_DIR "/usr/local/opt/opencv3/share/OpenCV")
set(OpenCV_CONFIG_PATH "/usr/local/opt/opencv3/share/OpenCV")
set(OpenCV_INSTALL_PATH "/usr/local/opt/opencv3")
find_package(OpenCV REQUIRED)
include_directories(include ${OpenCV_INCLUDE_DIRS})

add_executable(waifu2x-converter-cpp src/main.cpp src/modelHandler.cpp src/convertRoutine.cpp)
target_link_libraries(waifu2x-converter-cpp ${OpenCV_LIBS})
```

Homebrewの場合、OpenCVのライブラリは `/usr/local/opt/` 配下にシンボリックリンクで作られるので、
その場所を指定します。
cmakeはあまり詳しくないので最適な書き方ではないかもしれませんが、私の場合はこれでいけました。

準備出来たのであとはコマンドを打つだけです。

```bash
$ cmake .
$ make
```

これで以下のように、
カレントディレクトリに `waifu2x-converter-cpp` というファイルが生成されていれば成功です。

```bash
$ pwd
/Users/hoge/src/github.com/WL-Amigo/waifu2x-converter-cpp

$ tree -pugL 1
.
├── [-rw-r--r-- hoge   staff   ]  CMakeCache.txt
├── [drwxr-xr-x hoge   staff   ]  CMakeFiles
├── [-rw-r--r-- hoge   staff   ]  CMakeLists.txt
├── [-rw-r--r-- hoge   staff   ]  LICENSE
├── [-rw-r--r-- hoge   staff   ]  Makefile
├── [-rw-r--r-- hoge   staff   ]  README.md
├── [drwxr-xr-x hoge   staff   ]  appendix
├── [-rw-r--r-- hoge   staff   ]  cmake_install.cmake
├── [drwxr-xr-x hoge   staff   ]  include
├── [drwxr-xr-x hoge   staff   ]  models
├── [drwxr-xr-x hoge   staff   ]  src
└── [-rwxr-xr-x hoge   staff   ]  waifu2x-converter-cpp

5 directories, 7 files
```

あとはこのディレクトリに対してパスを通せば、どこからでも実行できるようになります。

#### 実行方法（例）

パスを通した場合、任意の位置で実行することができます。
ただし、 `--model_dir`のオプションで `models` ディレクトリのパスを指定する必要は出てきます。

```bash
$ waifu2x-converter-cpp --model_dir ~/src/github.com/WL-Amigo/waifu2x-converter-cpp/models -i ~/Documents/test-cpp.jpg -m noise_scale -j 8 --scale_ratio 1.2 --noise_level 1
```

パスを通さない場合は、waifu2x-converter-glslと同じ書き方になります。
その代わり、 `--model_dir` のオプションを指定しなくてもよくなります。

```bash
$ cd ~/src/github.com/WL-Amigo/waifu2x-converter-cpp/
$ waifu2x-converter-cpp -i ~/Documents/test-cpp.jpg -m noise_scale -j 8 --scale_ratio 1.2 --noise_level 1
```

#### 実行結果
```
start process block (0,0) ...
Iteration #1...
Iteration #2...
:
Iteration #6...
Iteration #7...
process successfully done!
```

## 3. waifu2x(GUI版)のセットアップ

### waifu2x-converter-qt (khws4v1)

GUI版のwaifu2xをセットアップです。  
Mac用のパッケージがリポジトリにあるのでそれを使います。  
https://github.com/khws4v1/waifu2x-converter-qt/releases

waifu2x-converter-qt_Mac.dmg というファイル名のリンクがあるので、クリックしてダウンロードしてください。
ダウンロードしたファイルを展開すると **waifu2x-converter-qt.app** というファイルがあるので、
Applicationフォルダなど適当な場所においてください。

アプリケーションを起動すると以下の様なウィンドウが表示されます。

![waifu2x-converter-qt フィルタ選択](2015-06-15/waifu2x-converter-qt.png)

この派生版にもwaifu2xが内蔵されていますが、私の環境では下記のエラーで動きませんでした。

```
dyld: Library not loaded: /opt/local/lib/libgstbase-1.0.0.dylib`
```

このエラーを調査してもいいですが、すでにコマンドラインで実行できる環境があるのでそちらを利用することにします。

ということで、設定画面を開きます。
上部にあるメニューの「ツール」を選択して「設定」をクリックすると、次の設定ダイアログが開きます。

![waifu2x-converter-qt 設定](2015-06-15/settings.png)

一つ目の入力欄の**waifu2xの場所** に、先ほどインストールしたコマンドラインのフルパスを入力してください。
私の環境であれば、それぞれ以下のように入れます。

- **waifu2x-converter-glsl** を使う場合
  - /Users/hoge/src/github.com/ueshita/waifu2x-converter-glsl/waifu2x-converter-glsl
- **waifu2x-converter-cpp** を使う場合
  - /Users/hoge/src/github.com/WL-Amigo/waifu2x-converter-cpp/waifu2x-converter-cpp

OKボタンを押すと設定が反映されます。  
これで準備が整いました。
画像を選択して実行すると、ダイアログがポップアップして処理結果が表示されます。

![waifu2x-converter-qt 処理結果](2015-06-15/exec_result.png)

これでGUIでwaifu2xが使えるようになりました。
