# [6.11 使用できないHTML要素](https://higuma.github.io/github-markdown-guide/gfm/#disallowed-raw-html-extension-)

[6.10 生HTML](raw-html.md)
← [目次](index.md) →
[6.12 ハード改行](hard-line-breaks.md)

------------------------------------------------------------------------

> **旧版(完成後削除)**

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

> `<title>`は本来`<head>`内部で用いる要素なのでMarkdownに用いる意味はまずない。また`<style>`,`<script>`を許可するとHTML文書の他の部分に影響するためGFMでは禁止している。そして`<xmp>`以下の4つは大昔のHTML要素で現在は非推奨扱いになっている(リンク先のMDNドキュメント参照)。
> 
> 上記で許可してもよさそうな唯一の要素は`<textarea>`で、実際に他のMarkdown処理系では使えるものが多数ある(下記[文例](#文例)のBabelmark出力を参照)。GFMでは禁止しているが理由は不明。

## 文例

実例として`<textarea>`を取り上げ、次の文例を考える。

```markdown
<textarea>
Input here...
</textarea>
```

Babelmarkでの確認結果は次の通り。

https://babelmark.github.io/?text=%3Ctextarea%3E%0AInput+here...%0A%3C%2Ftextarea%3E

多くのMarkdown処理実装([Pandoc]を含む)はそのまま出力するが、[GFM]はHTMLタグとして認識させないように最低限の文字参照変換(`<`→`&lt;`)を行い次のように出力する(他の禁止HTMLタグも同様)。

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
[GFM仕様書]: https://higuma.github.io/github-markdown-guide/gfm/
[HTMLブロック]: html-blocks.md
[Pandoc]: https://pandoc.org/
[インライン]: inlines.md
[葉ブロック]: leaf-blocks.md
[生HTML]: raw-html.md
