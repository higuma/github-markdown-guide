# 見出し

[パラグラフ]
← [目次] →
[横線]

------------------------------------------------------------------------

## 基本的な書き方

Markdownでは見出し([`<h1>`,`<h2>`,`<h3>`,`<h4>`,`<h5>`,`<h6>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/Heading_Elements))を次の書式で記述できる。

* 先頭に見出しレベル(1..6)と同じ個数の`#`(7つ以上はテキストと認識)
* その後にスペース1つ置いてからコンテンツ(タイトル文)
* 前後に[空行]を入れる(誤認識対策のため推奨)

```markdown
# h1(文書タイトルなど)

## h2(大項目など)

### h3(中項目など)

#### h4(小項目など、以下略)

##### h5

###### h6

####### 通常テキスト
```

> # h1(文書タイトルなど)
> 
> ## h2(大項目など)
> 
> ### h3(中項目など)
> 
> #### h4(小項目など、以下略)
> 
> ##### h5
> 
> ###### h6
> 
> ####### 通常テキスト

コンテンツ(タイトル本文)には任意の[インライン]構文を記述できる。

```markdown
## 文字参照(&copy;), _italic_, ~~取消~~ `code span`

### <sup>上付き</sup>, <sub>下付き</sub>, ルビ(<ruby>倫敦<rt>ロンドン</rt></ruby>)

#### [リンク](https://www.example.com/), 自動リンク(https://github.com/)
```

> ## 文字参照(&copy;), _italic_, ~~取消~~ `code span`
> 
> ### <sup>上付き</sup>, <sub>下付き</sub>, ルビ(<ruby>倫敦<rt>ロンドン</rt></ruby>)
> 
> #### [リンク](https://www.example.com/), 自動リンク(https://github.com/)

## 補足: 文法規則

GFM仕様書に記載されている文法をまとめると次の通り。

* 行の先頭文字は`#`(→`<h1>`), `##`(→`<h2>`), ... , `######`(→`<h6>`)
    * 手前に3文字までインデント用スペースを挿入可能
* 直後に1個以上のスペースの後にコンテンツ(見出し本文)
    * GFM仕様では間にスペースが必要(除去して出力)
    * コンテンツ中に任意の[インライン]構文を挿入可能
* 行末に「1個以上の空白,1個以上の`#`,0個以上の空白」の順があれば除去
    * [正規表現]で表すと`/\s+#+\s*$/`
* GFM仕様では前後の[空行]は基本的に不要
    * ただし優先度がより高いブロック書式が前後にないことが条件
    * 誤認識の元になりやすいので付けるべき(不要な[空行]は単に無視するため無害)

### 文例

書式設定として太字も可能だが、見出し文は通常太字に書式設定されているため視覚では判別できない(ブラウザのデフォルトCSS設定に依存)。

```markdown
### regular **bold *bold italic*** *italic*
```

> ### regular **bold *bold italic*** *italic*

先頭には3文字まで空白を入れてよい。4文字以上は[インデント式コードブロック]として扱われる。

```markdown
#### h4

 #### h4

   #### h4

    #### indented code block
```

> #### h4
> 
>  #### h4
> 
>    #### h4
> 
>     #### indented code block

行末に`/\s+#+\s*$/`というパターンがあると除去してから処理する。この仕様は昔の名残で、テキスト入出力しかなかった時代は見出しとして次のようなASCII装飾記法がよく用いられていた。

```markdown
## Second level ##

### Third level ###
```

Markdown処理実装は末尾の`#`の部分を除去した後、先頭の見出しレベルに対応したHTML要素として出力する。

> ## Second level ##
> 
> ### Third level ###

次のような特殊ケースでは[バックスラッシュエスケープ]を用いる。

* `#`で始まる通常テキストは先頭を`\`でエスケープして見出しとして認識させないようにする
* 見出し本文の末尾が`/ #+$/`で終わる場合も`\`でエスケープして除去を防止

```markdown
\### plain text

#### h4 with ending \####
```

> \### plain text
> 
> #### h4 with ending \####

<!-- 
内容未熟のため一時保留

### 前後の空行の必要性

GFM仕様書には「空行で区切る必要なし」(→ [Example 47](https://higuma.github.io/github-markdown-guide/gfm/#example-47))と書かれているが、空行の省略は勧められない(必ず入れるべき)。例えば次のように[リストアイテム]の直後にインデント付きで書くとアイテムの内部に見出しが作成される。

```markdown
* list item
  ### h3 (inside list item)

### h3 (top level)
```

> * list item
>   ### h3 (inside list item)
> 
> ### h3 (top level)
-->

### 他のMarkdown実装との比較

GFM仕様のMarkdownでは先頭の`#`と見出し本文の間には空白1個以上が必要だが、他のMarkdown処理実装では不要なものも多い。次の例文を考える。

```markdown
##heading
```

Babelmarkによる比較結果は次の通り。スペースが必要な実装が主流だが、スペースなしを受け付ける実装も多い。

https://babelmark.github.io/?text=%23%23heading

> 実は昔のGitHub Markdown実装も「`#`と本文の間にスペース不要」の仕様だった模様。今ではもう調査困難だが、例えばStack Overflowに今でも次のようなページが残っていることから推測できる(冒頭のコード例参照)。
> 
> https://stackoverflow.com/questions/27981247/github-markdown-same-page-link

------------------------------------------------------------------------

[パラグラフ]
← [目次] →
[横線]

[パラグラフ]: paragraphs.md
[目次]: index.md
[横線]: horizontal-rules.md

[インデント式コードブロック]: indented-code-blocks.md
[インライン]: inlines.md
[バックスラッシュエスケープ]: backslash-escapes.md
[リストアイテム]: list-items.md
[正規表現]: https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
[空行]: blank-lines.md
