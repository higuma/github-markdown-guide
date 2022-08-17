# [4.8 Paragraphs](https://higuma.github.io/github-flabored-markdown/#paragraphs)

[4.7 Link reference definitions](link-reference-definitions.md)
← [Table of contents](index.md) →
[4.9 Blank lines](blank-lines.md)

------------------------------------------------------------------------

[パラグラフ]は上下を[空行](leaf-blocks.md#49-blank-lines)(または文書の開始/終了)で区切った空でないテキスト行で表現する。

* 前後を[空行]または文書の開始・終了で区切る
* 単語間に複数の連続した空白文字がある場合はHTML側で縮約(スペース1個に変換)
* 複数行に分けてよい(間の改行はそのままHTMLに出力し、HTML側で連結)
* [空行]にならないように注意
    * 先頭行は行頭から3文字以内に非空白文字が必要(4文字以上は[Indented code block]と認識)
    * 2行目以降は最低一つの非空白文字が必要
	* どちらも行頭空白文字は処理時に除去

最も簡単な例。間は[空行]1個。

```markdown
aaa

bbb
```

> aaa
> 
> bbb

複数行に分割した例。行間の改行はそのままHTMLに出力され、HTMLはスペース1個に変換して出力する。

```markdown
aaa
bbb

ccc
ddd
```

> aaa
> bbb
> 
> ccc
> ddd

### Paragraphs: Best practice

特になし。ただし誤認識防止のため行頭インデントは使わない方が安全。


------------------------------------------------------------------------

[4.7 Link reference definitions](link-reference-definitions.md)
← [Table of contents](index.md) →
[4.9 Blank lines](blank-lines.md)

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