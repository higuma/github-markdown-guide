# [3 Blocks and inlines](https://higuma.github.io/github-flabored-markdown/#blocks-and-inlines)

[2 Preliminaries](preliminaries.md)
← [Table of Contents](index.md) →
[4 Leaf blocks](leaf-blocks.md)

------------------------------------------------------------------------

ブロック(要素)とインライン(要素)の違いの解説。HTMLと基本的に同じなので補足事項なし。

## [3.1 Precedence](https://higuma.github.io/github-flabored-markdown/#precedence)

Markdownのブロックとインラインがごちゃまぜになった場合はブロックが優先する。次の例ではブロック(`- ...` → `<li>`)とインライン(`...` → `<code>`)が境界を互いにまたいでいることに注目。

> ```markdown
> - `one
> - two`
> ```

結果は次の通り。ブロックの`- ...`が優先して`<li>`をレンダーし、それぞれの`` ` ``は単にそのまま文字として出力する。

- `one
- two`

これからも分かる通り、文法解析はまずブロックを先に行い、その後にインラインを処理する。

## [3.2 Container blocks and leaf blocks](https://higuma.github.io/github-flabored-markdown/#container-blocks-and-leaf-blocks)

ブロックには2種類ある。

* __container blocks__: 内部に別のブロックを持つことができる(ネストできる) - `<ul>`, `<li>`, etc.
* __leaf blocks__: 内部に別のブロックを持てない(ネストできない) - e.g. `<h1>`, `<hr>`, etc.

------------------------------------------------------------------------

[2 Preliminaries](preliminaries.md)
← [Table of Contents](index.md) →
[4 Leaf blocks](leaf-blocks.md)
