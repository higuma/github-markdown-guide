# コードブロック

[表]
← [目次] →
[ブロック引用]

------------------------------------------------------------------------

コードブロックはソースリスティングなどの複数行コードテキスト文書を表現するのに用いられ、コードテキストの前後を開始フェンス行・終了フェンス行で囲って記述する。

## 基本文法

開始行と終了行には`` ` ``の3つ以上連続を用いる(例: ` ``` `)。これらは**コードフェンス**と呼ばれる。基本文法は次の通り。

* 開始コードフェンス行は`` ` ``を3文字(` ``` `)またはそれ以上連続
* 次行からコードテキスト
    * 任意の文字列を記述可能
    * テキスト文書として見た通りに表示される
    * [バックスラッシュエスケープ]、[文字参照]も効かずそのまま出力する
* 終了コードフェンス行は`` ` ``を開始行と同数またはそれ以上連続

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

## 文法まとめ

[CommonMark]以降のコードブロックではコードフェンス文字として`` ` ``と`~`の2種類を用いることができる。詳しい文法は次の通り。実際の用法は次の[文例](#文例)で説明する。

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

[info文字列](→ [仕様書](https://higuma.github.io/github-markdown-guide/gfm/#info-string))はコードブロック内部に用いられているコードの言語設定に用いられ、言語名を(慣例として小文字化して)記述する。

``````markdown
```python
from datetime import date
if date.today().weekday() == 5: print('今日は土曜日')
```

~~~ruby
require 'date'
puts '今日は日曜日' if Date.today.sunday?
~~~ 
``````

> 昔は手前にスペースを1つ入れる書き方が多かったが(例: ` ``` php `)、現在はスペースなしが主流(` ```php `)。どちらでも認識する。

現行の主要言語の大多数に対応しており、構文解析を行い[シンタックスハイライト]表示する。上記文例の出力は次の通り。

> ```python
> from datetime import date
> if date.today().weekday() == 5: print('今日は土曜日')
> ```
> 
> ~~~ruby
> require 'date'
> puts '今日は日曜日' if Date.today.sunday?
> ~~~ 

#### 対応言語と記法

GitHubでは[Linguist]を用いて言語と文法の解析を行っており、サポートする言語一覧は[languages.yml](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml)に[YAML]のフォーマットで記述されている。例として[Go]言語の記述を示す(部分)。

```yaml
Go:
  type: programming
  color: "#00ADD8"
  aliases:
  - golang
  ...以下略...
```

[info文字列]には次のどちらかを指定する。GitHubでは大文字/小文字は区別しない(`GO`,`GoLang`などでも認識する)。

* 言語名(先頭のエントリ): `Go`
* `aliases`エントリの値(複数ある場合はどれでも可): `golang`

以上がGitHubの場合だが、サイトにより対応言語や記法は異なる。日本の主要サイトの場合をいくつか示す(ドキュメントと言語一覧のみ)。

* [はてなブログ] - [ドキュメント](https://help.hatenablog.com/entry/markup/syntaxhighlight) (→ [一覧](https://help.hatenablog.com/entry/markup/syntaxhighlight#filetype))
* [Qiita] - [ドキュメント](https://help.hatenablog.com/entry/markup/syntaxhighlight#filetype) (→ [一覧](https://github.com/rouge-ruby/rouge/wiki/List-of-supported-languages-and-lexers))、言語認識に[Rouge]を使用
* [Zenn] - [ドキュメント](https://zenn.dev/zenn/articles/markdown-guide#コードブロック) (→ [一覧](https://prismjs.com/#supported-languages))、言語認識に[Prism]を使用

これらのドキュメントでは言語名を全て小文字で記述していることに注意(各サイトで大文字が使えるかどうかは未調査)。慣例としてすべて小文字にしておいた方が可搬性が高い。

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

> `~~~`は[CommonMark]で採用された仕様で、これを用いて内部に`` ``` ``から始まる行がある場合に対応できる。ただし文字数がより多いコードフェンスの方が汎用性で勝るため覚える必要なし。[GitHub Docs](https://docs.github.com/ja/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks)でも`~~~`は説明に含まれていない。

## インデントによるコードブロック

Markdown初期からの文法では前後に[空行]などのブロック区切りがあり、行頭から4文字以上のスペースによるインデントがある行の連続をコードブロックとして扱い、先頭からスペース4文字を除去した内容をそのままテキストとして表示する。

```markdown
前のブロック

    コードブロック(1行目)
      2行目
        3行目

次のブロック
```

> 前のブロック
> 
>     コードブロック(1行目)
>       2行目
>         3行目
> 
> 次のブロック

ただしこの仕様は文法上の問題点が多く、他の[ブロック]構文を記述する場合の誤認識の原因になりやすい。例えば次の文例は前の行が[リスト項目]の場合で、直後にスペース4文字のインデントを用いると単に連結して1行のリスト項目として扱われる。

```markdown
- リスト項目
    リスト項目の続き
```

> - リスト項目
>     リスト項目の続き

さらに[空行]を挿入してもコードブロックと認識されず、今度は[リスト項目]の内側にネストされた内部ドキュメントとして扱われる。

```markdown
- リスト項目

    リスト項目の続き
```

> - リスト項目
> 
>     リスト項目の続き

つまりリスト項目の直後に次のブロックとしてインデントによるコードブロックを配置することはできないが、代わりにコードフェンス(` ``` `)を用いたコードブロックを用いればよい。

``````markdown
- リスト項目

```
コードブロック
```
``````

> - リスト項目
> 
> ```
> コードブロック
> ```

初期のMarkdown実装にはインデントによるコードブロックしかなかったが、上記のような問題があるため後でコードフェンスを用いた仕様が加えられた。今ではコードブロックと言えば通常はコードフェンスを用いる文法を指す。

ただしインデントによるコードブロックが必要になるケースもある。Markdownの[リスト項目]は再帰可能な[ブロック]で、仕様上はその内部に任意のMarkdown構文を配置できる。しかし内部に[コードブロック]を配置する場合には制限がある。

> ここからTODO。リスト項目の内部にコードブロックを挿入する場合、インデント方式しか使えない状況が発生する。ただしリストの解説をまだ手掛けていないため、リストの解説をある程度書き進めた後でここに戻って仕上げる

------------------------------------------------------------------------

[表]
← [目次] →
[ブロック引用]

[CommonMark]: history.md#commonmark
[Go]: https://go.dev/
[info文字列]: #info文字列
[Linguist]: https://github.com/github/linguist
[Prism]: https://prismjs.com/
[Qiita]: https://qiita.com/
[Rouge]: https://github.com/rouge-ruby/rouge
[YAML]: https://yaml.org/
[Zenn]: https://zenn.dev/
[はてなブログ]: https://hatenablog.com/
[シンタックスハイライト]: https://ja.wikipedia.org/wiki/シンタックスハイライト
[バックスラッシュエスケープ]: characters.md#バックスラッシュエスケープ
[ブロック引用]: block-quotes.md
[リスト項目]: lists.md#リスト項目
[空行]: characters.md#空行
[表]: tables.md
[目次]: index.md
[文字参照]: characters.md#文字参照
