# 日常会話で使える台湾華語
## 画面遷移図
Figma：https://www.figma.com/file/AL0efY62iqmVfP7S8oYM8v/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=XOjh5ZopM7gLsfu8-1

## ER図
https://gyazo.com/d4f4e480d9b30025ccce5aec98170dfc
# サービス概要
台湾の中国語で、主要言語である台湾華語の学習アプリ。
日常会話で使われる単語や単文を私の声で録音し、ユーザーはその音声を流すことができる。<br>
中国語と読みの表記もある。

# このサービスへの思い・作りたい理由
以前独学で台湾華語を勉強していて、発音はできる様になりましたが会話はできませんでした。<br>
話し相手がいないとなかなか上達するのは難しく、本場の人と日常会話をする機会がないので、いつまで経っても喋れるようにならないです。<br>
1人でも、台湾華語を常時使えるような環境を作らないといけないと思いました。

# ユーザー層について
* 台湾華語を勉強したい人。<br>
* 台湾華語を話す相手がいない人。<br>
1人での勉強に限界を感じている方は、役立ててほしい

# サービスの利用イメージ
基本スマホで使ってもらう想定です。<br>
家にいる時など常にスマホを傍に置いていて、例えば食事時など「美味しい！」と思ったら、アプリで確認して「好吃！」と言葉にしてみる。
そんな感じで普段使いして、独り言でもいいので台湾華語に慣れて行けるといいと思います。

# ユーザーの獲得について
SEOで検索上位に選ばれるようにする

# サービスの差別化ポイント・推しポイント
台湾華語の音声が聞けるものはいくつかありましたが、台湾華語自体がマイナーなのかあまり開拓されてないようで、機能は最小限で使い勝手があまり良くなさそうなものが多かったです。まずカテゴリー分けをして見やすくするのと、自分がよく使う言葉をすぐ見れるようにリスト機能は確実に入れたいです。

# 機能候補
* **ログイン機能(MVPリリース)**
* **ゲストログイン機能(MVPリリース)**
* **音声機能(MVPリリース)**
* **リスト機能(MVPリリース)**
* **詳細項目(MVPリリース)**
* **カテゴリー機能(MVPリリース)**
* **リストした単語をランダムで流せる機能(MVPリリース)**
* **ユーザーごとに自作の台湾かごを登録できる機能(本リリース)**
* **申請機能(本リリース)**
* **今日の課題をクリアするとスタンプされる機能。(本リリース)**

# 機能の実装方針予定
* **ログイン機能(MVPリリース)**<br>
GemのDeviseを使用。
* **ゲストログイン機能(MVPリリース)**<br>
GemのDeviseを使用。<br>
新規登録が面倒な場合はゲストで入れるようにする
* **音声機能(MVPリリース)**<br>
MediaStream Recording API を使う。<br>
声を録音して再生するのに使う
* **リスト機能(MVPリリース)**<br>
自分がよく使う言葉をすぐ見れる様にするため
* **詳細項目(MVPリリース)**<br>
詳細かメモ欄を追加を考えています。詳細がないと使い分けが難しい単語などもあるからです。先ほどの例で言うと「美味しい！」は「好吃！」ですがこれは食べ物に使う言葉で、飲み物の場合は、「好喝！」をつかいます。
* **カテゴリー機能(MVPリリース)**<br>
カテゴリー分けについては、今の所2つ考えていて、シュチュエーションから選べるようにするか、あいうえお順のように中国語を発音記号で分けるか、この両方入れてどちらかの検索方法を選べるようにするかを考えています。
* **リストした単語をランダムで流せる機能(MVPリリース)**
<br>
擬似会話的なことができるかもしれない検討中
* **ユーザーごとに自作の台湾かごを登録できる機能(本リリース)**<br>
「新しく単語を作成する」ボタンを作って既存のカテゴリーに追加できる。追加した後は、リストにも入れられる。<br>
他のユーザーからは、追加した分は増えない。デタラメな中国語を登録されると困るから。
* **申請機能(本リリース)**<br>
「新しく単語を申請する」ボタンを作って、審査が通れば既存のカテゴリーに追加できる。追加した後は、リストにも入れられる。
これは既存の単語扱いになってどのユーザーも使える様になる。
<br>
審査方法は、申請一覧ページを作り、申請するとそれぞれユーザーの申請一覧ページに申請が届くのでそれにチェックを入れるだけ。10人くらいのユーザーがチェックをすれば採用とかにするなど検討中
* **今日の課題をクリアするとスタンプされる機能。(本リリース)**<br>
1ヶ月間のチェックシートも用意して、今日の課題が終わるとスタンプが押される。<br>
今日の課題の例<br>
・一つ単語を登録する<br>
・一時間以上ログインする
など