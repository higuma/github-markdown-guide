## [6.14 テキストコンテント](https://higuma.github.io/github-markdown-guide/gfm/#textual-content)

[6.13 ソフト改行](soft-line-breaks.md)
← [目次](index.md) →
[GitHub Markdown実装](github-markdown.md)

------------------------------------------------------------------------

## まとめ

インライン構文中で、今まで説明したアイテム([6.1](backslash-escapes.md) .. [6.13](soft-line-breaks.md))に該当しない文字(列)はそのまま文字として出力する。

## 文例

Markdownの構文書式に該当しない文字はそのまま出力する。

```markdown
abcde αβγδε あいうえお
```

> abcde αβγδε あいうえお

ただし連続するスペースは1個に縮約される。次の文例はGFM仕様書の[Example 673](https://higuma.github.io/github-markdown-guide/gfm/#example-673)からのもの。

```markdown
Multiple     spaces
```

> Multiple     spaces

> GFM仕様書本文には(縮約せず)「文字通りに保持される」(preserved verbatim)と書かれているが、実際にはほぼ全てのMarkdown処理実装がMarkdown側で縮約処理を行う。Babelmarkで確認した結果は次の通り。
> 
> https://babelmark.github.io/?text=Multiple+++++spaces
> 
> > ちなみに仮に仕様書記述通りMarkdown側で縮約を行わなくてもHTMLのレンダリング処理で縮約されるため同じ表示になる。

------------------------------------------------------------------------

[6.13 ソフト改行](soft-line-breaks.md)
← [目次](index.md) →
[GitHub Markdown実装](github-markdown.md)
