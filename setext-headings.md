# [4.3 Setext headings](https://higuma.github.io/github-flabored-markdown/#setext-headings)

[4.2 ATX headings](atx-headings.md)
← [Table of contents](index.md) →
[4.4 Indented code blocks](indented-code-blocks.md)

------------------------------------------------------------------------

見出し(``<h1>``, ``<h2>``)を表現する。

### Best practice

``<h3>``以上のレベルを表現できないので、見出しは[ATX headings]に統一するとよい。

### Details

<details>
<summary><strong>Summary</strong></summary>

> [Setext]から取り入れた仕様。なおBest practiceで「非推奨」としたため説明は最小限に留める。

コンテンツテキストの次行に1つ以上の`=`(→ ``<h1>``)または1つ以上の`-`(→ ``<h2>``)を用いて[見出し]を表現できる。

```markdown
h1
==

h2
--
```

> h1
> ==
> 
> h2
> --

ポイントをまとめる(概略説明のみ)。

* コンテンツ内には任意の[インライン]を挿入可能
* コンテンツは複数行にまたがっていてもよい(ただし[空行]でないことが条件)
* コンテンツは空であってはならない([ATX headings]と異なる)
* [見出し]表示行は1つ以上の`=`(→``<h1>``)または1つ以上の`-`(→``<h2>``)
    * 行頭に3つまでスペースを挿入可能
    * 行末に任意個のスペースがあってもよい
    * [正規表現]を用いると ``/^ {0,3}(?:=+|-+) *$/``
* 前後に[空行]は不要(だが経験上入れないとよく誤認識する)
* ``<h3>``以上のレベルには対応していない

</details>

------------------------------------------------------------------------

[4.2 ATX headings](atx-headings.md)
← [Table of contents](index.md) →
[4.4 Indented code blocks](indented-code-blocks.md)

[ATX]: https://en.wikipedia.org/wiki/Aaron_Swartz#atx
[ATX headings]: #42-atx-headings
[コードフェンス]: https://higuma.github.io/github-flabored-markdown/#code-fence
[CommonMark]: https://commonmark.org/
[info string]: https://higuma.github.io/github-flabored-markdown/#info-string
[Markdown]: https://ja.wikipedia.org/wiki/Markdown
[Setext]: https://en.wikipedia.org/wiki/Setext
[Setext heading]: #43-setext-headings
[インデント方式コードブロック]: #44-indented-code-blocks
[インライン]: inlines.md
[コードフェンス]: https://higuma.github.io/github-flabored-markdown/#code-fence
[シンタックスハイライト]: https://ja.wikipedia.org/シンタックスハイライト
[フェンスドコードブロック]: #45-fenced-code-blocks
[リスト]: container-blocks.md#54-lists
[リンク]: https://higuma.github.io/github-flabored-markdown/#links
[リンク参照定義]: https://higuma.github.io/github-flabored-markdown/#link-reference-definition
[リンクラベル]: https://higuma.github.io/github-flabored-markdown/#link-label
[リンク先]: https://higuma.github.io/github-flabored-markdown/#link-destination
[リンクタイトル]: https://higuma.github.io/github-flabored-markdown/#link-title
[パラグラフ]: #48-paragraphs
[空行]: #49-blank-lines
[空白文字]: https://higuma.github.io/github-flabored-markdown/#whitespace-character
[正規表現]: https://deeloper.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
[見出し]: #42-atx-headings