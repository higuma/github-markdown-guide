# [6.11 GFMに使えないHTML要素](https://higuma.github.io/github-markdown-guide/#disallowed-raw-html-extension-)

[6.10 生HTML](raw-html.md)
← [目次](index.md) →
[6.12 ハード改行](hard-line-breaks.md)

------------------------------------------------------------------------

> 本節は[GFM仕様書]の中では便宜上[インライン]の章内に含まれているが、実際には[HTMLブロック]\([葉ブロック])、[生HTML]\([インライン])の両方に適用される内容。

## まとめ

[GFM]仕様のMarkdownでは次のHTML要素を[HTMLブロック]や[生HTML]として使うことができない。

* [`<title>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/title)
* [`<style>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/style)
* [`<script>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/script)
* [`<textarea>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/textarea)
* [`<iframe>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/iframe)
* [`<xmp>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/xmp)
* [`<noembed>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/noembed)
* [`<noframes>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/noframes)
* [`<plaintext>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/plaintext)

> `<xmp>`以下はすでに現在のHTMLでは非推奨扱いになっている。詳しくはアイテムのリンク先MDNドキュメントを参照)。

## 文例

実例として`<textarea>`を取り上げ、次の文例を考える。

```markdown
<textarea>
Input here...
</textarea>
```

Babelmarkでの確認結果は次の通り。

https://babelmark.github.io/?text=%3Ctextarea%3E%0AInput+here...%0A%3C%2Ftextarea%3E

大部分のMarkdown処理実装([Pandoc]を含む)はそのまま出力するが、[GFM]はHTMLタグとして認識させないように最低限の文字参照変換を行い次のように出力する。

```markdown
&lt;textarea> Input here... &lt;/textarea>
```

> &lt;textarea> Input here... &lt;/textarea>

------------------------------------------------------------------------

[6.10 生HTML](raw-html.md)
← [目次](index.md) →
[6.12 ハード改行](hard-line-breaks.md)

[CommonMark]: introduction.md#commonmark
[GFM]: introduction.md#11-github-flavored-markdownとは
[GFM仕様書]: https://higuma.github.io/github-markdown-guide/
[HTMLブロック]: html-blocks.md
[Pandoc]: https://pandoc.org/
[インライン]: inlines.md
[葉ブロック]: leaf-blocks.md
[生HTML]: raw-html.md
