# [3 ブロックとインライン](https://higuma.github.io/github-markdown-guide/gfm/#blocks-and-inlines)

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

## [3.1 優先度](https://higuma.github.io/github-markdown-guide/gfm/#precedence)

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

## [3.2 コンテナブロックと葉ブロック](https://higuma.github.io/github-markdown-guide/gfm/#container-blocks-and-leaf-blocks)

ブロックには2種類ある。

* [コンテナブロック]\: 内部に別のブロックを持つことができる(ネスト可)
    * [引用], [リスト], [リストアイテム], etc.
* [葉ブロック]\: 内部に別のブロックを持てない(ネスト不可)
    * [見出し], [コードブロック], [パラグラフ], etc.

> [表]はHTMLではネスト可能だが、GFMの表組み機能ではネストできない(葉ブロックとして扱われる)。どうしても必要な場合は[HTMLブロック]を使えば可能(ただし必要になることは滅多にない)。

------------------------------------------------------------------------

[2 予備知識](preliminaries.md)
← [目次](index.md) →
[4 葉ブロック](leaf-blocks.md)

[HTMLブロック]: html-blocks.md
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[コンテナブロック]: container-blocks.md
[パラグラフ]: paragraphs.md
[リスト]: lists.md
[リストアイテム]: list-items.md
[引用]: block-quotes.md
[葉ブロック]: leaf-blocks.md
[表]: tables.md
[見出し]: headings.md
