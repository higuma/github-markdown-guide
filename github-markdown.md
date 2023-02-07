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

## 見出しへのID設定

GitHub Markdownをはじめとする多くMarkdown環境では[見出し]に対して次のルールでIDを自動的に割り振る。

- 見出し文のテキストを抽出して次の変換を行う
  - スペースを`-`に変換
  - `-`以外の[ASCII句読文字]を除去
  - アルファベットを全て小文字に変換
  - その他の文字(日本語文字を含む)は無変換
- IDに重複が生じた場合は次のように処理
  - 最初はそのまま(例: `foo`)
  - 2番目は`-1`を追加(`foo-1`)
  - 3番目以降も同様に連番を振る(`foo-2`, `foo-3`, ...)

実例を示す。

```markdown
### [GitHub Markdown](#)とは?
```

> ### [GitHub Markdown](#)とは?

→ [`id="github-markdownとは"`](#github-markdownとは)

> <details>
> <summary>変換手順</summary>
> 
> 1. テキストを抽出(リンク情報は除去) → `GitHub Markdownとは?`
> 2. スペースを`-`に変換 → `GitHub-Markdownとは?`
> 3. `-`以外のASCII句読文字を除去 → `GitHub-Markdownとは`
> 4. アルファベットを小文字に変換 → `github-markdownとは`
> </details>

```markdown
### *F*,o<sup>o</sup>!
```

> ### *F*,o<sup>o</sup>!

→ [`id="foo"`](#foo)

> <details>
> <summary>変換手順</summary>
> 
> 1. テキストを抽出(書式設定は除去) → `F,oo!`
> 2. `-`以外のASCII句読文字を除去 → `Foo`
> 3. アルファベットを小文字に変換 → `foo`
> </details>

```markdown
#### F=OO
```

> #### F=O/O

→ [`id="foo-1"`](#foo-1)

> <details>
> <summary>変換手順</summary>
> 
> 1. テキストを抽出 → `F=O/O`
> 2. `-`以外のASCII句読文字を除去 → `FOO`
> 3. アルファベットを小文字に変換 → `foo`
> 4. 上と重複するため連番を追加 → `foo-1`
> </details>

> 以上の仕様はよく知られているもので、他のMarkdownを用いたWebサービス/アプリでも同じ仕様が多い。ただしGitHubの公式ドキュメントを探しても記述は見当たらないのでこの機会にまとめておいた。

## 数式

Markdown応用環境の多くが[LaTeX]仕様の数式表現を取り入れており、GitHubでも採用されている。

> &#x2714;&#xFE0F; **[LaTeX]の数式表現**
> 
> [LaTeX]は元々書籍用の組版ツールで、現在も論文執筆用によく用いられる。また最近はLaTeXの数式記述書式が事実上の標準となり他分野でも用いられるようになった。Markdown習得に関してはこの数式表現だけ覚えればよい。次のWikipedia解説が詳しい。
> 
> https://meta.wikimedia.org/wiki/Help:Displaying_a_formula/ja#関数・演算子・特殊記号
> 
> https://meta.wikimedia.org/wiki/Help:Displaying_a_formula/ja#大きな式
> 
> https://meta.wikimedia.org/wiki/Help:Displaying_a_formula/ja#アルファベットと書体

MarkdownにLaTeX数式を埋め込む書式はMarkdown実装/環境により異なる。GitHubの場合をまとめると次の通り。

- [ブロック]の場合(2通り)
  - 前後に[空行]を入れて`$$...$$`
  - または[info文字列]に`math`を設定した[コードブロック]
- [インライン]は`$...$`
  - 前後に区切りとして認識できる文字(通常スペース)が必要。
  - 同じ行にテキストの`$`がある場合は`<span>$</span>`でエスケープ

### ブロックの場合

前後に[空行]を入れて`$$...$$`、または[info文字列]に`math`を設定した[コードブロック]で記述する。

``````markdown
#### 例1

$$a^2 = b^2 + c^2 - 2 b c \cos A$$

#### 例2

```math
\int_{-\infty}^{\infty} exp \left ( - \frac{x^2}{2} \right ) dx = \sqrt{2 \pi}
```
``````

> #### 例1
> 
> $$x = \frac{-b \pm \sqrt{b^2 - 4 a c}}{2 a}$$
> 
> #### 例2
> 
> ```math
> \int_{-\infty}^{\infty} exp \left ( - \frac{x^2}{2} \right ) dx = \sqrt{2 \pi}
> ```

#### インラインの場合

`$...$`の内部に記述する。

```markdown
質量 $m$ とエネルギー $E$ は等価であり、両者の関係は光速度を $c$ として $E = m c^2$ で表される。
```

> 質量 $m$ とエネルギー $E$ は等価であり、両者の関係は光速度を $c$ として $E = m c^2$ で表される。

> <details>
> <summary>&#x26A0;&#xFE0F; <strong>失敗例</strong></summary>
> 
> 日本語に埋め込む場合は数式の前後をスペースで区切らないと認識しない。次は失敗例。
> 
> ```markdown
> 質量$m$とエネルギー$E$は...
> ```
> 
> > 質量$m$とエネルギー$E$は...
> </details>

同じ文章の手前にテキストとして`$`が含まれる場合は`<span>`でエスケープする。ただし[コードスパン]内部の`$`はエスケープ不要。

```markdown
エスケープが必要な例: <span>$</span>10 の $\frac{1}{4}$

この`$`はエスケープ不要: $a^2 = b^2 + c^2 - 2 b c \cos A$
```

> エスケープが必要な例: <span>$</span>10 の $\frac{1}{4}$
> 
> この`$`はエスケープ不要: $$a^2 = b^2 + c^2 - 2 b c \cos A$$

> <details>
> <summary>&#x26A0;&#xFE0F; <strong>失敗例</strong></summary>
> 
> 失敗例を示す。最初の文例はエスケープしない場合で、手前にある`$10 の $`までの部分を数式と判定する(誤認識)。[バックスラッシュエスケープ]や[文字参照]を用いても効果はなく(同じ結果)、解決法は`<span>$</span>`によるエスケープしかない。
> 
> ```markdown
> エスケープなし(`$10 の $`の部分を数式と認識する): $10 の $\frac{1}{4}$
> 
> エスケープ失敗例(1): \$10 の $\frac{1}{4}$
> 
> エスケープ失敗例(2): &dollar;10 の $\frac{1}{4}$
> 
> 正しいエスケープ: <span>$</span>10 の $\frac{1}{4}$

> ```
> > エスケープなし(`$10 の $`の部分を数式と認識する): $10 の $\frac{1}{4}$
> > 
> > エスケープ失敗例(1): \$10 の $\frac{1}{4}$
> > 
> > エスケープ失敗例(2): &dollar;10 の $\frac{1}{4}$
> > 
> > 正しいエスケープ: <span>$</span>10 の $\frac{1}{4}$
> </details>

### 数式の内部に`$`を含む場合

> &#x26A0;&#xFE0F; **注意** 動作に不安定な傾向があるため、可能であれば回避すべき。[LaTeX]数式埋め込みは後から追加された機能のため仕様が厳密ではなく(パッチを当てたような状態)、予想とは異なる振る舞いがよく発生する。

Markdown側ではのLaTeX数式の認識に`$`を用いるため、数式表現の中に`$`が含まれる場合は特殊な記法を用いる。

#### 例1 `\sqrt{$4}`

これは[GitHub docs](https://docs.github.com/ja/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions#インラインで数式の内外にドル記号を記述する)からの例。この場合は数式内の`$`をエスケープして`\$`に置換すればよい。

``````markdown
$$\sqrt{\$2}$$

```math
\sqrt{\$2}
```

インライン: $\sqrt{\$2}$
``````

> $$\sqrt{$2}$$
> 
> ```math
> \sqrt{$2}
> ```
> 
> インライン: $\sqrt{$2}$

> (2023-02現在)GitHubの実環境チェックによればブロックの中ではエスケープ不要。ただし`$`はLaTeXでは特殊文字扱いで、テキストとして表示する場合は`\$`とするのがLaTeX本来の仕様なのでマナーとして付けておくべき。

#### 例2 `f $ x`

数式の中に`$`を用いることはめったにないが、[Haskell]の教科書にはよく`f $ x`という表現を数式と同じスタイルで表示する記法が見られる。数式中に1文字分のスペースを確保するにはtext spaceの`\ `を用いる。ところがこの場合はインライン記法で複雑なエスケープを用いる必要がある。

``````markdown
$$f \ \$ \ x$$

```math
f \ \$ \ x
```

インライン: $f \\ \\$ \\ x$
``````

> $$f \ \$ \ x$$
> 
> ```math
> f \ \$ \ x
> ```
> 
> インライン: $f \\ \\$ \\ x$

> &#x26A0;&#xFE; **注意** この動作(ダブルエスケープが必要)は2023-02現在のもので、意図通りには動作しないため相当試行錯誤してやっと見つけた。ただしこの動作は後で修正される可能性があり、そういう意味でも回避できるのであれば使わない方が無難。

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
[info文字列]: code-blocks.md#info文字列
[LaTeX]: https://ja.wikipedia.org/wiki/LaTeX
[インライン]: inlines.md
[コードブロック]: code-blocks.md
[ブロック]: blocks.md
[付録]: appendices.md
[空行]: characters.md#空行
[目次]: index.md#github-markdown




<!--
[ASCII句読文字]: backslash-escapes.md#ASCII句読文字
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[折りたたみ]: html-blocks.md#折りたたみ
[見出し]: thematic-breaks.md
-->
