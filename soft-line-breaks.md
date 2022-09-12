# [6.13 ソフト改行](https://higuma.github.io/github-markdown-guide/gfm/#soft-line-breaks)

[6.12 ハード改行](hard-line-breaks.md)
← [目次](index.md) →
[6.14 テキストコンテント](textual-content.md)

------------------------------------------------------------------------

## まとめ

インライン構文の行末が`\`以外で、かつスペース1個以内の場合はソフト改行([softbreak])と判定し、(もしあれば)行末スペースを除去して出力する。そして最終的にHTML側のレンダリング処理でスペース1個を挟み次行に連結して表示される。2個以上は[ハード改行]として改行する(`<br>`を挿入)。

次の文例は1行目は行末スペースなし、2行目は1個(ここまでソフト改行)、3行目は2個(ハード改行)。

```markdown
行末スペースなし(ソフト改行)→
行末スペース1個(ソフト改行)→ 
行末スペース2個(ハード改行)→  
次の行
```

> 行末スペースなし(ソフト改行)→
> 行末スペース1個(ソフト改行)→ 
> 行末スペース2個(ハード改行)→  
> 次の行

## 文例

ソフト改行で連結される次行の先頭にスペースがある場合は除去される。

```markdown
行末スペースなし(ソフト改行)→
    行末スペース1個(ソフト改行)→ 
        連結される行
```

> 行末スペースなし(ソフト改行)→
>     行末スペース1個(ソフト改行)→ 
>         連結される行

構文解析はインラインよりブロックを優先するため、次の行が[空行]の場合は以降を次のブロック構文と認識する。

```markdown
ソフト改行
次は空行(ソフト改行ではない)

次のパラグラフ
```

> ソフト改行
> 次は空行(ソフト改行ではない)
> 
> 次のパラグラフ

[斜体と太字]、[打ち消し線]はソフト改行で連結される上下の行にまたがっていてもよい。

```markdown
Plain _italic
**bold
italic
~~also
strikethrough~~**_ plain.
```

> Plain _italic
> **bold
> italic
> ~~also
> strikethrough~~**_ plain.


[コードスパン]も同様。

```markdown
`code
span`
```

> `code
> span`

<details>
<summary>GitHub Webサイト上でのソフト改行の振る舞い</summary>

> 以下の内容は2022年9月時点のもの。将来は修正される可能性がある。

GitHub Markdown実装の仕様も上記の通りだが、GitHubのWeb画面上の編集中のPreview表示ではソフト改行が適用される行末を改行して表示する(おそらく不具合)。編集を終了するとちゃんと連結されて表示する。

</details>

------------------------------------------------------------------------

[6.12 ハード改行](hard-line-breaks.md)
← [目次](index.md) →
[6.14 テキストコンテント](textual-content.md)

[softbreak]: https://higuma.github.io/github-markdown-guide/gfm/#softbreak
[コードスパン]: code-spans.md
[ハード改行]: hard-line-breaks.md
[打ち消し線]: strikethrough.md
[空行]: blank-lines.md
[斜体と太字]: bold-and-italic.md
