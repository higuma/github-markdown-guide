## [6.14 テキストコンテント](https://higuma.github.io/github-markdown-guide/gfm/#textual-content)

[6.13 ソフト改行](soft-line-breaks.md)
← [目次](index.md) →
[GitHub Markdown実装](github-markdown.md)

------------------------------------------------------------------------

## まとめ

インライン構文中で、今まで説明したアイテム([6.1](backslash-escapes.md) .. [6.13](soft-line-breaks.md))に該当しない文字(列)はそのまま文字として出力する。

## 文例

Markdownの構文書式に該当しない文字はそのまま出力する。

```markdown
abcde αβγδε あいうえお
```

> abcde αβγδε あいうえお

ただし連続するスペースは1個に縮約される。次の文例はGFM仕様書の[Example 673](https://higuma.github.io/github-markdown-guide/gfm/#example-673)からのもの。

```markdown
Multiple     spaces
```

> Multiple     spaces

> GFM仕様書本文には(縮約せず)「文字通りに保持される」(preserved verbatim)と書かれているが、実際にはほぼ全てのMarkdown処理実装がMarkdown側で縮約処理を行う。Babelmarkで確認した結果は次の通り。
> 
> https://babelmark.github.io/?text=Multiple+++++spaces
> 
> > ちなみに仮に仕様書記述通りMarkdown側で縮約を行わなくてもHTMLのレンダリング処理で縮約されるため同じ表示になる。

### 絵文字

現在のUnicodeには絵文字が組み込まれており、対応する環境で様々な絵文字表示機能を利用できる。GitHubも早くから対応しており、絵文字を使うことができる。

> GitHubの絵文字にはUnicode仕様の他に独自機能もある。Unicode仕様はここで説明し、独自機能は[GitHub Markdown実装](github-markdown.md)の[絵文字](github-markdown#絵文字)で説明する。

#### Unicode絵文字

Unicodeで絵文字表現が可能な文字の一覧表は次を参照(英語版Wikipedia)。

https://en.wikipedia.org/wiki/Emoji#In_Unicode

これらは大きく分けて次の2種類がある。

* 通常テキストと共通コード - 例: `©` (U+00A9)
* 絵文字専用コード - 例 `😀` (U+1F600)

絵文字専用コードは常に絵文字を表示するが、通常テキストとコードが共通の場合はタイプ文字と絵文字のどちらを優先するかは表示環境によって異なる。

#### 異体字セレクタ

テキスト/絵文字共通コードで、表示環境がテキスト/絵文字両方の表示に対応している場合は異体字セレクタを用いてどちらを表示するか指定できる。詳しくは次を参照(英語版Wikipedia)。テキストと絵文字の切り替えにはVS15(U+FE0E, テキスト指定)とVS16(U+FE0F, 絵文字指定)を用いる。

https://en.wikipedia.org/wiki/Variation_Selectors_(Unicode_block)

実際の例を示す。文字コードに続けてVS15/16を指定する。U+00A9(`©`)は通常テキスト表示される例、またU+ 

| コード値<br>コードテキスト | デフォルト<br>(表示環境に依存) | VS15<br>(テキスト指定) | VS16<br>(絵文字指定) |
| :-: | :-: | :-: | :-: |
| U+00A9<br>`©` | `&#x00A9;`<br>&#x00A9; | `&#x00A9;&#xFE0E;`<br>&#x00A9;&#xFE0E; | `&#x00A9;&#xFE0E;`<br>&#x00A9;&#xFE0F; |
| U+2600<br>`☀` | `&#x2600;`<br>&#x2600; | `&#x2600;&#xFE0E;`<br>&#x2600;&#xFE0E; | `&#x2600;&#xFE0E;`<br>&#x2600;&#xFE0F; |
| U+1F3B5<br>`🎵︎` | `&#x1F3B5;`<br>&#x1F3B5; | `&#x1F3B5;&#xFE0E;`<br>&#x1F3B5;&#xFE0E; | `&#x1F3B5;&#xFE0E;`<br>&#x1F3B5;&#xFE0F; |







フェイスとそのどちらを出力する。

以下はGitHubの絵文字対応環境での動作について説明する。






------------------------------------------------------------------------

[6.13 ソフト改行](soft-line-breaks.md)
← [目次](index.md) →
[GitHub Markdown実装](github-markdown.md)
