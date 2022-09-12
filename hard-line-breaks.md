# [6.12 ハード改行](https://higuma.github.io/github-markdown-guide/gfm/#hard-line-breaks)

[6.11 使用できないHTML要素](disallowed-html-elements.md)
← [目次](index.md) →
[6.13 ソフト改行](soft-line-breaks.md)

------------------------------------------------------------------------

## まとめ

インライン構文の行末が次のいずれかで終わる場合はハード改行と判定し、行末のスペースまたはバックスラッシュを除去してから`<br>`を挿入し改行する。

* スペース2個以上
* バックスラッシュ(`\`)

```markdown
行末スペース2個 →  
行末スペース10個 →          
行末バックスラッシュ → \
次の行
```

> 行末スペース2個 →  
> 行末スペース10個 →          
> 行末バックスラッシュ → \
> 次の行

## 文例

ハード改行の次行の先頭にスペースがある場合は除去される。

```markdown
行末スペース2個 →  
   行末スペース10個 →          
       行末バックスラッシュ → \
           次の行
```

> 行末スペース2個 →  
>    行末スペース10個 →          
>        行末バックスラッシュ → \
>            次の行

構文解析はインラインよりブロックを優先するため、次の行が[空行]の場合は以降を次のブロック構文と認識する。次の例では2行目がハード改行ではないため行末の`\`が除去されずに表示される。

```markdown
ハード改行\
次は空行(ハード改行ではない)\

次のパラグラフ
```

> ハード改行\
> 次は空行(ハード改行ではない)\
> 
> 次のパラグラフ

[斜体と太字]、[打ち消し線]の間にハード改行を挿入してよい。

```markdown
Plain _italic\
**bold\
italic\
~~also\
strikethrough~~**_ plain.
```

> Plain _italic\
> **bold\
> italic\
> ~~also\
> strikethrough~~**_ plain.

ただし[コードスパン]には効かず、単に行連結する。

```markdown
`This line ends with two spaces →  
rest of code span`

`This line ends with a backslash → \
rest of code span`
```

> `This line ends with two spaces →  
> rest of code span`
> 
> `This line ends with a backslash → \
> rest of code span`

------------------------------------------------------------------------

[6.11 使用できないHTML要素](disallowed-html-elements.md)
← [目次](index.md) →
[6.13 ソフト改行](soft-line-breaks.md)

[コードスパン]: code-spans.md
[ソフト改行]: soft-line-breaks.md
[打ち消し線]: strikethrough.md
[空行]: blank-lines.md
[斜体と太字]: bold-and-italic.md
