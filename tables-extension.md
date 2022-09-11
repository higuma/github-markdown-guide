# [4.10 表組み](https://higuma.github.io/github-markdown-guide/#tables-extension-)

[4.9 空行](blank-lines.md)
← [目次](index.md) →
[5 コンテナブロック](container-blocks.md)

------------------------------------------------------------------------

GFMでは[表組み]を表現できる。

### Best practice

見かけではなく、Markdown処理実装に誤認識させない書き方を徹底するのが間違いない。

```markdown
| foo | bar |
| --- | --- |
| baz | bim |

| 標準 | 左寄せ | 中央寄せ | 右寄せ |
| ---- | :----- | :------: | -----: |
| あいうえお | あいうえお | あいうえお | あいうえお |
| abc | *abc* **abc** | ~~abc~~ | [abc](#) |
| | https://example.com/ | `(1..10).each {\|x\| puts x }` | |
```

> | foo | bar |
> | --- | --- |
> | baz | bim |
> 
> | 標準 | 左寄せ | 中央寄せ | 右寄せ |
> | ---- | :----- | :------: | -----: |
> | あいうえお | あいうえお | あいうえお | あいうえお |
> | abc | *abc* **abc** | ~~abc~~ [abc](#) | https://example.com/ |
> | | _y = \|x\|_ | `(1..10).each {\|x\| puts x }` | |

* 1行目はヘッダ行、2行目は区切り行、3行目以降がデータ行
* セル間の区切りは`|`、コンテンツとの間にスペース1個以上(誤認識防止用に推奨)
* 行頭と行末に`|`を入れる(必須ではないが空セルの誤認識防止になる)
* ヘッダセルはなるべく通常テキスト(書式設定しても効かない場合がある)
* データセル内にはコンテンツとして任意のインライン構文を挿入可能
    * コンテンツが`|`を含む場合は`\`でエスケープ
* 各行のセル数は揃える
    * ヘッダ行と区切り行のセル数が一致しないと表組みと認識されない
    * データ行はセル数が不足していてもよい(後ろに空セルが挿入される)
    * 逆にデータ行のセル数が多すぎると後ろが切り捨てられるので注意
* アラインメントは2行目のセルを次の通り設定(`-`は1個以上任意)
    * `-----` - 標準(ヘッダは中央、コンテンツは左寄せ)
    * `:----` - 左寄せ
    * `:---:` - 中央寄せ
    * `----:` - 右寄せ
* テキスト表現は横幅を揃える必要なし
* 表組みの前後のブロック構文との間に[空行]を入れる(誤認識対策)

### Details

<details>
<summary><strong>Summary</strong></summary>

より詳しい仕様は次の通り。

* 1行目はヘッダ行(header row)
* 2行目は区切り行(delimiter row)
* 3行目以降がデータ行(data rows)
* セル間の区切りは`|`
    * コンテンツとの間に1個以上スペースを挿入(必須ではないが誤認識防止用に推奨)
* ヘッダセルとデータセル内にはコンテンツとして任意のインライン構文を挿入可能
    * ただしヘッダセルは最初から強調表示してあるので設定が効かない場合があるので注意
    * コンテンツが`|`を含む場合は`\`でエスケープ
* 行頭と行末の`|`は基本的に不要、ただしあった方がよい(空セルの誤認識防止になる)
* ヘッダ行と区切り行のセル数は一致していなければならない
    * 一致しない場合は表組みではないとして文法解析し直す(多くの場合[パラグラフ]と認識)
    * データ行のセル数が不足する場合は後ろに空セルを追加
    * データ行のセル数の方が多い場合は切り捨て
* アラインメントは区切り行のセルを次の通り設定(`-`は1個以上任意)
    * `-----` - 標準(ヘッダは中央、コンテンツは左寄せ)
    * `:----` - 左寄せ
    * `:---:` - 中央寄せ
    * `----:` - 右寄せ
* テキスト表現は横幅を揃える必要なし
* 表組みの前後にあるブロック構文は、正しく判別できれば[空行]不要(ただし入れた方が確実)

> 最後の「正しく判別できれば...」という部分が厄介で、GitHubのMarkdown実装はGFM仕様からさらに日常的に手を加えて調整している。そのため「仕様書通り」であっても意図通りに出力する保証はない。我々利用者側としては、誤認識させないような書き方を徹底するしかない。

</details>

<details>
<summary><strong>Examples</strong></summary>

TODO

</details>

------------------------------------------------------------------------

[4.9 空行](blank-lines.md)
← [目次](index.md) →
[5 コンテナブロック](container-blocks.md)

[ATX]: https://en.wikipedia.org/wiki/Aaron_Swartz#atx
[ATX headings]: #42-atx-headings
[コードフェンス]: https://higuma.github.io/github-markdown-guide/#code-fence
[CommonMark]: https://commonmark.org/
[info string]: https://higuma.github.io/github-markdown-guide/#info-string
[Markdown]: https://ja.wikipedia.org/wiki/Markdown
[Setext]: https://en.wikipedia.org/wiki/Setext
[Setext heading]: #43-setext-headings
[インデント方式コードブロック]: #44-indented-code-blocks
[インライン]: inlines.md
[コードフェンス]: https://higuma.github.io/github-markdown-guide/#code-fence
[シンタックスハイライト]: https://ja.wikipedia.org/シンタックスハイライト
[フェンスドコードブロック]: #45-fenced-code-blocks
[リスト]: lists.md
[リンク]: https://higuma.github.io/github-markdown-guide/#links
[リンク参照定義]: https://higuma.github.io/github-markdown-guide/#link-reference-definition
[リンクラベル]: https://higuma.github.io/github-markdown-guide/#link-label
[リンク先]: https://higuma.github.io/github-markdown-guide/#link-destination
[リンクタイトル]: https://higuma.github.io/github-markdown-guide/#link-title
[パラグラフ]: #48-paragraphs
[空行]: #49-blank-lines
[空白文字]: https://higuma.github.io/github-markdown-guide/#whitespace-character
[正規表現]: https://deeloper.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
[見出し]: #42-atx-headings
