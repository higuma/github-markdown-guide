# [3 Blocks and inlines](https://higuma.github.io/github-flabored-markdown/#blocks-and-inlines)

[2 Preliminaries](preliminaries.md)
← [Table of contents](index.md) →
[4 Leaf blocks](leaf-blocks.md)

------------------------------------------------------------------------

ブロック(要素)とインライン(要素)の違いの解説。HTMLと基本的に同じなので補足事項なし。

> ただしHTMLのようにCSS(`display`属性)でブロック/インラインの種別を変更するような高度な機能は今のところない。

## [3.1 Precedence](https://higuma.github.io/github-flabored-markdown/#precedence)

Markdownのブロックとインラインがごちゃまぜになった場合はブロックが優先する。次の例ではブロック(`- ...` → `<li>`)とインライン(`` `one ... two` `` → `<code>`)が互いに境界をオーバーラップしていることに注目。

> ```markdown
> - `one
> - two`
> ```

結果は次の通り。ブロックの`- ...`が優先して(外側に`<ul>`を配し、その内部の)`<li>`に変換され、分断されたそれぞれの`` ` ``は単にそのまま文字として出力する。

> - `one
> - two`

これからも分かる通り文法解析はまずブロックを先に行い、その後にインラインを処理する。

## [3.2 Container blocks and leaf blocks](https://higuma.github.io/github-flabored-markdown/#container-blocks-and-leaf-blocks)

ブロックには2種類ある。

* __container blocks__: 内部に別のブロックを持つことができる(ネスト可) - [引用文](container-blocks.md#51-block-quotes), [リスト](container-blocks.md#54-lists), [リストアイテム](container-blocks.md#52-list-items), etc.
* __leaf blocks__: 内部に別のブロックを持てない(ネスト不可) - [見出し](leaf-blocks.md#42-atx-headings), [コードブロック](leaf-blocks.md#45-fenced-code-blocks), [パラグラフ](leaf-blocks.md#48-paragraphs), etc.

> [表組み](leaf-blocks.md#410-tables-extension)(`<table>`)はHTMLではネスト可能だが、GFMでは(少なくとも今のところ)ネストできない(leafとして扱われる)。どうしても必要な場合は[HTMLブロック](leaf-blocks.md#46-html-blocks)を使えば一応可能。ただしネストした表を用いるケースは稀で、筆者は今まで必要になったことはない。

------------------------------------------------------------------------

[2 Preliminaries](preliminaries.md)
← [Table of contents](index.md) →
[4 Leaf blocks](leaf-blocks.md)
