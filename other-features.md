# その他の機能

[HTMLブロック]
← [目次] →
[GitHub特有の機能]

------------------------------------------------------------------------

本章では[GitHub Flavored Markdown]仕様には含まれていないが、すでに多くのMarkdown環境に取り入れられており、GitHubでも利用可能な機能について説明する。

## 見出しのID設定

GitHub Markdownでは[見出し]に対して次のルールでIDを自動的に割り振る。この仕様はMarkdownを利用する多くのWeb環境で用いられているもので、GitHubでも事実上の標準扱いとして採用している。

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

> 以上の仕様はよく知られているものだが、GitHubの公式ドキュメントを探しても記述は見当たらないのでこの機会にまとめておいた。

## 数式

Markdown応用環境の多くが[LaTeX]仕様の数式表現を採用しており、GitHubにも取り込まれている。

> &#x2714;&#xFE0F; **[LaTeX]の数式表現**
> 
> [LaTeX]は元々書籍用の組版ツールで現在も論文執筆用にはよく用いられる。また数式表現の分野では[LaTeX]仕様が事実上の標準となり他分野でも用いられる。Markdown習得に関してはこの数式表現部分だけ覚えればよい。次のWikipedia解説がよい(実用的)。
> 
> - https://meta.wikimedia.org/wiki/Help:Displaying_a_formula/ja#関数・演算子・特殊記号
> - https://meta.wikimedia.org/wiki/Help:Displaying_a_formula/ja#大きな式
> - https://meta.wikimedia.org/wiki/Help:Displaying_a_formula/ja#アルファベットと書体

GitHub MarkdownでLaTeX数式を埋め込む書式は次の通り(まとめ)。細かい注意点は後で説明する。

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

### インラインの場合

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

`コードスパン内の$`はエスケープ不要: $a^2 = b^2 + c^2 - 2 b c \cos A$
```

> エスケープが必要な例: <span>$</span>10 の $\frac{1}{4}$
> 
> `コードスパン内の$`はエスケープ不要: $a^2 = b^2 + c^2 - 2 b c \cos A$

> <details>
> <summary>&#x2757;&#xFE0F; <strong>失敗例</strong></summary>
> 
> 失敗例を示す。最初の文例はエスケープしない場合で、手前にある`$10 の $`までの部分を数式と判定する(誤認識)。[バックスラッシュエスケープ]や[文字参照]を用いても効果はなく、`<span>$</span>`を使わないと正しく処理できない。
> 
> ```markdown
> - エスケープなし(`$10 の $`の部分を数式と認識する): $10 の $\frac{1}{4}$
> - エスケープ失敗例(1): \$10 の $\frac{1}{4}$
> - エスケープ失敗例(2): &dollar;10 の $\frac{1}{4}$
> - 正しいエスケープ: <span>$</span>10 の $\frac{1}{4}$
> ```
> 
> > - エスケープなし(`$10 の $`の部分を数式と認識する): $10 の $\frac{1}{4}$
> > - エスケープ失敗例(1): \$10 の $\frac{1}{4}$
> > - エスケープ失敗例(2): &dollar;10 の $\frac{1}{4}$
> > - 正しいエスケープ: <span>$</span>10 の $\frac{1}{4}$
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

数学分野では数式の中に`$`を用いることは滅多にないが、[Haskell]の教科書にはよく`f $ x`や`f $! x`のようなコード(式)を数式スタイルで表示する記法が見られる。数式中に1文字分のスペースを確保するにはtext spaceの`\ `を用いるが、これをインライン記法に用いる場合には複雑なエスケープが必要になる。

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

> &#x1F6AB; **非推奨** インラインの特殊記法(二重エスケープ)はどこにも書かれていないため試行錯誤して見つけた(2023-02現在)。ただしこの動作は(不具合ではないと思われるが)後で修正される可能性が高く、その意味でもできるたけ回避すべき。

## Mermaidによるダイアグラム・チャート

[Mermaid]はダイアグラム・チャート記述用の言語で、2021,2年頃にMarkdownを用いるWebサイトに一斉に採用され普及した(GitHubは[2022年2月](https://github.blog/2022-02-14-include-diagrams-markdown-files-mermaid/))。どのサイトも[コードブロック]として扱い、[info文字列](code-blocks.md#info文字列)として`mermaid`を指定して記述する。

``````markdown
```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
``````

> ```mermaid
> graph TD;
>     A-->B;
>     A-->C;
>     B-->D;
>     C-->D;
> ```

## 脚注

脚注はGitHubの他、はてなブログ、Qiita、Zennなどが対応しており、どのWebサイトも同様の文法仕様を採用している。以下はGitHub上で確認した内容について詳しく説明する。

### 脚注の記述

脚注は次のように`[^ラベル]: テキスト`の形式で記述する。これらは文書内の任意の場所に記述可能で、複数箇所に分散していてもよい。出力時にまとめられて文書の末尾に出力される。

```markdown
[^1]: 脚注の例
[^2]: *Italic(斜体)* __太字__ ~~打ち消し線~~
[^3]: リンク https://github.com/
[^4]: `コードスパン`
[^5]: 画像 ![Octocat](https://github.githubassets.com/images/icons/emoji/octocat.png?v8)
[^6]: HTMLインライン <ruby>羆<rt>ひぐま</rt></ruby>
[^7]: 数式 $y=f(x)$
[^abc]: ラベルの例
[^あいう]: ラベルは日本語でもよい
[^used]: この脚注は複数回引用される
[^not-used]: この脚注は引用されない
[^soft-break]: ソフト改行の例
同じ行の続き
[^hard-break]: ハード改行の例\
次の行
[^block-list]:
    - リストアイテム1
    - リストアイテム2
[^block-code-block]:
    ```lisp
    ;; code block example
    (defun hello-markdown() (format t "hello Markdown!"))
    ```
[^block-table]:
    | 表 | 表 |
    | - | - |
    | セル | セル |
```

<!-- ここから脚注: これらはこの場所ではなくページ末尾に出力される -->

[^1]: 脚注の例
[^2]: *Italic(斜体)* __太字__ ~~打ち消し線~~
[^3]: リンク https://github.com/
[^4]: `コードスパン`
[^5]: 画像 ![Octocat](https://github.githubassets.com/images/icons/emoji/octocat.png?v8)
[^6]: HTMLインライン <ruby>羆<rt>ひぐま</rt></ruby>
[^7]: 数式 $y=f(x)$
[^abc]: ラベルの例
[^あいう]: ラベルは日本語でもよい
[^used]: この脚注は複数回引用される
[^not-used]: この脚注は引用されない
[^soft-break]: ソフト改行の例
同じ行の続き
[^hard-break]: ハード改行の例\
次の行
[^block-list]:
    - リストアイテム1
    - リストアイテム2
[^block-code-block]:
    ```lisp
    ;; code block example
    (defun hello-markdown() (format t "hello Markdown!"))
    ```
[^block-table]:
    | 表 | 表 |
    | - | - |
    | セル | セル |

<!-- 脚注終わり -->

文法上の要点をリストにまとめる。

- `[^ラベル]: テキスト`の形式で記述
  - `[^ラベル]:`とテキストの間の空白は除去して処理(GitHubでは密着していても認識する)
  - `ラベル`は整数だけでなくユニークな文字列(識別子)であれば何でもよい
  - テキストは基本的に[パラグラフ]と同じ文法
    - 内部に任意の[インライン]アイテムを記述可能
      - ただしGitHubでは今のところ[数式]は効果なし(2023-02現在)
    - [ソフト改行]、[ハード改行]も認識する
  - [ブロック]アイテムを挿入する場合は改行して4文字インデント(GitHubの場合)
- 脚注の認識も基本的に[パラグラフ]と同様(単一の[ブロック]扱い)
  - 連続する脚注の間は[空行]不要
  - 前後に別種の[ブロック]アイテムがある場合は[空行]を入れるとよい(推奨)
  - 複数箇所に分散して記述してよい(処理時にまとめられる)

> &#x26A0;&#xFE0F; [GitHub docs](https://docs.github.com/ja/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#footnotes)の`[^2]`のコード例に書かれている”Every new line should be prefixed with 2 spaces."は誤り。この場合はインデントは無関係で、実際には行末スペース2個による[ハード改行]により改行している。

### 脚注の引用

脚注を引用する側の文章では`[^ラベル]`の書式を用いる。[インライン]アイテムを挿入できる場所ならどこにでも使える。

```markdown
パラグラフの中[^1] **強調文の中[^2]**

- 以下はリストの中: リンク[^3]
- コードスパン[^4]
- 画像[^5]
- HTMLインライン[^6]
- 数式[^7]
- ラベル[^abc]
- 日本語ラベル[^あいう]

### 見出しの中[^used]

> ブロック引用の中[^used]

| 表の中 | [^used] |
| - | - |
| ソフト改行[^soft-break] | ハード改行[^hard-break] |
| リスト[^block-list] | コードブロック[^block-code-block] |
| 表[^block-table] |
```

> パラグラフの中[^1] **強調文の中[^2]**
> 
> - 以下はリストの中: リンク[^3]
> - コードスパン[^4]
> - 画像[^5]
> - HTMLインライン[^6]
> - 数式[^7]
> - ラベル[^abc]
> - 日本語ラベル[^あいう]
> 
> ### 見出しの中[^used]
> 
> > ブロック引用の中[^used]
> 
> | 表の中 | [^used] |
> | - | - |
> | ソフト改行[^soft-break] | ハード改行[^hard-break] |
> | リスト[^block-list] | コードブロック[^block-code-block] |
> | 表[^block-table] |

ただし[コードスパン]と[コードブロック]の内部には効果がなくそのまま出力する。

``````markdown
```markdown
[^1]
```

`コードスパン[^1]`
``````

> ```markdown
> [^1]
> ```
> 
> `コードスパン[^1]`

### 脚注の出力

処理時にラベルに連番が割り振られ、未参照の脚注は出力から除去する。そしてソーステキストの記述場所とは関係なく常にHTML出力の末尾に脚注用のスタイルで表示する(→ [表示確認](#footnotes))。また脚注には引用元値のリンクが自動的に付与される。

- 全てまとめて末尾にまとめて脚注のスタイルで出力される
  - 連番処理を行い、番号が付け直される
  - 引用(参照)されていない脚注を除去
  - 各脚注の末尾に参照先へのリンクが付く

------------------------------------------------------------------------

[HTMLブロック]
← [目次] →
[GitHub特有の機能]

[ASCII句読文字]: backslash-escapes.md#ASCII句読文字
[GitHub Flavored Markdown]: github-flavored-markdown.md
[GitHub特有の機能]: github-specific.md
[Haskell]: https://ja.wikipedia.org/wiki/Haskell
[HTMLブロック]: html-blocks.md
[info文字列]: code-blocks.md#info文字列
[LaTeX]: https://ja.wikipedia.org/wiki/LaTeX
[Mermaid]: https://mermaid.js.org/
[インライン]: inlines.md
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[ソフト改行]: paragraphs.md#ソフト改行
[ノーブレークスペース]: texts.md#ノーブレークスペース
[ハード改行]: paragraphs.md#ハード改行
[パラグラフ]: paragraphs.md
[バックスラッシュエスケープ]: characters.md#バックスラッシュエスケープ
[ブロック]: blocks.md
[リンク参照定義]: links.md#リンク参照定義
[空行]: characters.md#空行
[非表示区切り]: texts.md#非表示区切り
[見出し]: thematic-breaks.md
[目次]: index.md#other-features
[文字参照]: characters.md#文字参照

<div id="footnotes"></div>
