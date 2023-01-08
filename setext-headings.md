# [4.3 Setext見出し](https://higuma.github.io/github-markdown-guide/gfm/#setext-headings)

[4.2 見出し](headings.md)
← [目次](index.md) →
[4.5 コードブロック](code-blocks.md)

------------------------------------------------------------------------

> **旧版(完成後削除)**

旧式の[見出し]書式。初学時は飛ばして先へ進んでよい。

## ベストプラクティス

`<h3>`以上のレベルを表現できないため非推奨。現在の[見出し]に統一すること。

## まとめ

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

旧仕様のため要約のみ示す。

* コンテンツ内には任意の[インライン]構文を記述可能
* コンテンツは複数行にまたがっていてもよい(ただし[空行]でないことが条件)
* コンテンツは空であってはならない
* [見出し]表示行は1つ以上の`=`(→`<h1>`)または1つ以上の`-`(→`<h2>`)
    * 行頭に3つまでスペースを挿入可能
    * 行末に任意個のスペースがあってもよい
    * [正規表現]を用いると `/^ {0,3}(?:=+|-+)\s*$/`
* 前後に[空行]は不要(だが経験上入れないとよく誤認識する)
* `<h3>`以上のレベルには対応していない

> 初期のMarkdownで[Setext]から取り入れた仕様。古いMarkdown文書に時おり見られ、今でも後方互換性のため仕様は残されているが現在は不要。GitHub Docsの[Markdown解説](https://docs.github.com/ja/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)でも説明から外されている。

------------------------------------------------------------------------

[4.2 見出し](headings.md)
← [目次](index.md) →
[4.5 コードブロック](code-blocks.md)

[Setext]: https://en.wikipedia.org/wiki/Setext
[インライン]: inlines.md
[空行]: blank-lines.md
[見出し]: headings.md
[正規表現]: https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
