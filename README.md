# 日常会話で使える台湾華語
サービスURL：https://www.taiwankago.net/
![topたいわん小](https://github.com/user-attachments/assets/fb9e6812-b580-43c3-8874-72ff838c91db)

## 画面遷移図
Figma：https://www.figma.com/file/AL0efY62iqmVfP7S8oYM8v/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=XOjh5ZopM7gLsfu8-1

## ER図
https://gyazo.com/d4f4e480d9b30025ccce5aec98170dfc
# サービス概要
台湾の中国語で、主要言語である台湾華語の学習アプリです。<br>
日常会話で使われる単語や文章が登録されており、単語の詳細閲覧や音声を流して確認することができます。<br>
トップページは、既存登録されている単語や文章がカテゴリー分けされて並んでいます。<br>
ログイン後は、ユーザー専用の学習スペースがあり、オリジナルの単語や文章を作成したり、既存の単語や文章を追加して管理できます。

# このサービスへの思い・作りたい理由
以前独学で台湾華語を勉強していて、発音はできる様になりましたが会話はできませんでした。<br>
話し相手がいないとなかなか上達するのは難しく、本場の人と日常会話をする機会がないので、いつまで経っても喋れるようにならないです。<br>
1人でも、台湾華語を常時使えるような環境を作らないといけないと思いました。

# ユーザー層について
* 台湾華語を勉強したい人。<br>
* 台湾華語を話す相手がいない人。<br>
1人での勉強に限界を感じている方は、役立ててほしいです

# サービスの利用イメージ
基本はスマホで使ってもらうことを想定しております。<br>
### My会話帳
ユーザー専用の学習スペースです。自分で作成した単語や文章をMy会話帳で管理できます。<br>
####　☟My会話帳の機能☟
####　　カテゴリー機能
単語や文章を分けるためのカテゴリーを作成できます。
#### ブックマーク機能
既存の単語をブックマークし、「My会話帳」に追加できます。
#### 単語、文章登録機能
「My会話帳」に入れたい単語や文章を作成し、追加できます。

# ユーザーの獲得について
SEOで検索上位に選ばれるようにする

# サービスの差別化ポイント・推しポイント
台湾華語の学習アプリは、台湾華語自体がマイナーの為、アプリ自体が少なく、台湾華語の音声が聞けるものはいくつかありますが、ユーザーが専用の学習スペースを持ち、単語を好きに管理できるというのはこのアプリならではの機能だと思っております。

# 機能候補
* **ログイン機能(MVPリリース)**
* **音声機能(MVPリリース)**
* **リスト機能(MVPリリース)**
* **詳細項目(MVPリリース)**
* **カテゴリー機能(MVPリリース)**
* **ユーザーごとに自作の台湾かごを登録できる機能(本リリース)**
* **今日の課題をクリアするとスタンプされる機能。(本リリース)**

# 機能の実装方針予定
* **ログイン機能(MVPリリース)**<br>
Gemのsorceryを使用。
* **音声機能(MVPリリース)**<br>
Web Speech APIを使用。<br>
* **リスト機能(MVPリリース)**<br>
自分がよく使う言葉をすぐ見れる様にするため
* **詳細項目(MVPリリース)**<br>
詳細かメモ欄を追加を考えています。詳細がないと使い分けが難しい単語などもあるからです。先ほどの例で言うと「美味しい！」は「好吃！」ですがこれは食べ物に使う言葉で、飲み物の場合は、「好喝！」をつかいます。
* **カテゴリー機能(MVPリリース)**<br>
自作のカテゴリーを作成できる。
* **ユーザーごとに自作の台湾かごを登録できる機能(本リリース)**<br>
「新しく単語を作成する」ボタンを作ってリストに入れられる。<br>
* **今日の課題をクリアするとスタンプされる機能。(本リリース)**<br>
1ヶ月間のチェックシートも用意して、今日の課題が終わるとスタンプが押される。<br>
今日の課題の例<br>
・一つ単語を登録する<br>
・一時間以上ログインする
など