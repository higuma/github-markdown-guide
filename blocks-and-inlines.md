# [3 ブロックとインライン](https://higuma.github.io/github-flabored-markdown/#blocks-and-inlines)

[2 予備知識](preliminaries.md)
← [目次](index.md) →
[4 葉ブロック](leaf-blocks.md)

------------------------------------------------------------------------

> 本ガイドはHTMLの中級程度の知識を前提としている。ブロック要素とインライン要素の違いが分からない人は次のMDN解説を読むとよい。
> 
> * [MDN - インライン要素](https://developer.mozilla.org/ja/docs/Web/HTML/Inline_elements)
> * [MDN - ブロックレベル要素](https://developer.mozilla.org/ja/docs/Web/HTML/Block-level-elements)
> 
> なおMarkdownにはCSS([`display`](https://developer.mozilla.org/ja/docs/Web/CSS/display)属性)でブロック/インラインの種別を変更するような高度な機能は今のところない。

Markdownの文法はブロック構文とインライン構文の2種類に分類され、これらはそれぞれHTMLのブロック要素とインライン要素に対応する。

## [3.1 優先度](https://higuma.github.io/github-flabored-markdown/#precedence)

構文解析はHTMLと同じ木構造に従って行われ、その結果をHTML文書として出力する。木構造では構文要素間の一方がもう一方を含む(子孫関係)ことはあっても、両者が部分的にオーバーラップすることはない。

そしてMarkdownの構文解析でブロックとインラインの記述がオーバーラップした場合はブロックを優先する。次の例ではブロック構文である2つの[リストアイテム](`- ...` → `<li>`)とインライン構文の[コードスパン](`` `one ... two` `` → `<code>`)の記法が互いに境界をオーバーラップしていることに注目。

```markdown
- `one
- two`
```

結果は次の通り。ブロックの`- ...`が優先して(外側に`<ul>`を配してその内部の)2個の`<li>`に変換され、分断されたそれぞれの`` ` ``は([コードスパン]とは認識せず)そのまま文字として出力する。

> - `one
> - two`

以上の通りMarkdownの構文解析はまずブロックを先に行い、その後にインラインを処理する。

## [3.2 コンテナブロックと葉ブロック](https://higuma.github.io/github-flabored-markdown/#container-blocks-and-leaf-blocks)

ブロックには2種類ある。

* [コンテナブロック](container-blocks.md): 内部に別のブロックを持つことができる(ネスト可)
    * [引用](block-quotes.md), [リスト](lists.md), [リストアイテム](list-items.md), etc.
* [葉ブロック](leaf-blocks.md): 内部に別のブロックを持てない(ネスト不可)
    * [見出し](atx-headings.md), [コードブロック](fenced-code-blocks.md), [パラグラフ](paragraphs.md), etc.

> [表組み](tables-extension)(`<table>`)はHTMLではネスト可能だが、GFMの表組み機能ではネストできない(葉ブロックとして扱われる)。どうしても必要な場合は[HTMLブロック](html-blocks.md)を使えば一応可能。ただしネストした表を用いるケースは稀で、筆者は今まで必要になったことはない。

------------------------------------------------------------------------

[2 予備知識](preliminaries.md)
← [目次](index.md) →
[4 葉ブロック](leaf-blocks.md)

[コードスパン]: code-spans.md
[リストアイテム]: list-items.md
