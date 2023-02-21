# GitHub特有の機能

[その他の機能]
← [目次] →
[付録]

------------------------------------------------------------------------

> **TODO** GFMには含まれないが他の環境にもよくあるもの(見出しへのID設定、数式、脚注)と、GitHub特有の機能(絵文字の名前指定、CSS色表現など)を分割して章を分けるべき。検討中。

実際のGitHubサイトのMarkdown環境には[GFM]仕様書には書かれていないサイト専用の機能が多数存在する。

> 機能拡張の結果[GFM]仕様書通りではなくなっている部分もある。


Markdown

> Markdownを用いる現実のWebサービス/アプリではMarkdown実装だけでなく、文書を表示するWeb環境(HTML, CSS, etc.)にも大きく依存しており、同じ仕様のMarkdown実装を用いていてもそれを利用するためのWeb環境が異なれば当然表示結果も異なる。

## GitHub特有の機能

次に示す機能はGitHub特有。

### 絵文字

GitHub Markdown環境には独自の絵文字文化があり、`:name:`の書式で絵文字を[インライン]入力できる機能がある。

```markdown
:+1: :-1: :smile: :cry:
```

> :+1: :-1: :smile: :cry:

GitHubで使える絵文字名の一覧は次を参照。

https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md

Unicodeの絵文字に対応しているものだけではなく、GitHub独自の絵文字もある。またこれらは対応するPNG画像と組になっている。PNG画像も含めた一覧は次の通り。

https://github.com/higuma/github-emoji-list/blob/main/README.md

<details>
<summary>取得方法</summary>

一覧はGitHub REST APIで取得できる。方法は次を参照(要GitHub token)。データはJSON形式。

https://docs.github.com/ja/rest/emojis

より単純に次のURLにアクセスしても取得可能(token不要)。

https://api.github.com/emojis

</details>


### CSSの色表現

Issues/Pull requests/Discussionsでは[コードスパン]中にCSSの色表現(例: `rgb(80, 120, 240)`)を記述するとカラーサンプル付きで表示する。これはGitHub repoでは機能しないのでgistのコメントとして実例を作成した。次の(本文ではなくその下の)コメント欄を見ると効果を確認できる。

https://gist.github.com/higuma/80cff0982f9f7e2a267b33cad20f984a




------------------------------------------------------------------------

[その他の機能]
← [目次] →
[付録]

[その他の機能]: other.features.md
[目次]: index.md#github-markdown
[付録]: appendices.md






<!--
[HTMLブロック]: html-blocks.md
[info文字列]: code-blocks.md#info文字列
[インライン]: inlines.md
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[ノーブレークスペース]: texts.md#ノーブレークスペース
[バックスラッシュエスケープ]:characters.md#バックスラッシュエスケープ
[ブロック]: blocks.md
[非表示区切り]: texts.md#非表示区切り
[空行]: characters.md#空行
[文字参照]: characters.md#文字参照
[ASCII句読文字]: backslash-escapes.md#ASCII句読文字
[折りたたみ]: html-blocks.md#折りたたみ
[見出し]: thematic-breaks.md
-->
