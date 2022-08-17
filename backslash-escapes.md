# [6.1 Backslash escapes](https://higuma.github.io/github-flabored-markdown/#backslash-escapes)

[6 Inlines](inlines.md)
← [Table of contents](index.md) →
[6.2 Entity and numeric character references](entity-and-numeric-character-references.md)

------------------------------------------------------------------------

Markdownではバックスラッシュ(`\`)は特別な意味を持つ。

* [ASCII区切り文字]をMarkdown構文の一部ではなく通常テキストとして認識させる
* 行末に用いて[ハード改行]を出力する

## Best practice

バックスラッシュ(`\`)は[ASCII区切り文字](`#`, `(`, `)`,`+`, `-`, etc.)の手前ではエスケープと解釈されて除去される。それ以外の文字の前ではそのまま出力する。

```markdown
\# \* \. \= \\

\0 \A \a \α \あ
```

> \# \* \. \= \\
> 
> \0 \A \a \α \あ

[ASCII区切り文字]の手前のバックスラッシュを文字として認識させる場合は`\\`を用いる。

```markdown
\\/\\/\\/\\/\\/\\/\\/\\/
```

> \\/\\/\\/\\/\\/\\/\\/\\/

[ASCII区切り文字]の多くはMarkdownの書式設定に用いられるが、これらを書式ではなく文字として認識させる場合にバックスラッシュエスケープを用いる。

次は[強調]と[打ち消し線]、[区切り]、[見出し]とそのエスケープ例。通常の解釈では書式設定と判定される[ASCII区切り文字]の先頭部分にバックスラッシュを付けてエスケープすることにより通常文字として認識させる。

```markdown
_italic_, **bold**, ***bold italic*** ~~strikethrough~~

\_not italic_, \*\*not bold**, \*\*\*not bold italic*** \~~not strikethrough~~

--------------------

\--------------------

### 見出し

\### 見出しではない
```

> _italic_, **bold**, ***bold italic*** ~~strikethrough~~
> 
> \_not italic_, \*\*not bold**, \*\*\*not bold italic*** \~~not strikethrough~~
> 
> --------------------
> 
> \--------------------
> 
> ### 見出し
> 
> \### 見出しではない

もうひとつの`\`の用法として、次のように行末に`\`を用いるとHTMLでは改行して出力する。

```markdown
一行目\
二行目
```

> 一行目\
> 二行目

## Summary

### ASCII区切り文字

[ASCII区切り文字(ASCII puctuation characters)](https://higuma.github.io/github-flabored-markdown/#ascii-punctuation-character)とは[ASCII印字可能文字](https://ja.wikipedia.org/wiki/ASCII印字可能文字)(U+0020..U+007F)からスペースと英数字を除外した文字を指す。

* U+0021..U+002F: `!`, `"`, `#`, `$`, `%`, `&`, `'`, `(`, `)`, `*`, `+`, `,`, `-`, `.`, `/`
* U+003A..U+0040: `:`, `;`, `<`, `=`, `>`, `?`, `@`
* U+005B..U+0060: `[`, `\`, `]`, `^`, `_`, `` ` ``
* U+007B..U+007E: `{`, `|`, `}`, `~`

### バックスラッシュエスケープ

[ASCII区切り文字]の手前に`\`を付けるとMarkdown書式ではなく`\`でエスケープした文字と認識し、`\`を除去した文字を出力する。それ以外の印字可能文字の手前の`\`は文字としてそのまま出力する。[全てのASCII印字可能文字のバックスラッシュエスケープ効果一覧](https://gist.github.com/higuma/8bab3e3f79105907797cdfe243f19033)は次の通り。

| U+ | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 0020 |&nbsp;`` \  ``&nbsp;<br>\  |&nbsp;`` \! ``&nbsp;<br>\! |&nbsp;`` \" ``&nbsp;<br>\" |&nbsp;`` \# ``&nbsp;<br>\# |&nbsp;`` \$ ``&nbsp;<br>\$ |&nbsp;`` \% ``&nbsp;<br>\% |&nbsp;`` \& ``&nbsp;<br>\& |&nbsp;`` \' ``&nbsp;<br>\' |&nbsp;`` \( ``&nbsp;<br>\( |&nbsp;`` \) ``&nbsp;<br>\) |&nbsp;`` \* ``&nbsp;<br>\* |&nbsp;`` \+ ``&nbsp;<br>\+ |&nbsp;`` \, ``&nbsp;<br>\, |&nbsp;`` \- ``&nbsp;<br>\- |&nbsp;`` \. ``&nbsp;<br>\. |&nbsp;`` \/ ``&nbsp;<br>\/ |
| 0030 |&nbsp;`` \0 ``&nbsp;<br>\0 |&nbsp;`` \1 ``&nbsp;<br>\1 |&nbsp;`` \2 ``&nbsp;<br>\2 |&nbsp;`` \3 ``&nbsp;<br>\3 |&nbsp;`` \4 ``&nbsp;<br>\4 |&nbsp;`` \5 ``&nbsp;<br>\5 |&nbsp;`` \6 ``&nbsp;<br>\6 |&nbsp;`` \7 ``&nbsp;<br>\7 |&nbsp;`` \8 ``&nbsp;<br>\8 |&nbsp;`` \9 ``&nbsp;<br>\9 |&nbsp;`` \: ``&nbsp;<br>\: |&nbsp;`` \; ``&nbsp;<br>\; |&nbsp;`` \< ``&nbsp;<br>\< |&nbsp;`` \= ``&nbsp;<br>\= |&nbsp;`` \> ``&nbsp;<br>\> |&nbsp;`` \? ``&nbsp;<br>\? |
| 0040 |&nbsp;`` \@ ``&nbsp;<br>\@ |&nbsp;`` \A ``&nbsp;<br>\A |&nbsp;`` \B ``&nbsp;<br>\B |&nbsp;`` \C ``&nbsp;<br>\C |&nbsp;`` \D ``&nbsp;<br>\D |&nbsp;`` \E ``&nbsp;<br>\E |&nbsp;`` \F ``&nbsp;<br>\F |&nbsp;`` \G ``&nbsp;<br>\G |&nbsp;`` \H ``&nbsp;<br>\H |&nbsp;`` \I ``&nbsp;<br>\I |&nbsp;`` \J ``&nbsp;<br>\J |&nbsp;`` \K ``&nbsp;<br>\K |&nbsp;`` \L ``&nbsp;<br>\L |&nbsp;`` \M ``&nbsp;<br>\M |&nbsp;`` \N ``&nbsp;<br>\N |&nbsp;`` \O ``&nbsp;<br>\O |
| 0050 |&nbsp;`` \P ``&nbsp;<br>\P |&nbsp;`` \Q ``&nbsp;<br>\Q |&nbsp;`` \R ``&nbsp;<br>\R |&nbsp;`` \S ``&nbsp;<br>\S |&nbsp;`` \T ``&nbsp;<br>\T |&nbsp;`` \U ``&nbsp;<br>\U |&nbsp;`` \V ``&nbsp;<br>\V |&nbsp;`` \W ``&nbsp;<br>\W |&nbsp;`` \X ``&nbsp;<br>\X |&nbsp;`` \Y ``&nbsp;<br>\Y |&nbsp;`` \Z ``&nbsp;<br>\Z |&nbsp;`` \[ ``&nbsp;<br>\[ |&nbsp;`` \\ ``&nbsp;<br>\\ |&nbsp;`` \] ``&nbsp;<br>\] |&nbsp;`` \^ ``&nbsp;<br>\^ |&nbsp;`` \_ ``&nbsp;<br>\_ |
| 0060 |&nbsp;`` \` ``&nbsp;<br>\` |&nbsp;`` \a ``&nbsp;<br>\a |&nbsp;`` \b ``&nbsp;<br>\b |&nbsp;`` \c ``&nbsp;<br>\c |&nbsp;`` \d ``&nbsp;<br>\d |&nbsp;`` \e ``&nbsp;<br>\e |&nbsp;`` \f ``&nbsp;<br>\f |&nbsp;`` \g ``&nbsp;<br>\g |&nbsp;`` \h ``&nbsp;<br>\h |&nbsp;`` \i ``&nbsp;<br>\i |&nbsp;`` \j ``&nbsp;<br>\j |&nbsp;`` \k ``&nbsp;<br>\k |&nbsp;`` \l ``&nbsp;<br>\l |&nbsp;`` \m ``&nbsp;<br>\m |&nbsp;`` \n ``&nbsp;<br>\n |&nbsp;`` \o ``&nbsp;<br>\o |
| 0070 |&nbsp;`` \p ``&nbsp;<br>\p |&nbsp;`` \q ``&nbsp;<br>\q |&nbsp;`` \r ``&nbsp;<br>\r |&nbsp;`` \s ``&nbsp;<br>\s |&nbsp;`` \t ``&nbsp;<br>\t |&nbsp;`` \u ``&nbsp;<br>\u |&nbsp;`` \v ``&nbsp;<br>\v |&nbsp;`` \w ``&nbsp;<br>\w |&nbsp;`` \x ``&nbsp;<br>\x |&nbsp;`` \y ``&nbsp;<br>\y |&nbsp;`` \z ``&nbsp;<br>\z |&nbsp;`` \{ ``&nbsp;<br>\{ |&nbsp;`` \| ``&nbsp;<br>\| |&nbsp;`` \} ``&nbsp;<br>\} |&nbsp;`` \~ ``&nbsp;<br>\~ |

なおバックスラッシュエスケープは次の文法要素に対しては作用せず、そのまま出力される。

* [コードブロック]
* [コードスパン]
* [オートリンク]
* [生HTML]

> これらのコード例はこの先の[Examples](#examples)の中で示す。

### ハード改行

また行末に`\`を用いると[ハード改行]として機能する。行末が`\`で終わる行には出力に``<br>``が挿入され、HTMLでは改行されて出力する。

## Examples

区切り文字の手前に(エスケープではない)バックスラッシュを文字として記述するには`\\`を用いる。

```markdown
これは\\=を含む。
```

> これは\\=を含む。

バックスラッシュと区切り文字を組み合わせて表示する場合は次のように処理する。

* `\=` → \= (`\`はエスケープと認識して除去)
* `\\=` → \\= (`\\`は単一の`\`に変換)
* `\\\=` → \\\= (3つ目の`\`は次の`=`のエスケープと認識して除去)
* `\\\\=` → \\\\= (以下同様)

区切り文字の多くはMarkdownの書式設定記号として用いられるが、これらを書式ではなく文字として認識させる場合に`\`を付けてエスケープする。必ずしも全ての区切り文字に付ける必要はなく、目安として構文の起点となる区切り文字の手前にバックスラッシュを付けることで認識する。

```markdown
### 見出し

\### 見出しではない

* リストアイテム

\* リストアイテムではない

- リストアイテム

\- リストアイテムではない

1. 順序リストのアイテム

1\. 順序リストのアイテムではない

1) 順序リストのアイテム

1\) 順序リストのアイテムではない

[リンク](https://www.example.com), \[リンクではない](not a link)

\<span>タグではない\</span>

\```コードブロックではない

\`コードスパンではない`
```

> ### 見出し
> 
> \### 見出しではない
> 
> * リストアイテム
> 
> \* リストアイテムではない
> 
> - リストアイテム
> 
> \- リストアイテムではない
> 
> 1. 順序リストのアイテム
> 
> 1\. 順序リストのアイテムではない
> 
> 1) 順序リストのアイテム
> 
> 1\) 順序リストのアイテムではない
> 
> [リンク](https://www.example.com), \[リンクではない](not a link)
> 
> \<span>タグではない\</span>
> 
> \```コードブロックではない
> 
> \`コードスパンではない`

強調書式(`**strong**`)をエスケープする場合は2つ必要になることに注意。1つだけだと斜体と認識される。

```markdown
**bold**

\**italic surrounded by asterisks**

\*\*normal text**
```

> **bold**
> 
> \**italic surrounded by asterisks**
> 
> \*\*normal text**

3つの場合も同様。

```markdown
***bold italic***

\***bold surrounded by asterisks***

\*\**italic surrounded by double asterisks***

\*\*\*normal text***
```

> ***bold italic***
> 
> \***bold surrounded by asterisks***
> 
> \*\**italic surrounded by double asterisks***
> 
> \*\*\*normal text***

なお文法上どの区切り文字をどのようにエスケープすれば認識するかは構文の種類だけでなく実装によっても異なる場合があるため詳しいルールはここには書かない。それよりもターゲット環境のMarkdown実装で実際に確認しながら作業するとよい(多くの場合プレビュー機能を利用できる)。

> 現実のMarkdown実装はそれぞれの目的別にカスタマイズされており、GitHub実装でさえGFM仕様書通りではない動作が多数ある。そのため詳細動作をここにいちいち記載してもあまり役に立たない。それよりターゲット環境で直接チェックすべき。筆者はGitHubに公開するMarkdown文書は[GitHub Gist]で確認している。

バックスラッシュエスケープは[コードブロック]と[コードスパン]の中では適用されない。

``````markdown
```
\*not escaped*
```

`\- not escaped`
``````

> ```
> \*not escaped*
> ```
> 
> `\- not escaped`

[オートリンク]、[オートリンク拡張]でも(バックスラッシュを含むURLが有効であれば)エスケープが適用されない。

```markdown
<http://www.example.com#\-\+\=>

http://www.example.com?\-\+\=
```

> <http://www.example.com#\-\+\=>
> 
> http://www.example.com?\-\+\=

[生HTML]の属性値もエスケープが適用されない。次のコード例では出力結果部分の上にマウスカーソルをかざすと`title`に設定した文字列がポップアップすることで確認できる。

```markdown
<a href="http://www.example.com" title="\=\=example domain=/=/">Example domain</a>
```

> <a href="http://www.example.com" title="\=\=example domain=/=/">Example domain</a>

その他のケースではバックスラッシュエスケープが効く。以下は仕様書からの要約だが、どれも特殊ケースで通常使うものではないので一覧表示のみとする。

* URL → [Example 318](https://higuma.github.io/github-flabored-markdown/#example-318)
* [リンク]タイトルと[リンク参照定義] → [Example 319](https://higuma.github.io/github-flabored-markdown/#example-319)
* [コードブロック]のinfo文字列 → [Example 320](https://higuma.github.io/github-flabored-markdown/#example-320)

> <details>
> <summary>GitHubのMarkdown実装におけるURLの扱い</summary>
> 
> 拡張機能の追加によりURLに関してはGFMやGitHubのMarkdown実装はCommonMark準拠ではなくなっている。例えばURLを純粋にテキストとしてのみ出力しようとして次のように書いたとする。
> 
> ```markdown
> https\:\/\/www\.example\.com
> ```
> 
> これで通常のMarkdown処理実装はテキストとして出力する。しかしGFM仕様ではこれでもバックスラッシュを無視して[オートリンク拡張]として出力する。
> 
> > https\:\/\/www\.example\.com
> 
> Babelmarkでの比較結果は次の通り。大部分の処理実装は通常テキストとして出力するが、GFMなど一部の実装は[オートリンク拡張]として扱う。
> 
> https://babelmark.github.io/?text=https%5C%3A%5C%2F%5C%2Fwww%5C.example%5C.com
> 
> (2022-08-11現在) また[GitHub Gist]のMarkdown処理では編集時のPreview表示と最終出力が異なる場合がある(注意)。例えば[次のMarkdowns文](https://gist.github.com/higuma/9fb12dd67597367d15be8bbac1c00c11)を処理させると`https\://...`の部分をプレビューでは通常テキストと判定するが、本処理は[オートリンク拡張]と判定する。
> 
> ```markdown
> \[これはリンクではない、しかしリンク先に注意](https\://www\.example\.com)
> ```
> 
> 本現象は一時的な振る舞いの可能性が高いが記録として残しておく(将来的には修正されるはず)。本例に限らず多くのMarkdown処理実装は(各Webサービスの)目的別にカスタマイズされており、特殊ケースでどうなるかは実際に処理させてみないと分からない。
>
> また実環境チェックも大切だが、それよりもこのような実装依存の可能性が高い記述は最初から回避する自衛策を講じることも重要。幸いにも実用上はこのような例に出くわすことは稀で(上記の例はもちろん意図的に作ったもの)、回避方法は考えれば色々とある。
> 
> </details>

もうひとつの用途として、行末に用いると[ハード改行]として認識される。その位置に``<br>``が挿入され、HTMLでは改行して出力する。

```markdown
行末で改行(``<br>``を挿入)\
次の行
```

> 行末で改行(``<br>``を挿入)\
> 次の行

------------------------------------------------------------------------

[6 Inlines](inlines.md)
← [Table of contents](index.md) →
[6.2 Entity and numeric character references](entity-and-numeric-character-references.md)

[ASCII区切り文字]: #ASCII区切り文字
[GitHub Gist]: https://gist.github.com/
[オートリンク]: autolinks.md
[オートリンク拡張]: autolinks-extension.md
[コードスパン]: code-spans.md
[コードブロック]: fenced-code-blocks.md
[ハード改行]: hard-line-breaks.md
[リンク]: links.md
[リンク参照定義]: link-reference-definitions.md
[見出し]: atx-headings.md
[強調]: emphasis-and-strong-emphasis.md
[打ち消し線]: strikethrough-extension.md
[区切り]: thematic-breaks.md
[生HTML]: raw-html.md