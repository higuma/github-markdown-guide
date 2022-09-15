# GitHub Markdown実装

[6.14 テキストコンテント](textual-content.md)
← [目次](index.md) →
[付録: A parsing strategy](appendix-a-parsing-strategy.md)

------------------------------------------------------------------------

実はGitHubのMarkdown実装はGFM完全準拠ではなく、独自拡張仕様もあれば、逆にGFMと異なる動作や未実装仕様も存在する。

## [見出し]へのID設定

GitHub Markdownでは[見出し]に対して次のルールでIDを自動的に割り振る。

1. 見出し文のテキストを抽出して次の変換を行う
    * スペースを`-`に変換
    * `-`以外の[ASCII区切り文字]を除去
    * アルファベットを全て小文字に変換
    * その他の文字(日本語文字を含む)は無変換
2. IDに重複が生じた場合は次のように処理
    * 最初はそのまま(例: `foo`)
    * 2番目は`-1`を追加(`foo-1`)
    * 3番目以降も同様に連番を振る(`foo-2`, `foo-3`, ...)


実例を示す。

```markdown
### [GitHub Markdown](#)とは?
```

> ### [GitHub Markdown](#)とは?

→ [`id="github-markdownとは"`](#github-markdownとは)

<details>
<summary>変換手順</summary>

1. テキストを抽出(リンク情報は除去) → `GitHub Markdownとは?`
2. スペースを`-`に変換 → `GitHub-Markdownとは?`
3. `-`以外のASCII区切り文字を除去 → `GitHub-Markdownとは`
4. アルファベットを小文字に変換 → `github-markdownとは`
</details>

```markdown
### *F*,o<sup>o</sup>!
```

> ### *F*,o<sup>o</sup>!

→ [`id="foo"`](#foo)

<details>
<summary>変換手順</summary>

1. テキストを抽出(書式設定は除去) → `F,oo!`
2. `-`以外のASCII区切り文字を除去 → `Foo`
3. アルファベットを小文字に変換 → `foo`
</details>

```markdown
#### F=OO
```

> #### F=O/O

→ [`id="foo-1"`](#foo-1)

<details>
<summary>変換手順</summary>

1. テキストを抽出 → `F=O/O`
2. `-`以外のASCII区切り文字を除去 → `FOO`
3. アルファベットを小文字に変換 → `foo`
4. 上と重複するため連番を追加 → `foo-1`
</details>

> よく知られている仕様だが、これが書かれたGitHubの公式ドキュメントはどこを探しても見当たらない。なおGitHub以外の実装もこれと同じ仕様を採用しているものが数多い。

## GitHub独自機能

GitHubのMarkdown実装はGitHubサイト運用で継続的に手が加えられており、今ではGFM仕様にはない独自機能が多数存在する。

* 数式
* 脚注
* 絵文字

日々変化する性質のものなので、

### 数式

LaTeX形式の数式記述を受け付ける。

### 脚注


### 絵文字





## GFM準拠チェック


> ここからTODO: 現実のGitHubサイトはGFM仕様に完全準拠しているわけではなく、独自拡張もあれば逆に未実装部分もある。ただし習得中はまだ考えなくてよい。
> 
> > (補足: これはここではなく、Appendix Bとかに回した方が思う) この点に関しては次のドキュメントが詳しい。特に後半部の[GFMとGitHub実装の違い](https://qiita.com/tk0miya/items/6b81e0e4563199037018#githubcom-の動作と合致していない)や[GitHub独自拡張の解説](https://qiita.com/tk0miya/items/6b81e0e4563199037018#gfm-に記載されていない-githubcom-独自のマークアップが存在する)は要チェック。
> > 
> > https://qiita.com/tk0miya/items/6b81e0e4563199037018
> > 
> > またGitHubにpushしたMarkdown出力では見出し要素に対してIDが自動的に割り振られる。これもTODO。規則はだいたい分かっているが、明記された公式ドキュメントはどうやらない模様。本ドキュメントのどこかにきちんとまとめておきたい。これもAppendixとかの方がいいと思う。

------------------------------------------------------------------------

[6.14 テキストコンテント](textual-content.md)
← [目次](index.md) →
[付録: A parsing strategy](appendix-a-parsing-strategy.md)

[見出し]: thematic-breaks.md
[ASCII区切り文字]: backslash-escapes.md#ASCII区切り文字
