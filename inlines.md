# [6 Inlines](https://higuma.github.io/github-flabored-markdown/#inlines)

[5 Container blocks](container-blocks.md)
← [Table of contents](index.md) →
[Appendix: A parsing strategy](appendix-a-parsing-strategy.md)

------------------------------------------------------------------------

[インライン]構文は文字ストリームの並び順に評価される。

## [6.1 Backslash escapes](https://higuma.github.io/github-flabored-markdown/#backslash-escapes)

Markdownではバックスラッシュ(`\`)は特別な意味を持つ。

* [ASCII区切り文字]をMarkdown構文の一部ではなく通常テキストとして認識させる
* 行末に用いて[ハード改行]を表現する

### Best practice

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

[ASCII区切り文字]はMarkdownの書式設定に用いられるが、これを書式ではなく文字として年式させる場合にバックスラッシュエスケープを用いる。まず次は[強調]と[打ち消し線]、[区切り]、[見出し]の例。

```markdown
_emphasis_, **strong**, ~~strikethrough~~

--------------------

### 見出し
```

> _emphasis_, **strong**, ~~strikethrough~~
> 
> --------------------
> 
> ### 見出し

これらを書式設定ではなく文字そのものとして出力させる場合にバックスラッシュエスケープを用いる。(目安として)[ASCII区切り文字]の先頭部分に「これは書式設定ではない」という意味のバックスラッシュを付けることで認識する。

```markdown
\_not emphasis_, \*\*not strong**, \~~not strikethrough~~

\--------------------

\### 見出しではない
```

> \_not emphasis_, \*\*not strong**, \~~not strikethrough~~
> 
> \--------------------
> 
> \### 見出しではない

もうひとつの`\`の用法として、次のように行末に`\`を用いるとHTMLでは改行して出力する。

```markdown
一行目\
二行目
```

> 一行目\
> 二行目

### Details

<details>
<summary>Summary</summary>

[ASCII区切り文字]とは[ASCII印字可能文字](https://ja.wikipedia.org/wiki/ASCII印字可能文字)(U+0020..U+007F)からスペースと英数字を除外した文字を指す。

* U+0021..U+002F: `!`, `"`, `#`, `$`, `%`, `&`, `'`, `(`, `)`, `*`, `+`, `,`, `-`, `.`, `/`
* U+003A..U+0040: `:`, `;`, `<`, `=`, `>`, `?`, `@`
* U+005B..U+0060: `[`, `\`, `]`, `^`, `_`, `` ` ``
* U+007B..U+007E: `{`, `|`, `}`, `~`

[ASCII区切り文字]の手前に`\`を付けるとMarkdown書式ではなく`\`でエスケープした文字と認識し、`\`を除去した文字を出力する。それ以外の印字可能文字の手前の`\`は文字としてそのまま出力する。[全ASCII印字可能文字のバックスラッシュエスケープ効果一覧](https://gist.github.com/higuma/8bab3e3f79105907797cdfe243f19033)は次の通り。

| U+ | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 0020 | `` \  ``<br>\  | `` \! ``<br>\! | `` \" ``<br>\" | `` \# ``<br>\# | `` \$ ``<br>\$ | `` \% ``<br>\% | `` \& ``<br>\& | `` \' ``<br>\' | `` \( ``<br>\( | `` \) ``<br>\) | `` \* ``<br>\* | `` \+ ``<br>\+ | `` \, ``<br>\, | `` \- ``<br>\- | `` \. ``<br>\. | `` \/ ``<br>\/ |
| 0030 | `` \0 ``<br>\0 | `` \1 ``<br>\1 | `` \2 ``<br>\2 | `` \3 ``<br>\3 | `` \4 ``<br>\4 | `` \5 ``<br>\5 | `` \6 ``<br>\6 | `` \7 ``<br>\7 | `` \8 ``<br>\8 | `` \9 ``<br>\9 | `` \: ``<br>\: | `` \; ``<br>\; | `` \< ``<br>\< | `` \= ``<br>\= | `` \> ``<br>\> | `` \? ``<br>\? |
| 0040 | `` \@ ``<br>\@ | `` \A ``<br>\A | `` \B ``<br>\B | `` \C ``<br>\C | `` \D ``<br>\D | `` \E ``<br>\E | `` \F ``<br>\F | `` \G ``<br>\G | `` \H ``<br>\H | `` \I ``<br>\I | `` \J ``<br>\J | `` \K ``<br>\K | `` \L ``<br>\L | `` \M ``<br>\M | `` \N ``<br>\N | `` \O ``<br>\O |
| 0050 | `` \P ``<br>\P | `` \Q ``<br>\Q | `` \R ``<br>\R | `` \S ``<br>\S | `` \T ``<br>\T | `` \U ``<br>\U | `` \V ``<br>\V | `` \W ``<br>\W | `` \X ``<br>\X | `` \Y ``<br>\Y | `` \Z ``<br>\Z | `` \[ ``<br>\[ | `` \\ ``<br>\\ | `` \] ``<br>\] | `` \^ ``<br>\^ | `` \_ ``<br>\_ |
| 0060 | `` \` ``<br>\` | `` \a ``<br>\a | `` \b ``<br>\b | `` \c ``<br>\c | `` \d ``<br>\d | `` \e ``<br>\e | `` \f ``<br>\f | `` \g ``<br>\g | `` \h ``<br>\h | `` \i ``<br>\i | `` \j ``<br>\j | `` \k ``<br>\k | `` \l ``<br>\l | `` \m ``<br>\m | `` \n ``<br>\n | `` \o ``<br>\o |
| 0070 | `` \p ``<br>\p | `` \q ``<br>\q | `` \r ``<br>\r | `` \s ``<br>\s | `` \t ``<br>\t | `` \u ``<br>\u | `` \v ``<br>\v | `` \w ``<br>\w | `` \x ``<br>\x | `` \y ``<br>\y | `` \z ``<br>\z | `` \{ ``<br>\{ | `` \| ``<br>\| | `` \} ``<br>\} | `` \~ ``<br>\~ |

また行末に`\`を用いると[ハード改行]として機能する。行末が`\`で終わる行には出力に``<br>``が挿入され、HTMLでは改行されて出力する。

</details>

<details>
<summary>Examples</summary>

区切り文字の多くはMarkdownの書式設定記号として用いられる。これらを書式ではなく文字そのものとして認識させる場合に`\`を付けてエスケープする。必ずしも全ての区切り文字に付ける必要はなく、目安として構文の起点となる区切り文字の手前にバックスラッシュを付けることで認識する。

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

[リンク](https://www.example.com), \[リンクではない]\(https\://www\.example.com)

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
> [リンク](https://www.example.com), \[リンクではない]\(https\://www\.example.com)
> 
> \[リンク参照定義ではない]\: https\://www\.example.com
> 
> \<span>タグではない\</span>
> 
> \```コードブロックではない
> 
> \`コードスパンではない`

強調書式(`**strong**`)をエスケープする場合は2つ必要になることに注意。1つだけだと斜体と認識される。

```markdown
**strong**

\**emphasis surrounded by asterisks**

\*\*normal text**
```

> **strong**
> 
> \**emphasis surrounded by asterisks**
> 
> \*\*normal text**

なお文法上どの区切り文字をどのようにエスケープすれば認識するかは構文の種類だけでなく実装によっても異なる場合があるため、詳しいルールはここには書かない。それよりもターゲット環境のMarkdown実装のプレビュー機能を用いて実際に確認しながら作業するとよい。

> GitHub実装でさえGFM仕様書通りではない動作が多数あるため、詳細動作をいちいち記載してもあまり役に立たない。それよりもターゲット環境用のMarkdownプレビュー機能を利用して実際に確認すべき。筆者はGitHubに公開するMarkdown文書は[gist](https://gist.github.com/)を利用して確認している。

区切り文字の手前に(エスケープではない)バックスラッシュがある場合は`\\`を用いる。

```markdown
これは\\=を含む。
```

> これは\\=を含む。

バックスラッシュと区切り文字を組み合わせて表示する場合は次のように処理する。

* `\=` → \= (`\`はエスケープと認識して除去)
* `\\=` → \\= (`\\`は単一の`\`に変換)
* `\\\=` → \\\= (3つ目の`\`は次の`=`のエスケープと認識して除去)
* `\\\\=` → \\\\= (以下同様)

もうひとつの用途として、行末に用いると[ハード改行]として認識される。その位置に``<br>``が挿入され、HTMLでは改行されて出力する。

```markdown
行末で改行(``<br>``を挿入)\
次の行
```

> 行末で改行(``<br>``を挿入)\
> 次の行

</details>

## [6.2 Entity and numeric character references](https://higuma.github.io/github-flabored-markdown/#entity-and-numeric-character-references)

## [6.3 Code spans](https://higuma.github.io/github-flabored-markdown/#code-spans)

[コードスパン]は[インライン]構文としてのコードを表現する。

### Best practice





### Details



## [6.4 Emphasis and strong emphasis](https://higuma.github.io/github-flabored-markdown/#emphasis-and-strong-emphasis)

## [6.5 Strikethrough (extension)](https://higuma.github.io/github-flabored-markdown/#strikethrough-extension-)

> 初期実装のGruber版Markdownにあった機能だが、CommonMarkは(おそらく`~~~`をFenced code blockに用いた副作用で)採用していない。GFMではこれを復活させている。

## [6.6 Links](https://higuma.github.io/github-flabored-markdown/#links)

## [6.7 Images](https://higuma.github.io/github-flabored-markdown/#images)

## [6.8 Autolinks](https://higuma.github.io/github-flabored-markdown/#autolinks)

## [6.9 Autolinks (extension)](https://higuma.github.io/github-flabored-markdown/#autolinks-extension-)

## [6.10 Raw HTML](https://higuma.github.io/github-flabored-markdown/#raw-html)

## [6.11 Disallowed Raw HTML (extension)](https://higuma.github.io/github-flabored-markdown/#disallowed-raw-html-extension-)

## [6.12 Hard line breaks](https://higuma.github.io/github-flabored-markdown/#hard-line-breaks)

## [6.13 Soft line breaks](https://higuma.github.io/github-flabored-markdown/#soft-line-breaks)

## [6.14 Textual content](https://higuma.github.io/github-flabored-markdown/#textual-content)

------------------------------------------------------------------------

[5 Container blocks](container-blocks.md)
← [Table of contents](index.md) →
[Appendix: A parsing strategy](appendix-a-parsing-strategy.md)

[インライン]: #
[コードスパン]: #63-code-spans
[ハード改行]: #612-hard-line-breaks
[見出し]: leaf-blocks.md#42-atx-headings
[強調]: #64-emphasic-and-strong-emphasis
[打ち消し線]: #65-strikethrough-extension
[区切り]: leaf-blocks.md#41-thematic-breaks
[ASCII区切り文字]: https://higuma.github.io/github-flabored-markdown/#ascii-punctuation-character
