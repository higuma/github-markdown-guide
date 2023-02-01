# GitHub Markdown環境

[HTMLブロック]
← [目次] →
[付録]

------------------------------------------------------------------------

実際のGitHubサイトのMarkdown環境には[GFM]仕様書には書かれていないサイト専用の機能が多数存在する。

> 機能拡張の結果[GFM]仕様書通りではなくなっている部分もある。


Markdown

> Markdownを用いる現実のWebサービス/アプリではMarkdown実装だけでなく、文書を表示するWeb環境(HTML, CSS, etc.)にも大きく依存しており、同じ仕様のMarkdown実装を用いていてもそれを利用するためのWeb環境が異なれば当然表示結果も異なる。

本章の内容の中には他のMarkdown環境でも採用されているものがいくつかある。他のMarkdown環境でも採用されている一般的な仕様を前半で説明し、GitHub特有の機能について後半に示す。

## 一般的な機能

次に示す各種機能は他のMarkdown環境でも使える場合が多い。

### 見出しへのID設定

GitHub Markdownをはじめとする多くMarkdown環境では[見出し]に対して次のルールでIDを自動的に割り振る。

1. 見出し文のテキストを抽出して次の変換を行う
    * スペースを`-`に変換
    * `-`以外の[ASCII句読文字]を除去
    * アルファベットを全て小文字に変換
    * その他の文字(日本語文字を含む)は無変換
2. IDに重複が生じた場合は次のように処理
    * 最初はそのまま(例: `foo`)
    * 2番目は`-1`を追加(`foo-1`)
    * 3番目以降も同様に連番を振る(`foo-2`, `foo-3`, ...)

実例を示す。

```markdown
### [GitHub Markdown](#)とは?
```

> ### [GitHub Markdown](#)とは?

→ [`id="github-markdownとは"`](#github-markdownとは)

<details>
<summary>変換手順</summary>

1. テキストを抽出(リンク情報は除去) → `GitHub Markdownとは?`
2. スペースを`-`に変換 → `GitHub-Markdownとは?`
3. `-`以外のASCII句読文字を除去 → `GitHub-Markdownとは`
4. アルファベットを小文字に変換 → `github-markdownとは`
</details>

```markdown
### *F*,o<sup>o</sup>!
```

> ### *F*,o<sup>o</sup>!

→ [`id="foo"`](#foo)

<details>
<summary>変換手順</summary>

1. テキストを抽出(書式設定は除去) → `F,oo!`
2. `-`以外のASCII句読文字を除去 → `Foo`
3. アルファベットを小文字に変換 → `foo`
</details>

```markdown
#### F=OO
```

> #### F=O/O

→ [`id="foo-1"`](#foo-1)

<details>
<summary>変換手順</summary>

1. テキストを抽出 → `F=O/O`
2. `-`以外のASCII句読文字を除去 → `FOO`
3. アルファベットを小文字に変換 → `foo`
4. 上と重複するため連番を追加 → `foo-1`
</details>

> 以上の仕様はよく知られているもので、他のMarkdownを用いたWebサービス/アプリでもこれと同じ仕様が多い。ただしGitHubの公式ドキュメントを探しても記述は見当たらないのでこの機会にまとめておいた。

### 数式

Markdownを用いるWeb環境にはLaTeX形式の数式記述を受け付けるものが多く、GitHubでも採用されている。

> これも他のMarkdown環境ではよくあるTODO

## 脚注

TODO

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











## GFM準拠チェック


> ここからTODO: 現実のGitHubサイトはGFM仕様に完全準拠しているわけではなく、独自拡張もあれば逆に未実装部分もある。ただし習得中はまだ考えなくてよい。
> 
> > (補足: これはここではなく、Appendix Bとかに回した方が思う) この点に関しては次のドキュメントが詳しい。特に後半部の[GFMとGitHub実装の違い](https://qiita.com/tk0miya/items/6b81e0e4563199037018#githubcom-の動作と合致していない)や[GitHub独自拡張の解説](https://qiita.com/tk0miya/items/6b81e0e4563199037018#gfm-に記載されていない-githubcom-独自のマークアップが存在する)は要チェック。
> > 
> > https://qiita.com/tk0miya/items/6b81e0e4563199037018

------------------------------------------------------------------------

[HTMLブロック]
← [目次] →
[付録]

[HTMLブロック]: html-blocks.md
[目次]: index.md
[付録]: appendices.md

[ASCII句読文字]: backslash-escapes.md#ASCII句読文字
[インライン]: inlines.md
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[折りたたみ]: html-blocks.md#折りたたみ
[見出し]: thematic-breaks.md
