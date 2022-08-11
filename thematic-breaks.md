# [4.1 Thematic breaks](https://higuma.github.io/github-flabored-markdown/#thematic-breaks)

[4 Leaf blocks](leaf-blocks.md)
← [Table of contents](index.md) →
[4.2 ATX headings](atx-headings.md)

------------------------------------------------------------------------

区切り(`<hr>`)を表現する。

## Best practice

GFM仕様は表現方法に幅がありすぎて、人によってまるで違う書き方になることが多い。そこで何でもいいから自分流の書き方を決めるとよい。以下はその一例で、余計なものを一切入れず、さらに誤認識への対策として前後に[空行]を入れる。

```markdown
パラグラフ(1)

------------------------------------------------------------------------

パラグラフ(2)
```

> パラグラフ(1)
> 
> ------------------------------------------------------------------------
> 
> パラグラフ(2)

* `---------`のように明確に判別できる十分な長さのハイフンを用いる(3文字以上、スペースなし)
* 前後に[空行]を入れる(誤認識対策)

## Details

<details>
<summary><strong>Summary</strong></summary>

次の行は区切り(`<hr>`)に変換される。

* `-`が3文字以上、または``_``が3文字以上、または``*``が3文字以上
* 全て同じ文字で、行中にスペース以外の別の文字があってはならない
* 先頭に3文字までインデント用スペース可(4文字以上は[インデント方式コードブロック]と認識される)
* 中間と行末に任意個のスペースが挿入されていてもよい

```markdown
---

____

* * * * *

   ---
```

> ---
> 
> ____
> 
> * * * * *
> 
>    ---

</details>

<details>
<summary><strong>Examples</strong></summary>

GFM仕様では前後に[空行]は不要。次は[パラグラフ]を上下に区切る。

```markdown
Foo
***
bar
```

> Foo
> ***
> bar

ただし区切り文字に`-`を使う場合は注意。

```markdown
Foo
---
bar
```

これは`Foo`が[Setext heading]と認識され``<h2>``に変換される。

> Foo
> ---
> bar

このような誤認識への対策のため前後に[空行]を挿入する方が間違いない。また(経験上)GFM以外のMarkdown実装で[空行]が必要なものもある。不要な[空行]は単に無視される(無害でより安全)。

</details>

------------------------------------------------------------------------

[4 Leaf blocks](leaf-blocks.md)
← [Table of contents](index.md) →
[4.2 ATX headings](atx-headings.md)

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
