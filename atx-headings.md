# [4.2 ATX headings](https://higuma.github.io/github-flabored-markdown/#atx-headings)

[4.1 Thematic breaks](thematic-breaks.md)
← [Table of contents](index.md) →
[4.3 Setext headings](setext-headings.md)

------------------------------------------------------------------------

見出し(`<h1>`, `<h2>`, `<h3>`, `<h4>`, `<h5>`, `<h6>`)を表現する。

## Best practice

* 先頭にヘッダレベル(1..6)と同じ個数の`#`
* その後にスペース1つ置いてからコンテンツ(タイトル)
* 前後に[空行]を入れる(誤認識対策のため推奨)

```markdown
# 文書タイトル

## 大項目

### 中項目

#### 小項目

##### 補足事項

###### (あまり用いられない)
```

> # 文書タイトル
> 
> ## 大項目
> 
> ### 中項目
> 
> #### 小項目
> 
> ##### 補足事項
> 
> ###### (あまり用いられない)

コンテンツ(タイトル本文)には任意の[インライン]構文を記述できる。ただし強調(`<strong>`)は元々設定されているため効果がない場合が多い(CSS設定により異なる)。

```markdown
### 斜体 | 強調 | 取り消し線 → _Italic_ | **(たぶん)効果なし** | ~~取消~~

### リンク | オートリンク → [CommonMark](https://commonmark.org/) | https://github.com/

### 画像 → ![Octocat](https://github.githubassets.com/images/icons/emoji/octocat.png)


### 文字参照 | コードスパン → → _&nabla;&CenterDot;D = &rho;_ | `document.getElementById('main');`
```

> ### 斜体 | 強調 | 取り消し線 → _Italic_ | **(たぶん)効果なし** | ~~取消~~
> 
> ### リンク | オートリンク → [CommonMark](https://commonmark.org/) | https://github.com/
> 
> ### 画像 → ![Bear](https://github.githubassets.com/images/icons/emoji/octocat.png?v8)
> 
> ### 文字参照 | コードスパン → → _&nabla;&CenterDot;D = &rho;_ | `document.getElementById('main');`

特殊ケースの記述方法は次の通り。

* コンテンツの末尾が`/ #+$/`の場合は`\`でエスケープ
* 逆に`#`で始まる通常テキストは先頭を`\`でエスケープ

```markdown
### h3 with ending \###

\### plain text
```

> ### h3 with ending \###
> 
> \### plain text

## Summary

> [ATX]から取り入れた仕様。

* 行の先頭文字は`#`(→`<h1>`), `##`(→`<h2>`), ... , `######`(→`<h6>`)
    * 手前に3文字までインデント用スペースを挿入可能
* 直後に1個以上のスペースの後にコンテンツ(見出し文)
    * コンテンツ中に任意の[インライン]構文を用いることができる
* コンテンツの後に1個以上のスペースを隔てて任意個の`#`、任意個のスペースがあってよい(除去される)
* GFM仕様では前後の[空行]は基本的に不要
    * ただし前後に別のマークアップがあると誤認識の元になりやすい(付けるべき)
    * 無駄な[空行]は単に無視されるため無害

</details>

<details>
<summary><strong>Examples</strong></summary>

GFM仕様では前後の[空行]は不要。

```markdown
# h1
## h2
### h3
#### h4
##### h5
###### h6
```

> # h1
> ## h2
> ### h3
> #### h4
> ##### h5
> ###### h6

> ただし優先度がより高いマークアップが前後にないことが条件。

HTMLの[見出し]要素は``<h6>``までのため、7つ以上はテキストとして扱われる。

```markdown
####### foo
```

> ####### foo

`#`, `##`, `###`, ...とコンテンツの間にはスペースが必要(ないとテキストとして扱われる)。なお2つ以上スペースを挿入しても縮約されて同じ出力になる。

```markdown
### h3
###     h3
###text
```

> ### h3
> ###     h3
> ###text

> 昔はスペースなしの文法(例: `##Title`)を使える実装もあったと推測される(→ [Stack Overflow文例](https://stackoverflow.com/questions/27981247/github-markdown-same-page-link))。今はスペースが必須なので注意。

ATX headingの形式に一致する行を通常テキスト([パラグラフ])として扱う場合は`\`でエスケープする。

```markdown
\## escaped text

#\# another escaped text
```

> \## escaped text
> 
> #\# another escaped text

コンテンツには任意の[インライン]を挿入できる。

```markdown
# foo *bar* \*baz\*
## Example Domain - <https://www.example.com/>
```

> # foo *bar* \*baz\*
> ## Example Domain - <https://www.example.com/>

先頭に3つまでスペースを挿入できる。4つ以上は[インデント方式コードブロック]と認識される。

```markdown
#### h4
 ### h3
  ## h2
   # h1
    # Indented code block
```

> #### h4
>  ### h3
>   ## h2
>    # h1
>     # Indented code block

行末に1個以上の空白文字、1個以上の`#`、任意個の空白文字の順([正規表現]では``/\s+#+\s*$/``)があってよい(処理時に除去)。またスペースを挟まずに`#`で終了している場合はテキストとしてそのまま出力する。

```markdown
### h3 ###
### h3   ###   
### h3 ### ###
### h3###
```

> ### h3 ###
> ### h3   ###   
> ### h3 ### ###
> ### h3###

逆に末尾の`#`を文字として表示する場合は`\`でエスケープする。

```markdown
# h1 \#
## h2 #\##
### h3 \###
```

> # h1 \#
> ## h2 #\##
> ### h3 \###

その他のポイントは次の通り(例文略)。

* 前後に[空行]は不要、ただし他の処理系も考慮すると付けた方が安全(見やすさの効果もある)
* コンテンツは空でもよい

> CommonMark/GFM仕様では前後の[空行]は不要だが、他のMarkdown方言で必要なものもある。また先頭にインデント(空白3文字まで)がある場合、その手前の構文が[リストアイテム]だとそのインデントと認識される。リストの内部に見出しを使うことは通常ないので紛らわしいことはしない方が確実。

</details>

------------------------------------------------------------------------

[4.1 Thematic breaks](thematic-breaks.md)
← [Table of contents](index.md) →
[4.3 Setext headings](setext-headings.md)

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
