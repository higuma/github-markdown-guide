# [6.1 バックスラッシュエスケープ](https://higuma.github.io/github-markdown-guide/gfm/#backslash-escapes)

[6 インライン](inlines.md)
← [目次](index.md) →
[6.2 文字参照](character-references.md)

------------------------------------------------------------------------

Markdownではバックスラッシュ(`\`)は特別な意味を持つ。

* [ASCII区切り文字]をMarkdown構文の一部ではなく通常テキストとして認識させる
* 行末に用いて[ハード改行]を出力する

## ベストプラクティス

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

次は[斜体と太字]、[打ち消し線]、[横線]、[見出し]に対するエスケープ例。通常の解釈では書式設定と判定される[ASCII区切り文字]の先頭部分にバックスラッシュを付けてエスケープすることにより通常文字として認識させる。

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

もうひとつの`\`の用法として、次のように行末に`\`を用いると改行して出力する。

```markdown
一行目\
二行目
```

> 一行目\
> 二行目

## まとめ

### ASCII区切り文字

[ASCII区切り文字(ASCII puctuation characters)](https://higuma.github.io/github-markdown-guide/gfm/#ascii-punctuation-character)とは[ASCII印字可能文字](https://ja.wikipedia.org/wiki/ASCII印字可能文字)(U+0020..U+007F)からスペースと英数字を除外した文字を指す。

* U+0021..U+002F: `!`, `"`, `#`, `$`, `%`, `&`, `'`, `(`, `)`, `*`, `+`, `,`, `-`, `.`, `/`
* U+003A..U+0040: `:`, `;`, `<`, `=`, `>`, `?`, `@`
* U+005B..U+0060: `[`, `\`, `]`, `^`, `_`, `` ` ``
* U+007B..U+007E: `{`, `|`, `}`, `~`

### バックスラッシュエスケープ

[ASCII区切り文字]の手前に`\`を付けるとMarkdown書式ではなく`\`でエスケープした文字と認識し、`\`を除去した文字を出力する。それ以外の印字可能文字の手前の`\`は文字としてそのまま出力する。[全ASCII印字可能文字のバックスラッシュエスケープ効果一覧](https://gist.github.com/higuma/8bab3e3f79105907797cdfe243f19033)は次の通り。

| U+ | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 0020 | `` \  ``&NoBreak;<br>\  | `` \! ``&NoBreak;<br>\! | `` \" ``&NoBreak;<br>\" | `` \# ``&NoBreak;<br>\# | `` \$ ``&NoBreak;<br>\$ | `` \% ``&NoBreak;<br>\% | `` \& ``&NoBreak;<br>\& | `` \' ``&NoBreak;<br>\' | `` \( ``&NoBreak;<br>\( | `` \) ``&NoBreak;<br>\) | `` \* ``&NoBreak;<br>\* | `` \+ ``&NoBreak;<br>\+ | `` \, ``&NoBreak;<br>\, | `` \- ``&NoBreak;<br>\- | `` \. ``&NoBreak;<br>\. | `` \/ ``&NoBreak;<br>\/ |
| 0030 | `` \0 ``&NoBreak;<br>\0 | `` \1 ``&NoBreak;<br>\1 | `` \2 ``&NoBreak;<br>\2 | `` \3 ``&NoBreak;<br>\3 | `` \4 ``&NoBreak;<br>\4 | `` \5 ``&NoBreak;<br>\5 | `` \6 ``&NoBreak;<br>\6 | `` \7 ``&NoBreak;<br>\7 | `` \8 ``&NoBreak;<br>\8 | `` \9 ``&NoBreak;<br>\9 | `` \: ``&NoBreak;<br>\: | `` \; ``&NoBreak;<br>\; | `` \< ``&NoBreak;<br>\< | `` \= ``&NoBreak;<br>\= | `` \> ``&NoBreak;<br>\> | `` \? ``&NoBreak;<br>\? |
| 0040 | `` \@ ``&NoBreak;<br>\@ | `` \A ``&NoBreak;<br>\A | `` \B ``&NoBreak;<br>\B | `` \C ``&NoBreak;<br>\C | `` \D ``&NoBreak;<br>\D | `` \E ``&NoBreak;<br>\E | `` \F ``&NoBreak;<br>\F | `` \G ``&NoBreak;<br>\G | `` \H ``&NoBreak;<br>\H | `` \I ``&NoBreak;<br>\I | `` \J ``&NoBreak;<br>\J | `` \K ``&NoBreak;<br>\K | `` \L ``&NoBreak;<br>\L | `` \M ``&NoBreak;<br>\M | `` \N ``&NoBreak;<br>\N | `` \O ``&NoBreak;<br>\O |
| 0050 | `` \P ``&NoBreak;<br>\P | `` \Q ``&NoBreak;<br>\Q | `` \R ``&NoBreak;<br>\R | `` \S ``&NoBreak;<br>\S | `` \T ``&NoBreak;<br>\T | `` \U ``&NoBreak;<br>\U | `` \V ``&NoBreak;<br>\V | `` \W ``&NoBreak;<br>\W | `` \X ``&NoBreak;<br>\X | `` \Y ``&NoBreak;<br>\Y | `` \Z ``&NoBreak;<br>\Z | `` \[ ``&NoBreak;<br>\[ | `` \\ ``&NoBreak;<br>\\ | `` \] ``&NoBreak;<br>\] | `` \^ ``&NoBreak;<br>\^ | `` \_ ``&NoBreak;<br>\_ |
| 0060 | `` \` ``&NoBreak;<br>\` | `` \a ``&NoBreak;<br>\a | `` \b ``&NoBreak;<br>\b | `` \c ``&NoBreak;<br>\c | `` \d ``&NoBreak;<br>\d | `` \e ``&NoBreak;<br>\e | `` \f ``&NoBreak;<br>\f | `` \g ``&NoBreak;<br>\g | `` \h ``&NoBreak;<br>\h | `` \i ``&NoBreak;<br>\i | `` \j ``&NoBreak;<br>\j | `` \k ``&NoBreak;<br>\k | `` \l ``&NoBreak;<br>\l | `` \m ``&NoBreak;<br>\m | `` \n ``&NoBreak;<br>\n | `` \o ``&NoBreak;<br>\o |
| 0070 | `` \p ``&NoBreak;<br>\p | `` \q ``&NoBreak;<br>\q | `` \r ``&NoBreak;<br>\r | `` \s ``&NoBreak;<br>\s | `` \t ``&NoBreak;<br>\t | `` \u ``&NoBreak;<br>\u | `` \v ``&NoBreak;<br>\v | `` \w ``&NoBreak;<br>\w | `` \x ``&NoBreak;<br>\x | `` \y ``&NoBreak;<br>\y | `` \z ``&NoBreak;<br>\z | `` \{ ``&NoBreak;<br>\{ | `` \| ``&NoBreak;<br>\| | `` \} ``&NoBreak;<br>\} | `` \~ ``&NoBreak;<br>\~ |

なおバックスラッシュエスケープは次の文法要素に対しては作用せず、そのまま出力される。

* [コードブロック]
* [コードスパン]
* [自動リンク]
* [生HTML]

### ハード改行

また行末に`\`を用いると[ハード改行]として機能する。行末が`\`で終わる行には出力に`<br>`が挿入され、HTMLでは改行されて出力する。

## 文例

### ASCII区切り文字のエスケープ

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

太字(`**bold**`)をエスケープする場合は2つ必要になることに注意。1つだけだと斜体と認識される。

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

なお文法上どの文字をどうエスケープすれば認識するかは構文の種類だけでなく実装によっても異なる場合があるため詳しいルールはここには書かない。それよりもターゲット環境のMarkdown実装で実際に確認しながら作業するとよい(多くの場合プレビュー機能を利用できる)。

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

[自動リンク]、[自動リンク拡張]でも(バックスラッシュを含むURLが有効であれば)エスケープが適用されない。

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

その他のケースではバックスラッシュエスケープが効く。以下は仕様書からの要約だが、どれも特殊ケースで通常使うものではないため一覧表示のみとする。

* URL → [Example 318](https://higuma.github.io/github-markdown-guide/gfm/#example-318)
* [リンク]タイトルと[リンク参照定義] → [Example 319](https://higuma.github.io/github-markdown-guide/gfm/#example-319)
* [コードブロック]のinfo文字列 → [Example 320](https://higuma.github.io/github-markdown-guide/gfm/#example-320)

<details>
<summary>上級編: GitHub Markdown実装でのURLの扱い</summary>

拡張機能の追加によりURLに関してはGFMやGitHubのMarkdown実装はCommonMark準拠ではなくなっている。例えばURLを純粋にリンクなしのテキストとして出力しようとして次のように書いたとする。

```markdown
https\:\/\/www\.example\.com
```

これで通常のMarkdown処理実装はテキストとして出力する。しかしGFM仕様ではこれでもバックスラッシュを無視して[自動リンク拡張]として出力する。

> https\:\/\/www\.example\.com

Babelmarkでの比較結果は次の通り。大部分の処理実装は通常テキストとして出力するが、GFMなど一部の実装は[自動リンク拡張]として扱う。

https://babelmark.github.io/?text=https%5C%3A%5C%2F%5C%2Fwww%5C.example%5C.com

> (2022-08-11現在) さらに[GitHub Gist]のMarkdown処理では編集時のPreview表示と最終出力が異なる場合がある(注意)。例えば[次のMarkdowns文](https://gist.github.com/higuma/9fb12dd67597367d15be8bbac1c00c11)を処理させると`https\://...`の部分をプレビューでは通常テキストと判定するが、本処理は[自動リンク拡張]と判定する。
> 
> ```markdown
> \[これはリンクではない、しかしリンク先に注意](https\://www\.example\.com)
> ```
> 
> 本現象は一時的な振る舞いの可能性が高いが記録として残しておく(将来的には修正されるはず)。本例に限らず多くのMarkdown処理実装は(各Webサービスの)目的別にカスタマイズされており、特殊ケースでどうなるかは実際に処理させてみないと分からない。

また実環境チェックも大切だが、それよりもこのような実装依存の可能性が高い記述は最初から回避する自衛策を講じることも重要。幸いにも実用上はこのような例に出くわすことは稀で(上記の例はもちろん意図的に作ったもの)、回避方法は考えれば色々と見つけることができる。

</details>

### ハード改行

もうひとつの用途として行末に用いると[ハード改行]として認識される。その位置に``<br>``を挿入し、改行して表示する。

```markdown
行末で改行(`<br>`を挿入)\
次の行
```

> 行末で改行(`<br>`を挿入)\
> 次の行

------------------------------------------------------------------------

[6 インライン](inlines.md)
← [目次](index.md) →
[6.2 文字参照](character-references.md)

[ASCII区切り文字]: #ASCII区切り文字
[GitHub Gist]: https://gist.github.com/
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[ハード改行]: hard-line-breaks.md
[リンク]: links.md
[リンク参照定義]: link-reference-definitions.md
[打ち消し線]: strikethrough.md
[斜体と太字]: bold-and-italic.md
[自動リンク]: autolinks.md
[自動リンク拡張]: autolinks-extension.md
[生HTML]: raw-html.md
[見出し]: headings.md
[横線]: thematic-breaks.md
