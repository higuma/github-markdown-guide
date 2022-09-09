# [4.9 空行](https://higuma.github.io/github-flabored-markdown/#blank-lines)

[4.8 パラグラフ](paragraphs.md)
← [目次](index.md) →
[4.10 表組み](tables-extension.md)

------------------------------------------------------------------------

[空行]は上下のブロック構文を文法的に区切る。

### Best practice

改行のみがお勧め。スペースやタブが入っていると行儀が悪いし、Markdownのインデントを使う文法([リスト]や[インデント方式コードブロック]など)の誤認識の元になりやすい。なお通常は改行一つだが、[パラグラフ]間は改行1個、[見出し]の前は改行2個というように使い分けるのは作業用として有効な方法。

### Details

<details>
<summary><strong>Summary</strong></summary>

* 上下のブロック間を区切るのに用いられる
* 改行のみ、または一行の中に[空白文字] (スペースやタブなど)のみを含み改行で終わる
* 複数の連続する[空行]はまとめられて一つのブロック区切りと認識する
* 文書開始直後、文書終了直前の[空行]は除去

</details>

<details>
<summary><strong>Examples</strong></summary>

次は文書開始前、[パラグラフ]間、文書終了前に複数の空白文字(スペースやタブ)が入った[空行]を含む例。見た目では分からないが、GitHubのコードブロック表示の右上Copyアイコンをクリックするとクリップボードにコピーしてテキストエディタなどで確認できる。

> ```markdown
>   
> 
> aaa
>   
> 	
> 
> # aaa
> 
>   
> ```

結果は次の通り。文書の開始・終了の手前の[空行]は除去し、[パラグラフ]と[見出し]の間にある複数の[空行]はまとめられて一つのブロック区切りになる。

>   
> 
> aaa
>   
> 
> # aaa
> 
>   

</details>

------------------------------------------------------------------------

[4.8 パラグラフ](paragraphs.md)
← [目次](index.md) →
[4.10 表組み](tables-extension.md)

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
