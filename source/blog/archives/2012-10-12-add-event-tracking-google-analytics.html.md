---
title: Google Analyticsのイベントトラッキングをサイトに埋め込む
date: 2012-10-12 23:45 JST
tags: Google Analytics
---

Google Analyticsの説明とかイベントトラッキングって何？というような説明は他のサイトにまかせて、ここでは単純に実装方法について説明します。

まず最初にAnalyticsのコードを宣言します。  
入れる場所はheadタグに入れます。

```html
<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-xxxxxxxxx-x']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
```

※ `UA-xxxxxxxxx-x` の箇所はアカウントによって変わります。

準備はこれで終わりで、あとはイベントトラッキングを埋め込みたい場所にJavaScriptコードを記述します。  
例えばとあるaタグのクリック数を知りたいとする場合、次のように書きます。

```html
<a href="http://www.google.co.jp/" target="_blank"
onclick="_gaq.push(['_trackEvent', 'blog', 'click', 'blog_contents_detail']);">
Google検索へ
</a>
```

`_gaq.push(['_trackEvent', 'blog', 'click', 'blog_contents_detail']);` のところがイベントトラッキングのコードです。  
各パラメータを任意の値に変えて埋め込んでください。
