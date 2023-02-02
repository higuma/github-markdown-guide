# HTMLインライン

[コードスパン](code-spans.md)
← [目次](index.md) →
[ブロック](blocks.md)

------------------------------------------------------------------------

標準のMarkdownにはないインライン構文はHTMLの文法を借用して表現する。ただしこの部分はMarkdown処理実装や、それを用いたWebサービスに対する依存性が大きい。ここではGitHubのWebサービスで利用可能なMarkdownのHTMLインラインについて解説する。

> &#x2757;&#xFE0F; **注意**: 本節全体が動作環境に大きく依存する部分で、特にWebサービスに文書をアップロードする場合はそのWebサイトのHTML環境設定により何が使えて何が使えないかは異なる(BabelMarkでは判別困難で、実環境チェックが必要)。本節はGitHubのWeb環境で動作確認できた結果のみ示す。

## IDの設定

GitHub Markdown環境ではHTML要素の`id`属性が機能する。文中の特定の用語にIDを設定する場合は`<span id="...">`を用いるとよい。次は[リスト項目]内の用語に設定する例。

```markdown
- <span id="水平線">水平線</span>
- <span id="見出し">見出し</span>
- <span id="コードブロック">コードブロック</span>
```

> - <span id="水平線">水平線</span>
> - <span id="見出し">見出し</span>
> - <span id="コードブロック">コードブロック</span>

上記出力には実際にIDが設定されており、次のリスト項目をクリックすると確認できる。

* → [`id="水平線"`](#水平線)
* → [`id="見出し"`](#見出し)
* → [`id="コードブロック"`](#コードブロック)

## 改行

[パラグラフ]などの複数行連結可能な構文では行末に[ハード改行]を用いて改行できるが、[表]のセル内部などには使えない。このような場合は[`<br>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/br)を用いるとよい。次はこのテクニックを用いた文例で、本節の後半でこれを利用した一覧表を実際に説明に用いている。

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

## スタイル設定

GitHub Markdown環境では次のインライン要素が有効に機能する。文例と実際の出力付きの一覧表で示す。

| 要素 | `文例`<br>出力 |
| - | - |
| 上付き文字<br>[`<sup>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/sup) | `2<sup>10</sup> = 1024`<br>2<sup>10</sup> = 1024 |
| 下付き文字<br>[`<sub>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/sub) | `H<sub>2</sub>SO<sub>4</sub>`<br>H<sub>2</sub>SO<sub>4</sub> |
| 変数<br>[`<var>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/var) | `<var>y</var> = 2 <var>x</var> + 3`<br><var>y</var> = 2 <var>x</var> + 3 |
| ルビ<br>[`<ruby>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/ruby), [`<rt>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/rt) | `<ruby>倫敦<rt>ロンドン</rt></ruby>`<br><ruby>倫敦<rt>ロンドン</rt></ruby> |
| キー入力<br>[`<kbd>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/kbd) | `Type <kbd>exit</kbd> to quit.`<br>Type <kbd>exit</kbd> to quit. |
| サンプル出力<br>[`<samp>`](https://veloper.mozilla.org/ja/docs/Web/HTML/Element/samp) | `<samp>command not found</samp>`<br><samp>command not found</samp> |
| 行内引用<br>[`<q>`](https://veloper.mozilla.org/ja/docs/Web/HTML/Element/q) | `<q>To be, or not to be, that is the question</q>`<br><q>To be, or not to be, that is the question</q> |

## GitHubで無効な属性・要素

GitHubではMarkdown内のHTML要素に対して[`style`](https://developer.mozilla.org/ja/docs/Web/HTML/Global_attributes/style)属性を無効化している。次の例は大多数のMarkdown処理環境ではテキストを赤色で表示するが、GitHub Markdownでは効果がない。

```markdown
サンプル <span style="color:red">サンプル</span>
```

> サンプル <span style="color:red">サンプル</span>

また次のHTML要素はGitHubのMarkdown環境では効果がない。こちらも一覧表にして実際に出力させたものを示す(出力が通常テキストと同一であることの確認用サンプル)。

| 要素 | `文例`<br>出力 |
| - | - |
| 下線<br>[`<u>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/u) | `サンプル <u>サンプル</u>`<br>サンプル <u>サンプル</u>
| 文字列マーク<br>[`<mark>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/mark) | `サンプル <mark>サンプル</mark>`<br>サンプル <mark>サンプル</mark>
| 小文字<br>[`<small>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/small) | `サンプル <small>サンプル</small>`<br>サンプル <small>サンプル</small>

> &#x2757;&#xFE0F; **注意**: 以上はGitHubの実環境で確認済みの属性・要素のみ(現在も継続調査中)。なおこれらは他のMarkdown実装では機能することが多い。

------------------------------------------------------------------------

[コードスパン](code-spans.md)
← [目次](index.md) →
[ブロック](blocks.md)

[HTMLブロック]: html-block.md
[ハード改行]: paragraphs.md#ハード改行
[パラグラフ]: paragraphs.md
[リスト項目]: lists.md#リスト項目
[表]: tables.md
