# Markdownの構文

[文字と行]
← [目次] →
[インライン](inlines.md)

------------------------------------------------------------------------

Markdownは出力形式であるHTMLと同様の木構造に基づいた文法解析を行う。Markdownにおける文法上のアイテムには大きく分けて次の2種類がある。

- [インライン] - テキストの一部として文字列内の順番に配置されるアイテム
- [ブロック] - 1行以上の大きさを持ち、行で区切られるアイテム

> &#x2714;&#xFE0F; これらはHTMLのインライン/ブロック要素に由来する(次を参照)。
> 
> - [MDN - インライン要素](https://developer.mozilla.org/ja/docs/Web/HTML/Inline_elements)
> - [MDN - ブロックレベル要素](https://developer.mozilla.org/ja/docs/Web/HTML/Block-level-elements)
> 
> なおインライン/ブロック文法モデルはHTML 4.01までの旧式で、現在のHTMLは[コンテンツカテゴリー](https://developer.mozilla.org/ja/docs/Web/Guide/HTML/Content_categories)という新しいモデルを用いている。ただしMarkdownは旧モデルに基づいた文法解析を行っており、新モデルとの関係は薄い。

## インライン

Markdownの文法構成アイテムの中で、テキスト文字列中のシーケンスとして配置するものを**インライン**と呼ぶ。[GitHub Flavored Markdown]仕様に含まれるインラインアイテム一覧を示す。

- [インライン](inlines.md)
    - [通常テキスト]
    - [太字、斜体、打ち消し線]
    - [リンク]
    - [画像]
    - [コードスパン]
    - [HTMLインライン]

> &#x2714;&#xFE0F; **用語について**: [GitHub Flavored Markdown]仕様書ではHTMLでの記述をインラインアイテムとして用いる場合を**raw HTML**、ブロックアイテムの場合を**HTML block**と呼ぶ。
> 
> しかし**raw HTML**という表現は本来(ブロック/インラインに関係なく)HTMLを直接用いるという意味であり、インラインに対してだけこの表現を用いるのは適切とは言えないと判断し、本解説ではより明解な「HTMLインライン」という表現を用いている。

## ブロック

Markdownの文法構成アイテムの中で、複数行で構成可能な[インライン]よりも大きな単位の構成を**ブロック**と呼ぶ。ブロックはその内部に[インライン]のシーケンスを含むことができる。またブロックの内部に別のブロックを再帰的に含む事ができるものもある。

- [ブロック](blocks.md)
    - [パラグラフ]
    - [見出し]
    - [水平線]
    - [表]
    - [コードブロック]
    - [ブロック引用]
    - [リスト]
    - [タスクリスト]
    - [HTMLブロック]

## 構文解析

まず大前提としてMarkdownには文法エラーというものはない。どのような入力でも受付け、HTMLとして表示可能な状態に変換して出力する。

> &#x2714;&#xFE0F; 認識困難な入力は多くの場合テキストと判断して最低限の文字参照変換処理を行い出力する。また[表]の見出し行よりデータ行の方がセル数が多い場合は余剰分を削除する(GitHub実装の場合)。詳細動作は実装に依存するが、いずれにせよ変換エラーということはなく、必ずHTMLとして表示可能な結果を出力する。

変換処理の際に構文解析を行うが、その際には[ブロック]の認識を優先して行い、その後で[インライン]を解析する。例としてまず次のようなMarkdownコードを考える。

```markdown
ABC _DEF
GHI_ JKL
```

結果はこうなる。

> ABC _DEF
> GHI_ JKL

この例では1行目`ABC _DEF`と2行目`GHI_ JKL`の間には改行が一つだけある。空行ではないため連結されて1つの[パラグラフ]\([ブロック])と認識される(1行扱い)。

> &#x2714;&#xFE0F; このルールは[ソフト改行]と呼ばれる。
> 
> &#x2757;&#xFE0F; **注意**:ただしGitHub以外のWeb環境の中にはこのルールが適用されず、通常のテキスト文章と同じように改行(`<br>`)を挿入するものもある([Qiita]など)。Markdownは実装により詳細仕様が異なることが多いため、常に実環境上でのチェックが必要。

次に結合されたパラグラフ内部のテキストを[インライン]として解析する。ここで`_DEF`と(スペースを挿入して連結された)`GHI_`が評価され、この部分が[斜体]で表示される。

ところが次の例では状況が全く異なる。

```markdown
- ABC _DEF
- GHI_ JKL
```

2行とも先頭の`-`を検出して[リスト項目]と判定する。結果は次の通り。

> - ABC _DEF
> - GHI_ JKL

連続する[リスト項目]は全体で1つの[リスト]\([ブロック])を構成する。また個別の[リスト項目]も[ブロック]で、二重の入れ子構造として扱われる。このケースでは`_DEF`と`GHI_`は別[ブロック]に属する別々の[インライン]として扱われ、斜体ではなく通常文字として出力される。

------------------------------------------------------------------------

[文字と行]
← [目次] →
[インライン](inlines.md)

[GitHub Flavored Markdown]: github-flavored-markdown.md
[HTMLインライン]: html-inlines.md
[HTMLブロック]: html-blocks.md
[Qiita]: https://qiita.com/
[インライン]: #インライン
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[ソフト改行]: paragraphs.md#ソフト改行
[タスクリスト]: task-lists.md
[パラグラフ]: paragraphs.md
[ブロック]: #ブロック
[ブロック引用]: block-quotes.md
[リスト]: lists.md
[リスト項目]: lists.md#リスト項目
[リンク]: links.md
[打ち消し線]: bold-italic-strikethrough.md#打ち消し線
[斜体]: bold-italic-strikethrough.md#斜体
[通常テキスト]: textual-content.md
[表]: tables.md
[太字]: bold-italic-strikethrough.md#太字
[太字、斜体、打ち消し線]: bold-italic-strikethrough.md
[画像]: images.md
[見出し]: headings.md
[目次]: index.md#syntax
[文字と行]: characters.md
[水平線]: horizontal-rules.md
