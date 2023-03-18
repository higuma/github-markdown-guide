# GitHub特有の機能

[その他の機能]
← [目次] →
[付録]

------------------------------------------------------------------------

最後にGitHub独自の機能から主なものを説明する。

## 名前付き絵文字

GitHub Markdown環境には昔から独自の絵文字文化があり、`:name:`の書式で絵文字を[インライン]入力できる。

```markdown
:+1: :-1: :smile: :cry:
```

> :+1: :-1: :smile: :cry:

GitHubで使える絵文字名の一覧は次を参照。

https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md

これらの絵文字は対応するPNG画像と組になっている。PNG画像も含めた一覧は次の通り。

https://github.com/higuma/github-emoji-list/blob/main/README.md

> <details>
> <summary><strong>&#x2714;&#xFE0F; 取得方法</strong></summary>
> 
> 一覧はGitHub REST APIで取得できる。方法は次を参照(要GitHub token)。データはJSON形式。
> 
> https://docs.github.com/ja/rest/emojis
> 
> より単純に次のURLにアクセスしても取得可能(token不要)。
> 
> https://api.github.com/emojis
> </details>

> <details>
> <summary><strong>&#x2714;&#xFE0F; GitHub独自の絵文字</strong></summary>
> 
> 大部分はUnicodeの絵文字に対応しているが、中にはGitHub独自の絵文字もある。例えば次のような絵文字はGitHub独自で、Unicodeには対応する文字はない。
> 
> - `:atom:` → :atom:
> - `:electron:` → :electron:
> - `:octocat:` → :octocat:
> 
> 一覧は次を参照。
> 
> https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md#github-custom-emoji
> </details>

## レスポンシブル画像

GitHubサイトでは [Settings - Appearance](https://github.com/settings/appearance) で画面テーマを設定できる。明色系(Light...)と暗色系(Dark...)の両方があるが、テーマ変更により画像を切り替える場合は`<picture>`を用い、`media`属性を設定する。実例を示す。

```markdown
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="img/1d.svg">
  <source media="(prefers-color-scheme: light)" srcset="img/1l.svg">
  <img alt="Responsible 7 segment digit 1" src="img/1.svg">
</picture>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="img/2d.svg">
  <source media="(prefers-color-scheme: light)" srcset="img/2l.svg">
  <img alt="Responsible 7 segment digit 2" src="img/2.svg">
</picture>
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="img/3d.svg">
  <source media="(prefers-color-scheme: light)" srcset="img/3l.svg">
  <img alt="Responsible 7 segment digit 3" src="img/3.svg">
</picture>
```

> <picture>
>   <source media="(prefers-color-scheme: dark)" srcset="img/1d.svg">
>   <source media="(prefers-color-scheme: light)" srcset="img/1l.svg">
>   <img alt="Responsible 7 segment digit 1" src="img/1.svg">
> </picture>
> <picture>
>   <source media="(prefers-color-scheme: dark)" srcset="img/2d.svg">
>   <source media="(prefers-color-scheme: light)" srcset="img/2l.svg">
>   <img alt="Responsible 7 segment digit 2" src="img/2.svg">
> </picture>
> <picture>
>   <source media="(prefers-color-scheme: dark)" srcset="img/3d.svg">
>   <source media="(prefers-color-scheme: light)" srcset="img/3l.svg">
>   <img alt="Responsible 7 segment digit 3" src="img/3.svg">
> </picture>

## GitHubサイト専用の機能

最後にリポジトリではなくGitHubのWebアプリ機能の一部としてのみ使える機能を紹介する。

### 拡張自動リンクの認識

GitHubサイト内の書き込み機能では[拡張自動リンク]としてURLやメールアドレスだけでなく、イシューやプルリクエストの番号(`#番号`または`GH-番号`)の形式を認識する。またコミットのSHAハッシュ値も認識する。

| 種類 | 書式(文例)|
| - | - |
| イシュー,プルリクエスト,ディスカッションの番号 | `#123` |
| イシュー,プルリクエスト,ディスカッションの番号 | `GH-123` |
| コミットのSHAハッシュ | `03bb1b9b960e8dbe97010fcdea4a2b754996f843` |

より詳しくは[GitHub Docs](https://docs.github.com/ja/get-started/writing-on-github/working-with-advanced-formatting/autolinked-references-and-urls)を参照。

### CSS形式の色表現

Issues, Pull requestsやGISTのコメントなどGitHub Webサイトからの書き込み時に使える機能の一つとして、[コードスパン]中にCSS形式の色表現(例: `rgb(80, 120, 240)`)を記述するとカラーサンプル付きで表示する。ただし対応は完璧ではなく、使える形式とそうでないものがある。

この機能はリポジトリ内データに対しては機能しないため、ここに書いても効果を確認できない。そこで結果はIssuesを用いて示す。次のリンク先を参照。

[Issues#1 - CSS形式の色表現(確認用サンプル)](https://github.com/higuma/github-markdown-guide/issues/1)

> <details>
> <summary><strong>サンプルコード</strong></summary>
> 
> 上記Issuesで用いたコードは次の通り。
> 
> ```markdown
> | 表現 | 文例 | 判定 |
> | - | - | - |
> | RGB(16進3桁) | `#48A` | 無効 |
> | RGB(16進6桁大文字) | `#44CCAA` | 有効 |
> | RGB(16進6桁小文字) | `#eeaacc` | 有効 |
> | rgb関数(0-255) | `rgb(0, 240, 170)` | 有効 |
> | rgb関数(%) | `rgb(70%, 40%, 20%)` | 無効 |
> | rgba関数(0-255) | `rgba(120, 240, 170, 0.7)` | 有効 |
> | rgba関数(%) | `rgba(70%, 40%, 20%, 70%)` | 無効 |
> | hsl | `hsl(120, 70%, 50%)` | 有効 |
> | hsla | `hsl(120, 70%, 50%, 0.7)` | 有効 |
> | hsla(%) | `hsl(120, 70%, 50%, 70%)` | 無効 |
> | lch | `lch(29.2345% 44.2 27)` | 無効 |
> ```
> </details>

------------------------------------------------------------------------

[その他の機能]
← [目次] →
[付録]

[info文字列]: code-blocks.md#info文字列
[インライン]: inlines.md
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[その他の機能]: other-features.md
[拡張自動リンク]: links.md#拡張自動リンク
[目次]: index.md#github-specific
[付録]: appendices.md
