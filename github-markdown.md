# GitHub Markdown環境

[HTMLブロック]
← [目次] →
[付録]

------------------------------------------------------------------------

実はGitHubのMarkdown実装はGFM完全準拠ではなく、独自拡張仕様もあれば、逆にGFMと異なる動作や未実装仕様も存在する。

## [見出し]へのID設定

GitHub Markdownでは[見出し]に対して次のルールでIDを自動的に割り振る。

1. 見出し文のテキストを抽出して次の変換を行う
    * スペースを`-`に変換
    * `-`以外の[ASCII句読文字]を除去
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
3. `-`以外のASCII句読文字を除去 → `GitHub-Markdownとは`
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
2. `-`以外のASCII句読文字を除去 → `Foo`
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
2. `-`以外のASCII句読文字を除去 → `FOO`
3. アルファベットを小文字に変換 → `foo`
4. 上と重複するため連番を追加 → `foo-1`
</details>

> よく知られている仕様だが、これが書かれたGitHubの公式ドキュメントはどこを探しても見当たらない。なおGitHub以外の実装もこれと同じ仕様を採用しているものが数多い。

## 数式

LaTeX形式の数式記述を受け付ける。

## 脚注

TODO

## 絵文字

GitHubのMarkdown環境では`:...:`の書式で絵文字を[インライン]入力できる。

```markdown
:+1: :-1: :smile: :cry:
```

> :+1: :-1: :smile: :cry:

GitHubで使える絵文字の一覧は次を参照。

https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md

Unicodeに対応しているものだけではなく独自GitHubのこれらは対応するPNG画像と組になっている。

https://github.com/higuma/github-emoji-list/blob/main/README.md

<details>
<summary>取得方法</summary>

一覧はGitHub REST APIで取得できる。方法は次を参照(要GitHub token)。データはJSON形式。

https://docs.github.com/ja/rest/emojis

より単純に次のURLにアクセスしても取得可能(token不要)。

https://api.github.com/emojis

</details>

### Unicode文字の絵文字変換

さらに絵文字に対応するUnicode文字はテキスト文中で自動的に絵文字に変換される。次の文例のように直接入力/コード入力のどちらでもよい(同一出力)。

```markdown
☀ ☁ ☂ ☃

&#x2600; &#x2601; &#x2602; &#x2603;
```

> ☀ ☁ ☂ ☃
> 
> &#x2600; &#x2601; &#x2602; &#x2603;

ただし絵文字の自動変換は[コードブロック]と[コードスパン]の中には適用されない。

``````markdown
```markdown
☀ ☁ ☂ ☃
```

`☀ ☁ ☂ ☃`
``````

> ```markdown
> ☀ ☁ ☂ ☃
> ```
> 
> `☀ ☁ ☂ ☃`

該当する文字コードは次を参照。

https://en.wikipedia.org/wiki/Emoji#In_Unicode

> ただしU+00A9(&copy;)とU+00AE(&reg;)は対象から外して通常文字として出力する(この2つはUnicodeができる前からある文字で、絵文字化すると不都合を生じる)。

しかしこの仕様は時に問題を生じることがある。(2022年現在)GitHubでは絵文字と対応しているUnicode文字は(&copy;と&reg;を除き)通常文字として出力できない(`\↔`などと書いても効果はなく \↔ と表示する)。特に次のような文字が本文中では強制的に絵文字変換されることに注意(文字コードはリンク先を参照)。

* 矢印:
[`↔`↔](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2194),
[`↕`↕](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2195),
[`↖`↖](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2196),
[`↗`↗](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2197),
[`↘`↘](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2198),
[`↙`↙](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2199),
[`↩`↩](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#21A9),
[`↪`↪](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#21AA),
[`➡`➡](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#27A1),
[`⤴`⤴](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2934),
[`⤵`⤵](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2935),
[`⬅`⬅](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2B05),
[`⬆`⬆](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2B06),
[`⬇`⬇](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2B07)
* 操作シンボル:
[`⏏`⏏](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#21CF),
[`▶`▶](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#25B6),
[`◀`◀](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#25C0)
* 天気シンボル
[`☀`☀](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2600),
[`☁`☁](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2601),
[`☂`☂](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2602),
[`☃`☃](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2603),
[`⛈`⛈](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#26C8)
* 性別シンボル:
[`♀`♀](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2640),
[`♂`♂](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2642)
* 星座記号:
[`♈`♈](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2648),
[`♉`♉](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2649),
[`♊`♊](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#264A),
[`♋`♋](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#264B),
[`♌`♌](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#264C),
[`♍`♍](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#264D),
[`♎`♎](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#264E),
[`♏`♏](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#264F),
[`♐`♐](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2650),
[`♑`♑](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2651),
[`♒`♒](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2652),
[`♓`♓](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2653)
* カードマーク:
[`♠`♠](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2660),
[`♣`♣](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2613),
[`♥`♥](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2615),
[`♦`♦](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2616)
* その他:
[`✂`✂](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2702),
[`✈`✈](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2708),
[`✌`✌](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#270C),
[`✍`✍](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#270D),
[`✏`✏](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#270F),
[`✒`✒](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2712),
[`✔`✔](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2714),
[`✖`✖](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2716),
[`✝`✝](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#271D),
[`✡`✡](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2721),
[`✳`✳](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2733),
[`✴`✴](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2734),
[`❄`❄](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2744),
[`❇`❇](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2747),
[`❣`❣](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2763),
[`❤`❤](https://github.com/higuma/markdown-unicode-check/blob/main/2000.md#2764)

## GitHubサイト特有の機能

### CSSの色表現

Issues/Pull requests/Discussionsでは[コードスパン]中にCSSの色表現(例: `rgb(80, 120, 240)`)を記述するとカラーサンプル付きで表示する。これはGitHub repoでは機能しないのでgistのコメントとして実例を作成した。次の(本文ではなくその下の)コメント欄を見ると効果を確認できる。

https://gist.github.com/higuma/80cff0982f9f7e2a267b33cad20f984a











## GFM準拠チェック


> ここからTODO: 現実のGitHubサイトはGFM仕様に完全準拠しているわけではなく、独自拡張もあれば逆に未実装部分もある。ただし習得中はまだ考えなくてよい。
> 
> > (補足: これはここではなく、Appendix Bとかに回した方が思う) この点に関しては次のドキュメントが詳しい。特に後半部の[GFMとGitHub実装の違い](https://qiita.com/tk0miya/items/6b81e0e4563199037018#githubcom-の動作と合致していない)や[GitHub独自拡張の解説](https://qiita.com/tk0miya/items/6b81e0e4563199037018#gfm-に記載されていない-githubcom-独自のマークアップが存在する)は要チェック。
> > 
> > https://qiita.com/tk0miya/items/6b81e0e4563199037018

------------------------------------------------------------------------

[HTMLブロック] ← [目次] →
[付録 - Markdownの歴史]

[HTMLブロック]: html-blocks.md
[目次]: index.md
[付録]: appendices.md

[ASCII句読文字]: backslash-escapes.md#ASCII句読文字
[インライン]: inlines.md
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[折りたたみ]: html-blocks.md#折りたたみ
[見出し]: thematic-breaks.md
