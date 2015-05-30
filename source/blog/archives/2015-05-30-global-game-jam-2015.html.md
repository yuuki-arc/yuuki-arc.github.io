---
title: 「Global Game Jam 2015」に参加しました／DEAD EYE LANDの体験コーナーあります
date: 2015-05-30 13:20 JST
tags: Unity3D
---

![DEAD EYE LAND](2015-05-30/dead_eye_land_ggj2015_.png)

1月23日(金)〜25日(日)にかけて、[Global Game Jam 2015](http://globalgamejam.org/) (GGJ2015) に参加してきました。
世界中でゲーム開発を行うイベントで、チームを組んで１つのテーマについて企画から考えてゲームを作るイベントです。

ということで、書きかけのまま公開せずに4ヶ月経ってしまったんですが、
GGJで視線入力ハードウェアのTobii EyeXを使ったアイトラッキングゲーム "**DEAD EYE LAND**" を作りまして、
それがGGJ以降も好評のようなのでその紹介も含めて書きます。

## Tobii EyeX体験コーナー

4月17日からマウスコンピューターのダイレクトショップ「G-Tune:Garage 秋葉原店／名古屋店」の2箇所で体験できるようになってます。

[アイトラッキングシステム Tobii EyeX（トビーアイエックス）体験コーナー](http://www.g-tune.jp/content/tobii_eyex/)

常設コーナーのため営業時間内であればいつでも体験できますので、近場に寄った際には遊んでみてください。

## Future Games in Engadget 例大祭

本日になりますが、エンガジェットのイベント、[Engadget 例大祭](http://japanese.engadget.com/event/engadget-reitaisai-2015)にて体験コーナーが設けられてます。
17:30〜19:00の時間でインタラクティブゾーンの場所になります。

[例大祭にライダーなりきり体験『ナレルンダー！』。視線でゾンビを撃つDead Eye Landも遊べます - Engadget Japanese](http://japanese.engadget.com/2015/05/28/dead-eye-land/?ncid=rss_truncated&utm_source=dlvr.it&utm_medium=twitter)

体験できるだけでなく、参加者でスコアを競って最高スコアの人は景品がもらえるらしいです（詳細はあまり知らないです）。
また、[スーパーピコピコクラブ（スーピコ）](http://gamekun.com/)がゲーム実況を担当するそうです！

例大祭が満員御礼とのことで当日チケットはなくなってしまったようなのですが、
来られる方がいましたらぜひ足を運んでみてください。

## Global Game Jam 2015

ここからは、1月に行ったGGJのイベント模様です。

### 開発場所

私は今回が初参加で、会場はバンダイナムコ未来研究所を選びました。  
[Global Game Jam 2015 バンダイナムコ未来研究所会場 | Peatix](http://ggj2015-bns.peatix.com/)

開発場所は、バンダイナムコ未来研究所の社員食堂で行って、とても広く快適に作業ができました。
イベントの後半にネットワークトラブルがあってけっこうごたごたしたのですが、全体的にはとても満足の行く会場だったと思います。

また、ここのバンダイナムコ会場では泊まりは禁止されていて23時には閉まってしまうので、
みんな夜帰って次の日の朝会場にきて作業、みたいな感じでやりました。

### テーマ

テーマはイベント当日に発表されるためそれまではわからないのですが、今回は

**「WHAT DO WE DO NOW ?」（私たちは今何をする？）**

ということでした。  
この一文から各チームでアイデアを膨らませて作っていきます。

### アイデア

私たちのチームはいろいろ話し合った結果、Tobii EyeXを使ったアイトラッキングゲームでいこう、ということになりました。

ゲームアイデアは

* もぐらたたきみたいにぼこぼこ倒せるのがいいね
* ゾンビのガンシューティングみたいなのはどうだろう
* ただのゾンビゲームだと驚きがないから視線入力ならではの仕掛けを作りたいね
* etc...

というところから、一見普通の「ゾンビを倒すガンシューティングゲーム」だけど、進めていくと・・・
みたいな感じです。

### 開発

会場には70人ぐらい集まって全12チーム、内訳はUnity3Dが10チーム、Unreal Engine 4が2チームということでした。

私たちのチームはみんなUnity経験者だったので、Unity3Dで作ることになりました。  
Unity 3Dの最新バージョン4.6.1f1、Assets Serverを使っての開発で、
1人がディレクター、4人がエンジニアという構成になりました。

また、Tobii EyeXは最初は使う予定はなかったのですが、
Tobii EyeXの会社（トビー・テクノロジー）の方もきていて、実際に体験デモをやって試してみたり、
技術的なところを確認したりして決めました。
実際のSDKの使い方や実装については、チームの方が夜の間にいろいろ調べてくれていて、
次の日のお昼ごろにはコアな部分はだいぶできていたという…とても助かりました。

私はUnityはあまり深い部分まではわからないので、メインの部分はほかの3名にやってもらって、
私が作ったのは、iTweenをつかってプレイヤーのパス経路を作成するところと
カメラが自然に追尾するようにコードを組む部分でした。

### 発表＆イベント終了

そんな流れで、きちんとゲームとして成立するところまで完成です。  
今回作ったゲームはその特質上、本当の内容は最後の発表まで隠しておいて、
プレゼンのときに誰かにやってもらおう！ということで、会場の司会者の方にプレゼン時にプレイしていただきました。  
結果としてはだいぶ会場が盛り上がったので、とてもいい発表になったなと思います。


イベント終了後にトビーの方とお話していて、どういう反応になるかドキドキしましたが、幸いトビーの方にも好評でした！

<div id="fb-root"></div> <script>(function(d, s, id) { var js, fjs = d.getElementsByTagName(s)[0]; if (d.getElementById(id)) return; js = d.createElement(s); js.id = id; js.src = "//connect.facebook.net/ja_JP/all.js#xfbml=1"; fjs.parentNode.insertBefore(js, fjs); }(document, 'script', 'facebook-jssdk'));</script>
<div class="fb-post" data-href="https://www.facebook.com/tobii.jp/posts/752928928125351:0" data-width="466"><div class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/tobii.jp/posts/752928928125351:0">投稿</a> by <a href="https://www.facebook.com/tobii.jp">トビー・テクノロジー　Tobii Technology</a>.</div></div>


それで、なんとTobii EyeXの無料クーポン券をいただいてしまいました！
無料クーポンで購入して今は無事に家に届いてます。

![](2015-05-30/Tobii_EyeX.jpg)

### 作ったゲーム

作ったゲームは "**DEAD EYE LAND**" というアイトラッキングを使ったゾンビガンシューティングゲームです。
ただし、ただのゾンビゲームではなく、後半に差し掛かると視線入力ならではの仕掛けが出てきます。
その仕掛けは実際にプレイして楽しんでください！

![](2015-05-30/press_dead_eye_land_02.jpg)

![](2015-05-30/press_dead_eye_land_03.jpg)

こちらに私たちのチーム（チーム名：BASTARD）のゲームページがあるので、詳しくはそちらを！  
[DEAD EYE LAND | Global Game Jam&reg;](http://globalgamejam.org/2015/games/dead-eye-land)
