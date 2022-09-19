# [6.10 生HTML](https://higuma.github.io/github-markdown-guide/gfm/#raw-html)

[6.9 自動リンク (GFM拡張)](autolinks-extension.md)
← [目次](index.md) →
[6.11 使用できないHTML要素](disallowed-html-elements.md)

------------------------------------------------------------------------

インライン構文としてHTML要素を直接入力する。

> ブロック構文として扱う場合は[HTMLブロック]を参照。

## ベストプラクティス

Markdown処理実装(及びそれを用いたWebサイトやWebアプリ等)により使える要素の種類や属性は異なる。GitHubのMarkdown環境で使える実用的な文例を下記[文例](#文例)にまとめたので参考にするとよい。

## まとめ

Markdown処理実装はHTMLタグを検出すると基本的にそのまま出力する。これを利用してMarkdownに実装されていないHTMLの機能をある程度利用することができる。だたし処理環境により使える機能は異なる。

> また一部の要素に対しては安全上などの理由から特定のタグを検出すると無効化して処理する。詳しくは次の [使用できないHTML要素] を参照。

## 文例

以下は現在(2022年)GitHubで使用可能な生HTML機能を実用性重視でまとめたもの。

### IDの設定

特定の用語にIDを設定する場合は`<span id="...">`を用いるとよい。次は[リストアイテム]内の用語に設定する例。

```markdown
* <span id="横線">横線</span>
* <span id="見出し">見出し</span>
* <span id="コードブロック">コードブロック</span>
```

> * <span id="横線">横線</span>
> * <span id="見出し">見出し</span>
> * <span id="コードブロック">コードブロック</span>

上記出力には実際にIDが設定されており、次で確認できる(下記項目をクリックすると移動)。

* → [`id="横線"`](#横線)
* → [`id="見出し"`](#見出し)
* → [`id="コードブロック"`](#コードブロック)

### 改行

[パラグラフ]などの複数行連結可能な構文では行末に[ハード改行]を用いて改行できるが、[表]のセル内部などには使えない。このような場合は[`<br>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/br)を用いるとよい。

```markdown
| 書式 | `文例`<br>出力 |
| - | - |
| 斜体 | `*italic*`<br>*italic* |
| 太字 | `**bold**`<br>**bold** |
| 斜体太字 | `***bold italic***`<br>***bold italic*** |
| 打ち消し線 | `~~strkethrough~~`<br> ~~strkethrough~~ |
```

> | 書式 | `文例`<br>出力 |
> | - | - |
> | 斜体 | `*italic*`<br>*italic* |
> | 太字 | `**bold**`<br>**bold** |
> | 斜体太字 | `***bold italic***`<br>***bold italic*** |
> | 打ち消し線 | `~~strkethrough~~`<br> ~~strkethrough~~ |

### 書式設定

GitHubではMarkdown文書中の次のインライン要素が有効に機能する。文例と実際の出力付きの一覧表で示す。

| 要素 | `文例`<br>出力 |
| - | - |
| 上付き文字<br>[`<sup>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/sup) | `2<sup>10</sup> = 1024`<br>2<sup>10</sup> = 1024 |
| 下付き文字<br>[`<sub>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/sub) | `H<sub>2</sub>SO<sub>4</sub>`<br>H<sub>2</sub>SO<sub>4</sub> |
| 変数<br>[`<var>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/var) | `<var>y</var> = 2 <var>x</var> + 3`<br><var>y</var> = 2 <var>x</var> + 3 |
| ルビ<br>[`<ruby>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/ruby), [`<rt>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/rt) | `<ruby>河豚<rt>ふぐ</rt></ruby>`<br><ruby>河豚<rt>ふぐ</rt></ruby> |
| キー入力<br>[`<kbd>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/kbd) | `Type <kbd>exit</kbd>.`<br>Type <kbd>exit</kbd>. |
| サンプル出力<br>[`<samp>`](https://veloper.mozilla.org/ja/docs/Web/HTML/Element/samp) | `<samp>command not found</samp>`<br><samp>command not found</samp> |
| 行内引用<br>[`<q>`](https://veloper.mozilla.org/ja/docs/Web/HTML/Element/q) | `<q>Isn't this where...we came in?</q>`<br><q>Isn't this where...we came in?</q> |

### 無効な属性・要素

GitHubではMarkdown内のHTML要素に対して[`style`](https://developer.mozilla.org/ja/docs/Web/HTML/Global_attributes/style)属性を無効化している。次の例は大多数のMarkdown実装はテキストを赤色で表示するが、GitHub Markdownでは効果がない。

```markdown
<span style="color:red">テスト</span>
```

> <span style="color:red">テスト</span>

次のHTML要素はGitHub Markdownでは効果がない。こちらも一覧表にして実際に出力させたものを示す(出力が通常テキストと変わらないのを確認すること)。

| 要素 | `文例`<br>出力 |
| - | - |
| 下線<br>[`<u>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/u) | `サンプル <u>サンプル</u>`<br>サンプル <u>サンプル</u>
| 文字列マーク<br>[`<mark>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/mark) | `サンプル <mark>サンプル</mark>`<br>サンプル <mark>サンプル</mark>
| 小文字<br>[`<small>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/small) | `サンプル <small>サンプル</small>`<br>サンプル <small>サンプル</small>

> 確認済みの属性・要素のみ(その他は調査中)。なおこれらは他の大多数のMarkdown実装では効果を持つ。

------------------------------------------------------------------------

[6.9 自動リンク (GFM拡張)](autolinks-extension.md)
← [目次](index.md) →
[6.11 使用できないHTML要素](disallowed-html-elements.md)

[HTMLブロック]: html-block.md
[ハード改行]: hard-line-breaks.md
[パラグラフ]: paragraphs.md
[リストアイテム]: list-items.md
[表]: tables.md
[使用できないHTML要素]: disallowed-html-elements.md
