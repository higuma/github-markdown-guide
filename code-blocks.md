# [4.5 コードブロック](https://higuma.github.io/github-markdown-guide/gfm/#fenced-code-blocks)

[4.3 Setext見出し](setext-headings.md)
← [目次](index.md) →
[4.4 インデント式コードブロック](indented-code-blocks.md)

------------------------------------------------------------------------

コードブロックはソースリスティングなどの複数行コードテキスト文書を表現するのに用いられ、コードテキストの前後を開始フェンス行・終了フェンス行で囲って記述する。

## ベストプラクティス

書式の基本ルールとして次を覚えておけばよい。

* 開始フェンス行は`` ` ``を3文字(` ``` `)またはそれ以上連続
* 次行からコードテキスト
* 終了フェンス行は`` ` ``を開始行と同数またはそれ以上連続

``````markdown
```
$ ./configure
$ make
$ sudo make install
```
``````

> ```
> $ ./configure
> $ make
> $ sudo make install
> ```

特定言語のコードリスティングには開始フェンス行に[info文字列]を指定するとよい。開始フェンス行の` ``` `の後に言語名を(慣例として小文字化して)設定すると文法解析を行いキーワードやメソッド名などを[シンタックスハイライト]表示する。

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

コードテキストの内部に`` ``` ``で始まる行がある場合は外側に`` ` ``の文字数がより多いコードフェンスを用いることで対応できる。

`````````markdown
``````
```markdown
* list item 1
* list item 2
```
``````
`````````

> ``````
> ```markdown
> * list item 1
> * list item 2
> ```
> ``````

逆に`` ``` ``から始まる通常テキスト行は先頭を`\`でエスケープする。


```markdown
\```で始まるテキスト
```

> \```で始まるテキスト

## まとめ

CommonMark以降のコードブロックではコードフェンス文字として`` ` ``と`~`の2種類を用いることができる。文法まとめは次の通り。詳しくは次の[文例](#文例)で説明する。

* コードフェンスは`` ` ``または`~`の同種文字を3つ以上連続(混在不可)
* コードフェンスは開始・終了とも行頭に3つまでスペースを挿入可能、行末スペースは除去して処理
* 開始フェンスの後に[シンタックスハイライト]用の[info文字列]を設定可能
    * 言語名をすべて小文字で記述(例: `php`, `java`, `ruby`, etc.)
    * 前後に任意個のスペースがあってもよい(処理時に除去)
* 開始コードフェンス行と終了コードフェンス行の間にコードブロックを記述
* コードブロックはテキスト文書として見た通りに出力される
    * ``<pre><code>...コードブロック...</code></pre>``と出力
    * 内部の`<`,`>`,`"`,`'`などの文字は文字参照に変換して適切に処理される
* 終了コードフェンスは開始コードフェンスと同じ文字種で、文字数が同じまたはそれ以上

## 文例

### info文字列

[info文字列](→ [仕様書](https://higuma.github.io/github-markdown-guide/gfm/#info-string))はコードブロック内部に用いられているコードの言語設定用で、言語名を(慣例として小文字化して)記述する。

``````markdown
```javascript
console.log(navigator.userAgent);
```

~~~ruby
puts ENV['OS']
~~~ 
``````

> 昔は手前にスペースを1つ入れる書き方が多かったが(例: ` ``` php `)、現在はスペースなしが主流(` ```php `)。どちらでも認識する。

現行の主要言語の大多数に対応しており、構文解析を行い[シンタックスハイライト]表示する。上記文例の出力は次の通り。

> ```javascript
> console.log(navigator.userAgent);
> ```
> 
> ~~~ruby
> puts ENV['OS']
> ~~~ 

<details>
<summary>サポートする言語と記法</summary>

GitHubでは[Linguist]を用いて言語と文法の解析を行っており、サポートする言語一覧は[languages.yml](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml)に書かれている。[YAML]のフォーマットで記述されており、は

* 
* 

サイトにより使用ツールや記法は異なる。日本の主要サイトについて少しだけ示す。

* [はてなブログ] - [ドキュメント](https://help.hatenablog.com/entry/markup/syntaxhighlight) (→ [一覧](https://help.hatenablog.com/entry/markup/syntaxhighlight#filetype))
* [Qiita] - [ドキュメント](https://help.hatenablog.com/entry/markup/syntaxhighlight#filetype) (→ [一覧](https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers))
* [Zenn] - [ドキュメント](https://zenn.dev/zenn/articles/markdown-guide#コードブロック) (→ [一覧](https://prismjs.com/#supported-languages))

文法認識ツールには[Qiita]は[Rouge], [Zenn]は[Prism]を使用([はてなブログ]は不明)。

> 上記3サイトでは言語名には全て小文字を用いる([Zenn]で統一している。


TODO


この機能は書くWebサイトがHTML表示に用いる実装により記法は異なる。GitHubの場合は次の通り。

> GitHubがサポートする言語一覧は[languages.yml](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml)を参照。言語

</details>

### 内部に` ``` `や`~~~`を含む場合

内部に` ``` `や`~~~`で始まる行がある場合はもう一方のコードフェンスを用いて対応できる。

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

または文字数がより多いコードフェンスを外側に用いてもよい。この方が汎用性が高く、次のように内部に` ``` `と`~~~`の両方がある場合も対応できる。

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

> `~~~`は[CommonMark]で採用された仕様で、これを用いて内部に`` ``` ``から始まる行がある場合に対応できる。ただし文字数がより多いコードフェンスの方が汎用性で勝るため`~~~`は[ベストプラクティス](#ベストプラクティス)から除外した(不要)。[GitHub Docs](https://docs.github.com/ja/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks)でも`~~~`は説明に含まれていない。

------------------------------------------------------------------------

[4.3 Setext見出し](setext-headings.md)
← [目次](index.md) →
[4.4 インデント式コードブロック](indented-code-blocks.md)

[CommonMark]: introduction.md#commonmark
[info文字列]: #info文字列
[Linguist]: https://github.com/github/linguist
[Prism]: https://prismjs.com/
[Qiita]: https://qiita.com/
[Rouge]: https://github.com/rouge-ruby/rouge
[YAML]: https://yaml.org/
[Zenn]: https://zenn.dev/
[シンタックスハイライト]: https://ja.wikipedia.org/シンタックスハイライト
[はてなブログ]: https://hatenablog.com/
