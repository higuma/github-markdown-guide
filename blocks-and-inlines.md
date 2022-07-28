# [3 Blocks and inlines](https://higuma.github.io/github-flabored-markdown/#blocks-and-inlines)

[2 Preliminaries](preliminaries.md)
← [Table of contents](index.md) →
[4 Leaf blocks](leaf-blocks.md)

------------------------------------------------------------------------

Markdownのブロック構文とインライン構文はそれぞれHTMLのブロック要素とインライン要素に対応する。

> 本ガイドはHTMLの中級程度の知識を前提としている。ブロック要素とインライン要素の違いが分からない人は次のMDN解説を読むとよい。
> 
> * [MDN - インライン要素](https://developer.mozilla.org/ja/docs/Web/HTML/Inline_elements)
> * [MDN - ブロックレベル要素](https://developer.mozilla.org/ja/docs/Web/HTML/Block-level-elements)
> 
> なおMarkdownにはCSS([`display`](https://developer.mozilla.org/ja/docs/Web/CSS/display)属性)でブロック/インラインの種別を変更するような高度な機能は今のところない。

## [3.1 Precedence](https://higuma.github.io/github-flabored-markdown/#precedence)

構文解析はHTMLと同様の木構造に基いて行われる。そのため構文要素間では一方がもう一方を含む(子孫関係)ことはあっても、両者が部分的にオーバーラップすることはない。

特にMarkdownのブロックとインラインの記述がオーバーラップした場合はブロックを優先して構文解析する。次の例ではブロック構文の[リストアイテム](`- ...` → `<li>`)とインライン構文の[コードスパン](`` `one ... two` `` → `<code>`)の記法が互いに境界をオーバーラップしていることに注目。

```markdown
- `one
- two`
```

結果は次の通り。ブロックの`- ...`が優先して(外側に`<ul>`を配してその内部の)2個の`<li>`に変換され、分断されたそれぞれの`` ` ``は([コードスパン]とは認識せず)そのまま文字として出力する。

> - `one
> - two`

この通り文法解析はまずブロックを先に行い、その後にインラインを処理する。

## [3.2 Container blocks and leaf blocks](https://higuma.github.io/github-flabored-markdown/#container-blocks-and-leaf-blocks)

ブロックには2種類ある。

* __container blocks__: 内部に別のブロックを持つことができる(ネスト可) - [引用文](container-blocks.md#51-block-quotes), [リスト](container-blocks.md#54-lists), [リストアイテム](container-blocks.md#52-list-items), etc.
* __leaf blocks__: 内部に別のブロックを持てない(ネスト不可) - [見出し](leaf-blocks.md#42-atx-headings), [コードブロック](leaf-blocks.md#45-fenced-code-blocks), [パラグラフ](leaf-blocks.md#48-paragraphs), etc.

> [表組み](leaf-blocks.md#410-tables-extension)(`<table>`)はHTMLではネスト可能だが、GFMでは(少なくとも今のところ)ネストできない(leafとして扱われる)。どうしても必要な場合は[HTMLブロック](leaf-blocks.md#46-html-blocks)を使えば一応可能。ただしネストした表を用いるケースは稀で、筆者は今まで必要になったことはない。

------------------------------------------------------------------------

[2 Preliminaries](preliminaries.md)
← [Table of contents](index.md) →
[4 Leaf blocks](leaf-blocks.md)

[コードスパン]: inlines.md#63-code-spans
[リストアイテム]: container-blocks.md#52-list-items
