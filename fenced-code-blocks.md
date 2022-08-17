# [4.5 Fenced code blocks](https://higuma.github.io/github-flabored-markdown/#fenced-code-blocks)

[4.4 Indented code blocks](indented-code-blocks.md)
← [Table of contents](index.md) →
[4.6 HTML blocks](html-blocks.md)

------------------------------------------------------------------------

[フェンスドコードブロック]はソースリスティングなどのコードブロックを開始フェンス行・終了フェンス行で囲って表現する。

## Best practice

* 開始・終了フェンスとも基本は`` ``` ``
    * 開始フェンスは3文字以上連続
    * 終了フェンスは開始フェンスと文字数が同じまたはそれ以上

``````markdown
```
$ sudo apt update
$ sudo apt upgrade -y
$ sudo apt autoremove
```
``````

> ```
> $ sudo apt update
> $ sudo apt upgrade -y
> $ sudo apt autoremove
> ```

* 開始フェンスに[シンタックスハイライト]用の[info string]を設定可能
    * `` ```java ``のように言語名を小文字で記述(今は間にスペースを入れない方が主流)

``````markdown
```javascript
for (let word of ["eeny", "meeny", "miny", "moe"]) {
    console.log(word);
}
```
``````

> ```javascript
> for (let word of ["eeny", "meeny", "miny", "moe"]) {
>     console.log(word);
> }
> ```

* 内部に`` ``` ``で始まる行がある場合は外側に文字数がより多いコードフェンスを用いる

`````````markdown
``````
```markdown
* Item 1
* Item 2
```
``````
`````````

> ``````
> ```markdown
> * Item 1
> * Item 2
> ```
> ``````

* 逆に`` ``` ``から始まる通常テキストは先頭を`\`でエスケープ


\```で始まるテキスト

> \```で始まるテキスト

## Details

<details>
<summary><strong>Summary</strong></summary>

コードブロックの直前と直後の行に`` ``` ``または`~~~`を配置して表現する。`` ``` ``や`~~~`を[コードフェンス]と呼ぶ。

``````markdown
```
$ find . -name ".gitignore" | less
```

~~~
$ grep -i 'fenced code block' * > output
~~~
``````

> ```
> $ find . -name ".gitignore" | less
> ```
> 
> ~~~
> $ grep -i 'fenced code block' * > output
> ~~~

文法まとめ。

* コードフェンスは`` ` ``または`~`の同じ文字を3つ以上連続(混在不可)
* コードフェンスは開始・終了とも手前に3つまでスペースを挿入可能、また末尾のスペースは無視
* 開始フェンスに[シンタックスハイライト]用の[info string]を設定可能
    * 言語名を小文字で記述(`java`, `python`, `ruby`, etc.)
    * 前後にスペースがあってもよい(処理時に除去)
* 開始コードフェンス行と終了コードフェンス行の間にコードブロックを記述
* コードブロックはテキスト文書として見た通りに出力される
    * ``<pre><code>...コードブロック...</code></pre>``と出力
    * 内部の`<`,`>`,`"`,`'`などの文字は文字参照に変換して適切に処理される
* 終了コードフェンスは開始コードフェンスと同じ文字種で、文字数が同じまたはそれ以上

</details>

<details>
<summary><strong>Examples</strong></summary>

[info string]はコードブロックの書式設定用で、言語名を小文字で設定する。間と行末にスペースがあってもよい。

``````markdown
```javascript
console.log(navigator.userAgent);
```

~~~   ruby
puts ENV['OS']
~~~ 
``````

> ```javascript
> console.log(navigator.userAgent);
> ```
> 
> ~~~   ruby
> puts ENV['OS']
> ~~~ 

内部`` ``` ``や`~~~`で始まる行がある場合は別の種類のコードフェンスを用いる。

``````markdown
~~~markdown
```
Fenced code block
```
~~~
``````

> ~~~markdown
> ```
> Fenced code block
> ```
> ~~~

あるいは文字数がより多いコードフェンスを外側に用いる。

`````````markdown
``````markdown
```
Fenced by ```
```

~~~
Fenced by ~~~
~~~
``````
`````````

> ``````markdown
> ```
> Fenced by ```
> ```
> 
> ~~~
> Fenced by ~~~
> ~~~
> ``````

(補足) `~~~`は[CommonMark]で採用された仕様で、これを用いて内部に`` ``` ``から始まる行がある場合に対応できる。ただし同種で文字数がより多いコードフェンス(例: `` `````` ``)で代用でき、この方が汎用性が高いため`~~~`はBest practiceから除外した。

</details>

------------------------------------------------------------------------

[4.4 Indented code blocks](indented-code-blocks.md)
← [Table of contents](index.md) →
[4.6 HTML blocks](html-blocks.md)

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