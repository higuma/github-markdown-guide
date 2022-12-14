# [6.13 ソフト改行](https://higuma.github.io/github-markdown-guide/gfm/#soft-line-breaks)

[6.12 ハード改行](hard-line-breaks.md)
← [目次](index.md) →
[6.14 テキストコンテント](textual-content.md)

------------------------------------------------------------------------

> **旧版(完成後削除)**

[インライン]構文中では空ではない連続行は基本的に継続扱いとして処理する。そして行末にスペースなしまたは1個の場合はソフト改行(soft line breaks)としてHTMLレンダリングの際にスペース区切りで連結して表示する。

## ベストプラクティス

英語など単語をスペースで区切る言語のドキュメントを書く場合は有用。またソースプログラムのドキュメントコメントをMarkdownで記述する場合はよく用いられる。

しかし日本語など単語をスペースで区切らない言語のドキュメントでは非推奨。間に半角スペースが入ってしまうので、同じパラグラフの文章は改行せず1行に連結すること。

## まとめ

[空行]ではない連続する[インライン]構文行に対し、次の条件を満たす場合をソフト改行([softbreak])と判定する。

* 最初の行の行末が次の条件を満たす
    * スペース2個以上ではない
    * バックスラッシュ(`\`)でもない
* 次の行が[空行]ではなく、また別のブロック構文でもない

次のように処理する。

* 次の行の先頭に空白があれば除去
* 連続する2行をHTMLレンダリングの際にスペース1個を挟んで連結

## 文例

### 基本例

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

### 次行の空白除去

ソフト改行で連結される次行の先頭にスペースがある場合は除去される。

```markdown
行末スペースなし(ソフト改行)→
    行末スペース1個(ソフト改行)→ 
        連結される行
```

> 行末スペースなし(ソフト改行)→
>     行末スペース1個(ソフト改行)→ 
>         連結される行

### 次行の構文認識

構文解析は[インライン]よりブロックを優先するため、次行が[空行]の場合は以降を次のブロック構文と認識する。

```markdown
この行はソフト改行
次は空行(ソフト改行ではない)

次のパラグラフ
```

> この行はソフト改行
> 次は空行(ソフト改行ではない)
> 
> 次のパラグラフ

直後の他のブロック構文がある場合も同様。

``````markdown
この行はソフト改行
この行はソフト改行ではない(パラグラフ終了)
### 見出し
```

この行はソフト改行
この行はソフト改行ではない(パラグラフ終了)
```
コードブロック
```

この行はソフト改行
この行はソフト改行ではない(パラグラフ終了)
- リスト
``````

> この行はソフト改行
> この行はソフト改行ではない(パラグラフ終了)
> ### 見出し
> 
> この行はソフト改行
> この行はソフト改行ではない(パラグラフ終了)
> ```
> コードブロック
> ```
> 
> この行はソフト改行
> この行はソフト改行ではない(パラグラフ終了)
> - リスト

### 書式設定

[斜体と太字]、[打ち消し線]、[生HTML]による書式設定はソフト改行で連結される上下の行にまたがっていてもよい。

```markdown
Plain _italic
**bold
italic
~~also
strikethrough~~**_ plain.

<u>下線付き
これも下線付き</u>
```

> Plain _italic
> **bold
> italic
> ~~also
> strikethrough~~**_ plain.
> 
> <u>下線付き
> これも下線付き</u>

[コードスパン]も同様。

```markdown
`code
span`
```

> `code
> span`

### 日本語の扱い

ただしソフト改行は日本語の文書と相性が悪い。次は40文字(全角20文字)でソフト改行した例。

```markdown
ゆく河の流れは絶えずして、しかももとの水
にあらず。淀みに浮かぶうたかたは、かつ消
えかつ結びて、久しくとどまりたるためしな
し。
```

これでは改行した部分に本来日本語の文章では用いられない半角スペースが挿入されてしまう。

> ゆく河の流れは絶えずして、しかももとの水
> にあらず。淀みに浮かぶうたかたは、かつ消
> えかつ結びて、久しくとどまりたるためしな
> し。

日本語にはソフト改行は使わず、編集時は1行にまとめて書くこと。

```markdown
ゆく河の流れは絶えずして、しかももとの水にあらず。淀みに浮かぶうたかたは、かつ消えかつ結びて、久しくとどまりたるためしなし。
```

> ゆく河の流れは絶えずして、しかももとの水にあらず。淀みに浮かぶうたかたは、かつ消えかつ結びて、久しくとどまりたるためしなし。

<details>
<summary>(参考) GitHub Webサイト上でのソフト改行の振る舞い</summary>

> 以下の内容は2022年9月時点のもの。将来は修正される可能性がある。

GitHub Markdown実装の仕様も上記の通りだが、GitHubのWeb画面上の編集中のPreview表示では本来ソフト改行が適用される行も改行して表示する(おそらく不具合)。編集を終了するとちゃんと連結されて表示する。

</details>

------------------------------------------------------------------------

[6.12 ハード改行](hard-line-breaks.md)
← [目次](index.md) →
[6.14 テキストコンテント](textual-content.md)

[softbreak]: https://higuma.github.io/github-markdown-guide/gfm/#softbreak
[インライン]: inlines.md
[コードスパン]: code-spans.md
[ハード改行]: hard-line-breaks.md
[打ち消し線]: strikethrough.md
[空行]: blank-lines.md
[斜体と太字]: bold-and-italic.md
[生HTML]: raw-html.md
