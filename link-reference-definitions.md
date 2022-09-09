# [4.7 リンク参照定義](https://higuma.github.io/github-flabored-markdown/#link-reference-definitions)

[4.6 HTMLブロック](html-blocks.md)
← [目次](index.md) →
[4.8 パラグラフ](paragraphs.md)

------------------------------------------------------------------------

> TODO: 記法はこの後のLinksとかなりかぶるので、Linksを先に仕上げてからこちらに戻る方がいいかも。

## Link reference definitions: Best practice

> TODO: 書きかけ

Markdownビューアを用いる場合は余計なものは付けない方が作業効率がよい。

* リンクタイトルなしの場合 - `[リンクラベル]: リンク先`
* リンクタイトルを設定する場合 - `[リンクラベル]: リンク先 "リンクタイトル"`

## Best practice

[リンク参照定義]は文書に[リンクラベル]とその[リンク先]の対応情報を設定する。まず本ページで実際に用いられている例を示す。`[リンクラベル]: リンク先`の形式で記述する。

```markdown
[Setext]: https://en.wikipedia.org/wiki/Setext
```

これはMarkdown文書中のどこに配置してもよい(本ページではMarkupソースファイルの末尾に記述してある)。これ自体はHTMLとして出力されないが、次のように[リンクラベル]を`[...]`で囲うと``<a href="リンク先">リンクラベル</a>``を作成する。

```markdown
[Setext]
```

> [Setext]

> これは[リンク]作成の省略記法のひとつ([Example 565](https://higuma.github.io/github-flabored-markdown/#example-565))。[リンク]の作成方法は[6.6 Links](inlines.md#66-links)で詳しく説明する。

またhover時にポップアップするリンクタイトルを表示する場合はその後に`"リンクタイトル"`または`'リンクタイトル'`で記述する。これはリンク作成時に`title`属性として設定され、`[リンクラベル]`は``<a href="リンク先" title="リンクタイトル">リンクラベル</a>``と出力する。

```markdown
[example.com]: https://www.example.com/ "Example Domain"

[example.com]
```

次の出力のリンク上にマウスポインタをかざすとリンクタイトルがポップアップするのを確認できる。

> [example.com]: https://www.example.com/ "Example Domain"
> 
> [example.com]

基本は以上。

## Details

<details>
<summary>Summary</summary>

仕様書に基いた文法仕様は次の通り。

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

</details>

<details>
<summary>Examples</summary>

以下はテスト。GutHubも完全に対応できてはいないように思える。

[[abc\]]: introduction.md "[abc]"

[[abc\]]

後は記法のバリエーションについて補足説明する。まず[リンクラベル]の手前には3文字までのインデントスペースが可能。[リンク先]の前には任意個のスペースが可能(なくてもよい)。タイトルを設定する場合は手前に1個以上のスペースが必要。また行末にスペースがあれば除去して処理する。

```markdown
[GitHub]:   https://www.github.com/    "GitHub"   
[Wikipedia]:https://www.wikipedia.org/ "Wikipedia"

[GitHub] [Wikipedia]
```

> [GitHub]:   https://www.github.com/    "GitHub"   
> [Wikipedia]:https://www.wikipedia.org/ "Wikipedia"
> 
> [GitHub] [Wikipedia]

リンク先(URL)が空白文字や特殊文字を含む場合はいくつか方法がある。以下はリンク先`'my url'`(シングルクォートとスペースを含む)に対する記述例。

* [パーセントエンコーディング](https://ja.wikipedia.org/wiki/パーセントエンコーディング)記法: `%27my%20url%27`
* [オートリンク](inlines.md#68-autolinks)(angle bracket)記法: `<'my url'>`

> 興味のある人はExamples [161](https://higuma.github.io/github-flabored-markdown/#example-161)-[188](https://higuma.github.io/github-flabored-markdown/#example-188)を解読するとよい勉強になる。

以下TODO - Linkの方を先に書き、書式は「Linkの文法と同じ」とした方がすっきりすると思う。

</details>

------------------------------------------------------------------------

[4.6 HTMLブロック](html-blocks.md)
← [目次](index.md) →
[4.8 パラグラフ](paragraphs.md)

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
