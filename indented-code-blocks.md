# [4.4 インデント式コードブロック](https://higuma.github.io/github-flabored-markdown/#indented-code-blocks)

[4.3 Setext見出し](setext-headings.md)
← [目次](index.md) →
[4.5 コードブロック](fenced-code-blocks.md)

------------------------------------------------------------------------

先頭にスペース4文字のインデントを用いてソースリスティングなどのコードブロックを表現する。

### Best practice

文法上の問題が多く、何かと誤認識の元になりやすい。代わりに[フェンスドコードブロック]を用いるとよい。

### Details

<details>
<summary><strong>Summary</strong></summary>

> Best practiceで「非推奨」としたため説明は最小限に留める。

行頭に4つ以上の連続したスペースがある行はコードブロックとして扱われ、行頭のスペース4つを除去した後、テキスト文書として見た通りに出力する。これは特に次のようなコードリスティングに用いられる。

```markdown
    #include <stdio.h>
    void main() {
        printf("Hello world!\n");
    }
```

>     #include <stdio.h>
>     void main() {
>         printf("Hello world!\n");
>     }

ただし前の行が[リストアイテム](container-blocks.md#52-list-items)の場合はリストアイテムの続きと認識される。[空行]を挿入してもリストのインデントとして扱われる。

```markdown
* List
    item

* List

    indent
```

> * List
>     item
> 
> * List
> 
>     indent

以下説明は省略する。これ以外にも文法解釈上の問題がとても多く、後に次の[フェンスドコードブロック]が作られた。

</details>

------------------------------------------------------------------------

[4.3 Setext見出し](setext-headings.md)
← [目次](index.md) →
[4.5 コードブロック](fenced-code-blocks.md)

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
