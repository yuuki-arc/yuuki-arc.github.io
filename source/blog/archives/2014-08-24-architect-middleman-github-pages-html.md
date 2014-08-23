---
title: Middleman + Github Pages によるブログ構築
date: 2014-08-24 02:59 JST
tags: Middleman,GitHub Pages
---

## Middleman + GitHub Pages の構成

Middlemanでサイトを構築するにあたって、大まかな構成は次のようにしました。  

### ディレクトリ構成

```
yuuki-arc.github.io
├── Gemfile
├── Gemfile.lock
├── README.md
├── config.rb
├── config.ru
├── data
│   └── site.yml
├── source
│   ├── 404.html.erb
│   ├── CNAME
│   ├── feed.xml.builder
│   ├── index.html.erb
│   ├── info.html.erb
│   ├── robots.txt.erb
│   ├── sitemap.xml.builder
│   ├── blog
│   │   ├── calendar.html.erb
│   │   ├── tag.html.erb
│   │   ├── archives
│   │   │   ├── yyyy-mm-dd-title.html.md
│   │   │   └── ...
│   │   └── images
│   │       ├── yyyy-mm-dd
│   │       │   ├── ***.png
│   │       └── ...
│   ├── css
│   │   ├── ***.css.scss
│   │   └── ...
│   ├── img
│   │   └── ***.jpg
│   ├── js
│   │   ├── ***.js
│   │   └── ...
│   └── layouts
│       ├── _footer.erb
│       ├── _google_search.erb
│       ├── _header.erb
│       ├── _pagination.erb
│       ├── _post_meta.erb
│       ├── _sidebar.erb
│       ├── _social_button.erb
│       ├── article.erb
│       ├── article_list.erb
│       └── layout.erb
├── tmp
│   └── restart.txt
├── build
│   └── ***
└── vendor
    └── ***
```


### レイアウト構成

各レイアウトとパーシャルの関係図です。


#### 記事一覧ページ
![](2014-08-24/article_list.png)


#### 記事詳細ページ
![](2014-08-24/article.png)


### ブログテーマ

ブログデザインは下記のBootstrapテーマをベースにしてカスタマイズしてます。  
[Banzhow | {wrap}bootstrap](https://wrapbootstrap.com/theme/banzhow-responsive-business-theme-WB03P4065)

## 構築の際に導入したもの

構築するにあたって調べたものや実装したものは、粒度は様々ですがだいたい下記の内容になります。

* GiHub Pages
  - ドメイン設定 (CNAMEファイル)
  - ブランチを使った運用方法
* Middlemanにおける実装
  - デプロイ (middleman-deploy)
  - livereload (middleman-livereload)
  - 各種minify
  - ディレクトリインデックス
  - syntax highlight (redcarpet)
  - Google Analytics
  - Pt engine
  - pow経由で表示
  - 関連記事機能 (middleman-similar)
  - メタタグ
  - サイトマップ (sitemap.xml.builder)
  - フィード (feed.xml.builder)
  - 404ページ
  - ローカルデータ (data/****.xml)
  - paginationの実装
  - 月別アーカイブの実装
  - タグ機能
  - Googleカスタム検索を導入
  - Frontmatter

具体的な実装内容については次回以降の記事で書いていきます。
あるいは、[githubのリポジトリ](https://github.com/yuuki-arc/yuuki-arc.github.io/tree/develop)を見てもらえれば分かるかと思います。


## 導入を検討したが導入しなかったもの

### コメント機能

Disqusとfacebookコメントを検討して、実際にDisqusは一度入れましたが最終的には外しました。
一番の理由はこのブログでは必要ないというところですが、Disqusに関しては一度入れたコメントは物理的に削除できないというところが個人的に気になりました。
（削除ボタンはあるが、Disqusのサイトで見ると削除フラグがたってるだけでコメントは閲覧できる）

facebookコメントは、ページが重くなるので入れませんでした。
いいねボタンはデファクトスタンダードなのでしかたないとして、facebookの機能は総じて重いのであまり入れたくないというのが理由です。

ほかにコメント機能ないか探してみましたが、Middlemanに合うものではこれといったものは見つからず。
そこまで必要性も感じてないので、なくていいかなというところで落ち着いてます。

## 今後導入予定

* Travis CI
* erb -> slim
* 記事投稿をしやすくする機能
* 気になっている箇所の微調整（Googleカスタム検索のデザインとか諸々）

どれも比較すぐに導入できると思いますが、Middlemanのほうはいったんこれで一段落で。
また別の機会に導入していこうと思います。
