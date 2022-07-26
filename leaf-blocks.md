# [4 Leaf blocks](https://higuma.github.io/github-flabored-markdown/#leaf-blocks)

[3 Blocks and inlines](blocks-and-inlines.md)
← [Table of contents](index.md) →
[5 Container blocks](container-blocks.md)

------------------------------------------------------------------------

## [4.1 Thematic breaks](https://higuma.github.io/github-flabored-markdown/#thematic-breaks)

次の行は区切り(`<hr>`)に変換される。

* `-`が3文字以上、または``_``が3文字以上、または``*``が3文字以上
* 先頭に3文字までインデント用スペース可(4文字以上は[Indented code block]と認識される)
* 全て同じ文字で、行中にスペース以外の別の文字があってはならない
* 中間に任意個のスペースがあってもよい
* 行末に任意個のスペースがあってもよい

> ```markdown
> ---
> 
> ____
> 
> * * * * *
> 
>    ---
> ```

全て次の通り`<hr>`に変換される。

> ---
> 
> ____
> 
> * * * * *
> 
>    ---

GFM仕様では前後に[空行]は不要。次は[パラグラフ]を上下に区切る。

> ```markdown
> Foo
> ***
> bar
> ```

> Foo
> ***
> bar

ただし区切り文字に`-`を使う場合は注意。

> ```markdown
> Foo
> ---
> bar
> ```

これは失敗例で、次のように`Foo`が[Setext heading]と認識され``<h2>``に変換される。

> Foo
> ---
> bar

そのため前後に[空行]を挿入する方が間違いない。またGFM以外のMarkdown処理系では[空行]が必要なものもある。不要な[空行]は単に無視される(無害でより安全)。

### Thematic breaks: Best practice

表現方法に幅がありすぎて、人によってまるで違う書き方になることが多い。何でもいいから自分流の書き方を決めてそれで通すとよい。以下はその一例で、余計なものを一切入れず、さらに誤認識に対する対策として前後に[空行]を入れる。

* `--------------------`のように明確に判別できる十分な長さのハイフンを用いる(スペースなし)
* 前後に[空行]を入れる

> ```markdown
> Foo
> 
> --------------------
> 
> bar
> ```

> Foo
> 
> --------------------
> 
> bar

## [4.2 ATX headings](https://higuma.github.io/github-flabored-markdown/#atx-headings)

> [ATX]から取り入れた仕様。

[見出し]は2通りの書式がある。本節の[ATX]方式は次の文法で表現する。

* 行の先頭文字は`#`(→``<h1>``), `##`(→``<h2>``), ... , `######`(→``<h6>``)
    * 手前に3文字までインデント用スペースを挿入可能
* 直後に1個以上のスペースの後にコンテンツ(見出し文)
    * コンテンツ中に任意の[インライン]を挿入できる
* コンテンツの後に1個以上のスペースを隔てて任意個の`#`、任意個のスペースがあってよい(除去される)

> ```markdown
> # h1
> ## h2
> ### h3
> #### h4
> ##### h5
> ###### h6
> ```

>   # h1
> ## h2
> ### h3
> #### h4
> ##### h5
> ###### h6

HTMLの[見出し]要素は``<h6>``までしかないので、7つ以上はテキストとして扱われる。

> ```markdown
> ####### foo
> ```

> ####### foo

`#`, `##`, `###`, ...とコンテンツの間にはスペースが必要(ないとテキストとして扱われる)。なお2つ以上スペースを挿入しても縮約されて同じ出力になる。

> ```markdown
> ##text
> ## h2
> ##     h2
> ```

> ##text
> ## h2
> ##     h2

> 旧仕様でスペースなしの`##Heading`を許可していた処理系があった(例えば[Stack Overflow文例](https://stackoverflow.com/questions/27981247/github-markdown-same-page-link)を参照)。今はスペースが必須なので注意。

ATX headingの形式に一致する行を通常テキスト([パラグラフ])として扱う場合は`\`でエスケープする。

> ```markdown
> \## escaped text
> 
> #\# another escaped text
> ```

> \## escaped text
> 
> #\# another escaped text

コンテンツには任意の[インライン]を挿入できる。

> ```markdown
> # foo *bar* \*baz\*
> ## Example Domain - <https://www.example.com/>
> ```

> # foo *bar* \*baz\*
> ## Example Domain - <https://www.example.com/>

先頭に3つまでスペースを挿入できる。4つ以上は[Indented code block]と認識される。

> ```markdown
> #### h4
>  ### h3
>   ## h2
>    # h1
>     # Indented code block
> ```

> #### h4
>  ### h3
>   ## h2
>    # h1
>     # Indented code block

行末に1個以上のスペース、任意個の`#`、任意個のスペース([正規表現]では``/ +#* *$/``)があってよい。これらは単に無視される。またスペースを挟まずに`#`で終了している場合はテキストとしてそのまま出力する。

> ```markdown
> ### h3 ###
> ### h3   ###   
> ### h3   ######
> ### h3###
> ```

> ### h3 ###
> ### h3   ###   
> ### h3   ######
> ### h3###

逆にスペースに続く末尾の`#`を文字として表示する場合は`\`でエスケープする。

> ```markdown
> # h1 \#
> ## h2 #\##
> ### h3 \###
> ```

> # h1 \#
> ## h2 #\##
> ### h3 \###

その他のポイントは次の通り(例文略)。

* 前後に[空行]は不要、ただし他の処理系も考慮すると付けた方が安全(見やすさの効果もある)
* コンテンツは空でもよい

### ATX headings: Best practice

Markdownビューアを併用して記述作業を行う場合は次のようなミニマル仕様がお勧め。余計なものは一切付けないが、誤認識対策として前後の[空行]は入れる。

* 先頭にヘッダレベルと同じ個数の`#`
* その後にスペース1つ置いてからコンテンツ(任意の[インライン]を記述可能)
* コンテンツの末尾が`/ #+$/`の場合は`\`でエスケープ
* 行頭インデントなし、また行末に余分なスペースや`#`は入れない
* 前後に[空行]を入れる(誤認識対策)

> ```markdown
> # h1
> 
> ## h2
> 
> ### h3
> 
> #### h4
> 
> ##### h5
> 
> ###### h6
> 
> ### h3 with ending \###
> ```

> # h1
> 
> ## h2
> 
> ### h3
> 
> #### h4
> 
> ##### h5
> 
> ###### h6
> 
> ### h3 with ending \###

## [4.3 Setext headings](https://higuma.github.io/github-flabored-markdown/#setext-headings)

> [Setext]から取り入れた仕様。ただし``<h3>``以上のレベルは表現できない。

コンテンツテキストの次行に1つ以上の`=`(→ ``<h1>``)または1つ以上の`-`(→ ``<h2>``)を用いて[見出し]を表現できる。


> ```markdown
> h1
> ==
> 
> h2
> --
> ```

> h1
> ==
> 
> h2
> --

ポイントをまとめる(概略説明のみ)。

* コンテンツ内には任意の[インライン]を挿入可能
* コンテンツは複数行にまたがっていてもよい(改行はスペースに置換される)
* コンテンツは空であってはならない([ATX headings]と異なる)
* [見出し]表示行は1つ以上の`=`(→``<h1>``)または1つ以上の`-`(→``<h2>``)
    * 行頭に3つまでスペースを挿入可能
    * 行末に任意個のスペースがあってもよい
    * [正規表現]を用いると ``/^ {0,3}(?:=+|-+) *$/``
* 前後に[空行]は不要(だが経験上入れないと時々誤認識する)

### Setext headings: Best practice

この仕様は``<h3>``以上のレベルに対応できない。代わりに[ATX headings]を用いるとよい。

## [4.4 Indented code blocks](https://higuma.github.io/github-flabored-markdown/#indented-code-blocks)

行頭に4つ以上の連続したスペースがある行はコードブロックとして扱われ、行頭のスペース4つを除去した後、テキスト文書として見た通りに出力する。これは特に次のようなコードリスティングに用いられる。

> ```markdown
>     #include <stdio.h>
>     void main() {
>         printf("Hello world!\n");
>     }
> ```

>     #include <stdio.h>
>     void main() {
>         printf("Hello world!\n");
>     }

ただし前の行が[リストアイテム](container-blocks.md#52-list-items)の場合はリストアイテムの続きと認識される。[空行]を挿入してもリストのインデントとして扱われる。

> ```markdown
> * List
>     item
> 
> * List
> 
>     indent
> ```

> * List
>     item
> 
> * List
> 
>     indent

以下説明は省略する。これ以外にも文法解釈上の問題がとても多く、後に次の[Fenced code block]が作られた。

### Indented code blocks: Best practice

文法上問題が多い。代わりに[Fenced code block]を用いるとよい。

## [4.5 Fenced code blocks](https://higuma.github.io/github-flabored-markdown/#fenced-code-blocks)

コードブロックの直前と直後の行に`` ``` ``または`~~~`を配置して表現する。`` ``` ``や`~~~`を[code fence]と呼ぶ。

> ``````markdown
> ```
> $ find . -name ".gitignore" | less
> ```
> 
> ~~~
> $ grep -i 'fenced code block' * > output
> ~~~
> ``````

> ```
> $ find . -name ".gitignore" | less
> ```
> 
> ~~~
> $ grep -i 'fenced code block' * > output
> ~~~

文法をまとめると次の通り。

* コードフェンスは`` ` ``または`~`の同じ文字を3つ以上連続(混在不可)
* コードフェンスは開始・終了とも手前に3つまでスペースを挿入可能、また末尾のスペースは無視
* 開始コードフェンスの後に[info string]を設定可能([シンタックスハイライト](https://ja.wikipedia.org/シンタックスハイライト)用)
    * 言語名を小文字で記述(`javascript`, `php`, `ruby`, etc.)
    * 前後にスペースがあってもよい(処理時に除去)
* 開始コードフェンス行と終了コードフェンス行の間にコードブロックを記述
* コードブロックはテキスト文書として見た通りに出力される
    * ``<pre><code>...コードブロック...</code></pre>``と出力
    * 内部の`<`,`>`,`"`,`'`などの文字は文字参照に変換して適切に処理される
* 終了コードフェンスは開始コードフェンスと同じ文字種で、文字数が同じまたはそれ以上

[info string]はコードブロックの書式設定用で、言語名を小文字で設定する。間と行末にスペースがあってもよい。

> ``````markdown
> ```javascript
> console.log(navigator.userAgent);
> ```
> 
> ~~~   ruby
> puts ENV['OS']
> ~~~ 
> ``````

> ```javascript
> console.log(navigator.userAgent);
> ```
> 
> ~~~   ruby
> puts ENV['OS']
> ~~~ 

コードブロック内に`` ``` ``や`~~~`を記述する場合は別の種類のコードフェンスを用いればよい。

> ``````markdown
> ~~~markdown
> ```
> Fenced code block
> ```
> ~~~
> ``````

> ~~~markdown
> ```
> Fenced code block
> ```
> ~~~

あるいは文字数がより多いコードフェンスを外側に用いる。

> `````````markdown
> ``````markdown
> ```
> Fenced by ```
> ```
> 
> ~~~
> Fenced by ~~~
> ~~~
> ``````
> `````````

> ``````markdown
> ```
> Fenced by ```
> ```
> 
> ~~~
> Fenced by ~~~
> ~~~
> ``````

### Fenced code blocks: Best practice

* 開始・終了フェンスとも基本的には`` ``` ``を用いる
* [info string]は`` ```java ``のように言語名を小文字で記述(今は間にスペースを入れない方が主流)
* コードブロック内部に`` ``` ``がある場合などの理由で文法上問題を生じる場合
    * 別の種類のコードフェンスを使う(内部に`` ``` ``がある場合は`~~~`)
    * または外側に文字数がより多いコードフェンスを用いる

## [4.6 HTML blocks](https://higuma.github.io/github-flabored-markdown/#html-blocks)

入力をHTML文書として認識させる機能。GFMでは全部で7通りの仕様を用意しているが、どの処理系もサポートが不十分で異なる出力になることが多いため説明は省略する。

> サポート状況を実際に確認するため[GFM implementation checker](https://github.com/higuma/gfm-implementation-checker)を作成した。

> サポート状況を実際に確認するため、[GFM implementation checker - 4.6 HTML blocks](https://github.com/higuma/gfm-implementation-checker)を作成した。
checker/leaf-blocks.md#46-html-blocks)を利用すれば実際に確認できる。

GitHubでもこれら全てを仕様書通りには処理しておらず、異なる出力結果がたくさんある。

> またネット上には膨大な数のMarkdown文書があるが、使われているのをほとんど見たことがない。

### HTML blocks: Best practice

思い通りの出力結果は期待できないので使わない方がよい。

## [4.7 Link reference definitions](https://higuma.github.io/github-flabored-markdown/#link-reference-definitions)

[リンク参照定義]は文書に[リンクラベル]とその[リンク先]の対応情報を設定する。まず本ページで実際に用いられている例を示す。`[リンクラベル]: リンク先`の形式で記述する。

> ```markdown
> [Setext]: https://en.wikipedia.org/wiki/Setext
> ```

これはMarkdown文書中のどこに配置してもよい(本ページではMarkupソースファイルの末尾に記述してある)。これ自体はHTMLとして出力されないが、次のように[リンクラベル]を`[...]`で囲うと``<a href="リンク先">リンクラベル</a>``を作成する。

> ```markdown
> [Setext]
> ```

> [Setext]

> これは[リンク]作成の省略記法のひとつ([Example 565](https://higuma.github.io/github-flabored-markdown/#example-565))。[リンク]の作成方法は[6.6 Links](inlines.md#66-links)で詳しく説明する。

またhover時にポップアップするリンクタイトルを表示する場合はその後に`"リンクタイトル"`または`'リンクタイトル'`で記述する。これはリンク作成時に`title`属性として設定され、`[リンクラベル]`は``<a href="リンク先" title="リンクタイトル">リンクラベル</a>``と出力する。

> ```markdown
> [example.com]: https://www.example.com/ "Example Domain"
> 
> [example.com]
> ```

次の出力のリンク上にマウスポインタをかざすとリンクタイトルがポップアップするのを確認できる。

> [example.com]: https://www.example.com/ "Example Domain"
> 
> [example.com]

基本は以上。仕様書に基いた文法仕様は次の通り。

* 行頭に3個までインデント用スペースを挿入可能(処理時に除去)
* [リンクラベル]
    * 文字列を`[...]`で囲う
    * 最低1文字以上の非空白文字が必要、最大文字数は999
    * 文字列中に`]`を用いる場合はエスケープして`\]`とする(`[[abc\]]` → `[abc]`)
        * ただし対応できない処理系があるので注意
* `:`
* 0個以上の空白文字(なくてもよいが通常スペースを1つ入れる)
* [リンク先] - 記法が2通りある(次のいずれか)
    * `<文字列>` - [オートリンク](inlines.md#68-autolinks)記法
        * 文字列を`<...>`(angle bracket)で囲む
        * 文字列にスペースが含まれていてもよい
        * 文字列中に`<`や`>`が含まれる場合はエスケープして`\<`,`\>`とする
    * `スペースを含まない文字列` - [オートリンク拡張](inlines.md#69-autolinks-extension)記法
        * `<...>`不要
        * スペースは[パーセントエンコーディング](https://ja.wikipedia.org/wiki/パーセントエンコーディング)を用いて`%20`(他の特殊文字も同様)
        * URLスキーム(`https://`など)は原則省略可能(自動判別する)
* (optional) リンクタイトル記述部
    * 1個以上の空白文字(必要)
    * [リンクタイトル]
* 行末に0個以上の空白文字(処理時に除去)

以下はテスト。GutHubも完全に対応できてはいないように思える。

[[abc\]]: introduction.md "[abc]"

[[abc\]]

後は記法のバリエーションについて補足説明する。まず[リンクラベル]の手前には3文字までのインデントスペースが可能。[リンク先]の前には任意個のスペースが可能(なくてもよい)。タイトルを設定する場合は手前に1個以上のスペースが必要。また行末にスペースがあれば除去して処理する。

> ```markdown
> [GitHub]:   https://www.github.com/    "GitHub"   
> [Wikipedia]:https://www.wikipedia.org/ "Wikipedia"
> 
> [GitHub] [Wikipedia]
> ```

> [GitHub]:   https://www.github.com/    "GitHub"   
> [Wikipedia]:https://www.wikipedia.org/ "Wikipedia"
> 
> [GitHub] [Wikipedia]

リンク先(URL)が空白文字や特殊文字を含む場合はいくつか方法がある。以下はリンク先`'my url'`(シングルクォートとスペースを含む)に対する記述例。

* [パーセントエンコーディング](https://ja.wikipedia.org/wiki/パーセントエンコーディング)記法: `%27my%20url%27`
* [オートリンク](inlines.md#68-autolinks)(angle bracket)記法: `<'my url'>`

> 興味のある人はExamples [161](https://higuma.github.io/github-flabored-markdown/#example-161)-[188](https://higuma.github.io/github-flabored-markdown/#example-188)を解読するとよい勉強になる。

以下TODO - Linkの方を先に書き、書式は「Linkの文法と同じ」とした方がすっきりすると思う。

### Link reference definitions: Best practice

Markdownビューアを用いる場合は余計なものは付けない方が作業効率がよい。

* リンクタイトルなしの場合 - `[リンクラベル]: リンク先`
* リンクタイトルを設定する場合 - `[リンクラベル]: リンク先 "リンクタイトル"`

## [4.8 Paragraphs](https://higuma.github.io/github-flabored-markdown/#paragraphs)

[パラグラフ]は上下を[空行](leaf-blocks.md#49-blank-lines)(または文書の開始/終了)で区切った空でないテキスト行で表現する。

* 前後を[空行]または文書の開始・終了で区切る
* 単語間に複数の連続した空白文字がある場合はHTML側で縮約してスペース1個に変換
* 複数行に分けてよい(間の改行はそのままHTMLに出力し、HTML側で連結)
* [空行]にならないように...
    * 先頭行は行頭から3文字以内に非空白文字が必要(4文字以上は[Indented code block]と認識)
    * 2行目以降は最低一つの非空白文字が必要
	* どちらも行頭空白文字は処理時に除去

最も簡単な例。間は[空行]1個。

> ```markdown
> aaa
> 
> bbb
> ```

> aaa
> 
> bbb

複数行に分割した例。行間の改行はスペース1個に変換される。

> ```markdown
> aaa
> bbb
> 
> ccc
> ddd
> ```

> aaa
> bbb
> 
> ccc
> ddd

### Paragraphs: Best practice

特になし。ただし誤認識防止のため行頭インデントは使わない方が安全。

## [4.9 Blank lines](https://higuma.github.io/github-flabored-markdown/#blank-lines)

[空行]は上下のブロック要素の区切りを表現する。

* 改行のみ、または一行の中に空白文字のみを含む
* 複数の[空行]はまとめられて一つのブロック区切りと認識する
* 文書開始直後、文書終了直前の[空行]は除去

次は文書開始前、[パラグラフ]間、文書終了前に複数の空白文字が入った[空行]を含む例。見た目では分からないが、GitHubのコードブロック表示の右上Copyアイコンをクリックするとクリップボードにコピーしてテキストエディタなどで確認できる。

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

### Blank lines: Best practice

改行1個がセオリー(スペースやタブが入っているのは行儀が悪い)。ただし状況に応じて[パラグラフ]間は改行1個、[見出し]の前は改行2個というように使い分けるのもよい。

## [4.10 Tables (extension)](https://higuma.github.io/github-flabored-markdown/#tables-extension-)

------------------------------------------------------------------------

[3 Blocks and inlines](blocks-and-inlines.md)
← [Table of contents](index.md) →
[5 Container blocks](container-blocks.md)

[ATX]: https://en.wikipedia.org/wiki/Aaron_Swartz#atx
[ATX headings]: #42-atx-headings
[code fence]: https://higuma.github.io/github-flabored-markdown/#code-fence
[Fenced code block]: #45-fenced-code-blocks
[Indented code block]: #44-indented-code-blocks
[info string]: https://higuma.github.io/github-flabored-markdown/#info-string
[Setext]: https://en.wikipedia.org/wiki/Setext
[Setext heading]: #43-setext-headings
[インライン]: inlines.md
[リンク]: https://higuma.github.io/github-flabored-markdown/#links
[リンク参照定義]: https://higuma.github.io/github-flabored-markdown/#link-reference-definition
[リンクラベル]: https://higuma.github.io/github-flabored-markdown/#link-label
[リンク先]: https://higuma.github.io/github-flabored-markdown/#link-destination
[リンクタイトル]: https://higuma.github.io/github-flabored-markdown/#link-title
[パラグラフ]: #48-paragraphs
[空行]: #49-blank-lines
[正規表現]: https://deeloper.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
[見出し]: #42-atx-headings
