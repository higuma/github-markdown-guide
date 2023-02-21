# その他の機能

[HTMLブロック]
← [目次] →
[GitHub特有の機能]

------------------------------------------------------------------------

> **TODO** GFMには含まれないが他の環境にもよくあるもの(見出しへのID設定、数式、脚注)と、GitHub特有の機能(絵文字の名前指定、CSS色表現など)を分割して章を分けるべき。検討中。

実際のGitHubサイトのMarkdown環境には[GFM]仕様書には書かれていないサイト専用の機能が多数存在する。

> 機能拡張の結果[GFM]仕様書通りではなくなっている部分もある。



> Markdownを用いる現実のWebサービス/アプリではMarkdown実装だけでなく、文書を表示するWeb環境(HTML, CSS, etc.)にも大きく依存しており、同じ仕様のMarkdown実装を用いていてもそれを利用するためのWeb環境が異なれば当然表示結果も異なる。

本章の内容の中には他のMarkdown環境でも採用されているものがいくつかある。他のMarkdown環境でも採用されている一般的な仕様を前半で説明し、GitHub特有の機能について後半に示す。

## 見出しのID設定

GitHub Markdownをはじめとする多くMarkdown環境では[見出し]に対して次のルールでIDを自動的に割り振る。

- 見出し文のテキストを抽出して次の変換を行う
  - スペースを`-`に変換
  - `-`と`_`以外の[ASCII句読文字]を除去
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
> 3. `-`と`_`以外のASCII句読文字を除去 → `GitHub-Markdownとは`
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
> 2. `-`と`_`以外のASCII句読文字を除去 → `Foo`
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
> 2. `-`と`_`以外のASCII句読文字を除去 → `FOO`
> 3. アルファベットを小文字に変換 → `foo`
> 4. 上と重複するため連番を追加 → `foo-1`
> </details>

> 以上の仕様はよく知られているもので、他のMarkdownを用いたWebサービス/アプリでも同じ仕様が多い。ただしGitHubの公式ドキュメントを探しても記述は見当たらないのでこの機会にまとめておいた。

## 数式

Markdown応用環境の多くが[LaTeX]仕様の数式表現を取り入れており、GitHubにも採用されている。

> &#x2714;&#xFE0F; **[LaTeX]の数式表現**
> 
> [LaTeX]は元々書籍用の組版ツールで現在も論文執筆用によく用いられる。また数式表現の分野では[LaTeX]仕様が事実上の標準となり他分野でも用いられている。Markdown習得に関してはこの部分だけ覚えればよい。次のWikipedia解説がよい(実用的)。
> 
> - https://meta.wikimedia.org/wiki/Help:Displaying_a_formula/ja#関数・演算子・特殊記号
> - https://meta.wikimedia.org/wiki/Help:Displaying_a_formula/ja#大きな式
> - https://meta.wikimedia.org/wiki/Help:Displaying_a_formula/ja#アルファベットと書体

MarkdownにLaTeX数式を埋め込む書式のGitHub仕様をまとめると次の通り。

- [ブロック]の場合(2通り)
  - 前後に[空行]を入れて`$$...$$`
  - または[info文字列]に`math`を設定した[コードブロック]
- [インライン]は`$...$`
  - 前後に区切りとして認識できる文字(通常スペース)が必要。
  - 同じ行の手前にテキストの`$`がある場合は`<span>$</span>`でエスケープ

> &#x2714;&#xFE0F; 他のWeb環境もこれに準じた仕様が多い(Qiitaなど)。

### ブロックの場合

前後に[空行]を入れて`$$...$$`、または[info文字列]に`math`を設定した[コードブロック]で記述する。

``````markdown
#### 例1

$$x = \frac{-b \pm \sqrt{b^2 - 4 a c}}{2 a}$$

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

`$...$`の内部に記述する。数式の前後にスペースが必要。

```markdown
質量 $m$ とエネルギー $E$ は等価であり、両者の関係は光速度を $c$ として $E = m c^2$ で表される。
```

> 質量 $m$ とエネルギー $E$ は等価であり、両者の関係は光速度を $c$ として $E = m c^2$ で表される。

> <details>
> <summary>&#x2757;&#xFE0F; <strong>失敗例</strong></summary>
> 
> 次は失敗例。密着すると認識せず、[ノーブレークスペース]や[非表示区切り]も効かない。
> 
> ```markdown
> 質量$m$とエネルギー&nbsp;$E$&nbsp;は等価であり、両者の関係は光速度を&shy;$c$&shy;として...
> ```
> 
> > 質量$m$とエネルギー&nbsp;$E$&nbsp;は等価であり、両者の関係は光速度を&shy;$c$&shy;として...
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
> <summary>&#x2757;&#xFE0F; <strong>失敗例</strong></summary>
> 
> 失敗例を示す。最初の文例はエスケープしない場合で、手前にある`$10 の $`までの部分を数式と判定する(誤認識)。[バックスラッシュエスケープ]や[文字参照]を用いても効果はなく、`<span>$</span>`を使わないと正しく処理できない。
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
> 
> > エスケープなし(`$10 の $`の部分を数式と認識する): $10 の $\frac{1}{4}$
> > 
> > エスケープ失敗例(1): \$10 の $\frac{1}{4}$
> > 
> > エスケープ失敗例(2): &dollar;10 の $\frac{1}{4}$
> > 
> > 正しいエスケープ: <span>$</span>10 の $\frac{1}{4}$
> </details>

### 数式の内部に`$`を含む場合

> &#x26A0;&#xFE0F; **注意(2023-02現在)** 内部に`$`がある数式の[インライン]埋め込みは動作不安定のため回避すべき。[LaTeX]数式埋め込みは後から追加された機能のため仕様に不明瞭な点があり、予想と異なる振る舞いがよく発生する(パッチを当てたような状態)。

Markdown側ではのLaTeX数式の認識に`$`を用いるため、数式表現の中に`$`が含まれる場合は特殊な記法を用いる。

#### 例1 `\sqrt{$4}`

[GitHub docs](https://docs.github.com/ja/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions#インラインで数式の内外にドル記号を記述する)からの例。この場合は数式内の`$`をエスケープして`\$`に置換すればよい。

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

> &#x2757;&#xFE0F; **注意** (2023-02現在)GitHub実環境チェックによればブロックの中ではエスケープ不要。ただし`$`は[LaTeX]では特殊文字扱いであり、テキストとして表示する場合は`\$`とするのが本来の仕様なのでマナーとして付けるべき。また現状の動作は将来変更(修正)される可能性も考えられる。

#### 例2 `f $ x`

数式の中に`$`を用いることは滅多にないが、[Haskell]の教科書にはよく`f $ x`というコード(式)を数式スタイルで表示する記法が見られる。数式中に1文字分のスペースを確保するにはtext spaceの`\ `を用いるが、これをインライン記法に用いる場合には複雑なエスケープが必要になる。

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

> &#x1F6AB; **非推奨** インラインの特殊記法(二重エスケープ)はどこにも書かれていないため試行錯誤して見つけた(2023-02現在)。ただしこの動作は後で修正される可能性が高く、そういう意味でも回避可能な状況では使用を控えるべき。

## 脚注

Here is a simple footnote[^1].

A footnote can also have multiple lines[^2].  

You can also use words, to fit your writing style more closely[^note].

[^1]: My reference.
[^2]: Every new line should be prefixed with 2 spaces.  
  This allows you to have a footnote with multiple lines.
[^note]:
    Named footnotes will still render with numbers instead of the text but allow easier identification and linking.  
    This footnote also has been made with a different syntax using 4 spaces for new lines.










------------------------------------------------------------------------

[HTMLブロック]
← [目次] →
[GitHub特有の機能]

[ASCII句読文字]: backslash-escapes.md#ASCII句読文字
[GitHub特有の機能]: github-specific.md
[Haskell]: https://ja.wikipedia.org/wiki/Haskell
[HTMLブロック]: html-blocks.md
[info文字列]: code-blocks.md#info文字列
[LaTeX]: https://ja.wikipedia.org/wiki/LaTeX
[インライン]: inlines.md
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[ノーブレークスペース]: texts.md#ノーブレークスペース
[バックスラッシュエスケープ]:characters.md#バックスラッシュエスケープ
[ブロック]: blocks.md
[空行]: characters.md#空行
[非表示区切り]: texts.md#非表示区切り
[見出し]: thematic-breaks.md
[目次]: index.md#other-features
[文字参照]: characters.md#文字参照
