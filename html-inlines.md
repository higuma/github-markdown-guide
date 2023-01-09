# HTMLインライン

[コードスパン](code-spans.md)
← [目次](index.md) →
[ブロック](blocks.md)

------------------------------------------------------------------------

標準のMarkdown構文にはないインラインアイテムはHTMLの文法を借用して表現する。

------------------------------------------------------------------------

(検討中)

Markdownでは文法解析の際にインラインとブロックでは優先度が異なるため、ブロック扱いのHTMLタグとインラインHTMLタグは分けて説明した方が仕様書では説明はしやすいと思う。

GitHub Flavored Markdown仕様書ではHTMLタグを用いるアイテムのうち、インラインとして用いるものを[**Raw HTML**](https://github.github.com/gfm/#raw-html)、ブロックとして用いるものを[**HTML blocks**](https://github.github.com/gfm/#html-blocks)と呼んでいる。訳すとしたらそれぞれ「生HTML」「HTMLブロック」となるが、これでは用語の一貫性がない。

> そのため本稿では**Raw HTML**の訳語を「HTMLインライン」に変更した経緯がある。

それだけでなくGFM仕様書の記述は混乱しており論理の筋道が通っていない。特に[Disallowed Raw HTML (extension)](https://github.github.com/gfm/#disallowed-raw-html-extension-)はインライン/ブロック共通の内容なので本来であれば手前あるいは末尾(たぶんこっち)に専用項目を設けるべき内容なのに、実際にはインラインの後半部に挿入されている(章立てが全くなっていない)。

GFM仕様書は(おそらく時間的・工数的制約から)CommonMark仕様書に加筆するだけという体裁を取っている。そのため論理的に辻褄が合わない箇所が非常に多い。

これ以上不出来な仕様書に従っているのは時間の無駄なので、ここは構造ごとの変更を検討している。

HTMLタグを用いる構文は実装作成者からすればブロックとインラインは重大な違いだが、Markdownで文書を作成する人から見ればどうだっていいことに過ぎない。ここは利用者目線に立って構造変更したい。

(案として)ブロックとインラインの区別は実装者側から見れば重大な違いだが、利用者からはどうでもいいことに過ぎない。そこで両者はまとめて別扱いにする。章立てを変更して一つ加える。

- ...
- インライン
  - ここにHTMLインラインは入れない
- ブロック
  - ここにHTMLブロックは入れない
- HTMLアイテム
  - ここにインラインとブロック両方をまとめて書く


両者は区別した方が説明はしやすいいと思う。ただし


------------------------------------------------------------------------




が、これでは用語に統一性がない。本解説ではより明解にそれぞれ「HTMLインライン」「HTMLブロック」の表現を用いている。

>




生HTML(raw HTML)はMarkdownの中にHTMLインライン要素を直接入力する方法。通常のMarkdownでは実現できないHTMLの各種機能を利用できるが、実装に対する依存性が大きい。以下GitHubを対象として説明する。

> HTMLブロック要素を用いるケースに関しては[HTMLブロック]を参照。





## ベストプラクティス

生HTMLはMarkdown処理実装(及びそれを用いたWebサイトやWebアプリ等)により使える要素の種類や属性が異なる。GitHubで利用可能なものを下記[文例](#文例)にまとめた。

* [IDの設定](#idの設定)
* [改行](#改行)
* [スタイル設定(上付き、下付き、etc.)](#スタイル設定)

またGitHubのMarkdownでは効果のない属性や要素に関しては[GitHubで無効な属性・要素](#githubで無効な属性・要素)を参照。

## まとめ

Markdown処理実装はHTMLタグを検出すると基本的にそのまま出力する。これを利用してMarkdownに実装されていないHTMLの機能を利用することができる。ただし処理実装や実行環境により使用可能な要素や属性には制限がある。

> 特に[GFM]では安全上などの理由から特定のHTMLタグを検出すると無効化して処理する。詳しくは次の [使用できないHTML要素] を参照。

以下の[文例](#文例)でGitHubのMarkdown環境で利用できるHTML要素及び属性について説明する。

## 文例

> 以下の内容は(2022年)現在GitHub Markdownで使用可能な生HTML機能のまとめ。

### IDの設定

GitHubのMarkdown環境では生HTMLや[HTMLブロック]に用いるHTML要素の`id`属性が機能する。文中の特定の用語にIDを設定する場合は`<span id="...">`を用いるとよい。次は[リストアイテム]内の用語に設定する例。

```markdown
* <span id="横線">横線</span>
* <span id="見出し">見出し</span>
* <span id="コードブロック">コードブロック</span>
```

> * <span id="横線">横線</span>
> * <span id="見出し">見出し</span>
> * <span id="コードブロック">コードブロック</span>

上記出力には実際にIDが設定されており、次のリストアイテムをクリックすると確認できる。

* → [`id="横線"`](#横線)
* → [`id="見出し"`](#見出し)
* → [`id="コードブロック"`](#コードブロック)

### 改行

[パラグラフ]などの複数行連結可能な構文では行末に[ハード改行]を用いて改行できるが、[表]のセル内部などには使えない。このような場合は[`<br>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/br)を用いるとよい。次はこのテクニックを用いた文例(本節の後半で実際に説明に用いる)。

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

### スタイル設定

GitHubのMarkdown環境では次のインライン要素が有効に機能する。文例と実際の出力付きの一覧表で示す。

| 要素 | `文例`<br>出力 |
| - | - |
| 上付き文字<br>[`<sup>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/sup) | `2<sup>10</sup> = 1024`<br>2<sup>10</sup> = 1024 |
| 下付き文字<br>[`<sub>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/sub) | `H<sub>2</sub>SO<sub>4</sub>`<br>H<sub>2</sub>SO<sub>4</sub> |
| 変数<br>[`<var>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/var) | `<var>y</var> = 2 <var>x</var> + 3`<br><var>y</var> = 2 <var>x</var> + 3 |
| ルビ<br>[`<ruby>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/ruby), [`<rt>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/rt) | `<ruby>河豚<rt>ふぐ</rt></ruby>`<br><ruby>河豚<rt>ふぐ</rt></ruby> |
| キー入力<br>[`<kbd>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/kbd) | `Type <kbd>exit</kbd> to quit.`<br>Type <kbd>exit</kbd> to quit. |
| サンプル出力<br>[`<samp>`](https://veloper.mozilla.org/ja/docs/Web/HTML/Element/samp) | `<samp>command not found</samp>`<br><samp>command not found</samp> |
| 行内引用<br>[`<q>`](https://veloper.mozilla.org/ja/docs/Web/HTML/Element/q) | `<q>Isn't this where...we came in?</q>`<br><q>Isn't this where...we came in?</q> |
| 行内引用<br>[`<q>`](https://veloper.mozilla.org/ja/docs/Web/HTML/Element/q) | `<q>To be, or not to be, that is the question</q>`<br><q>To be, or not to be, that is the question</q> |

### GitHubで無効な属性・要素

GitHubではMarkdown内のHTML要素に対して[`style`](https://developer.mozilla.org/ja/docs/Web/HTML/Global_attributes/style)属性を無効化している。次の例は大多数のMarkdown実装ではテキストを赤色で表示するが、GitHub Markdownでは効果がない。

```markdown
サンプル <span style="color:red">サンプル</span>
```

> サンプル <span style="color:red">サンプル</span>

また次のHTML要素はGitHubのMarkdown環境では効果がない。こちらも一覧表にして実際に出力させたものを示す(出力が通常テキストと同一なのを確認)。

| 要素 | `文例`<br>出力 |
| - | - |
| 下線<br>[`<u>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/u) | `サンプル <u>サンプル</u>`<br>サンプル <u>サンプル</u>
| 文字列マーク<br>[`<mark>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/mark) | `サンプル <mark>サンプル</mark>`<br>サンプル <mark>サンプル</mark>
| 小文字<br>[`<small>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/small) | `サンプル <small>サンプル</small>`<br>サンプル <small>サンプル</small>

> 確認済みの属性・要素のみ(その他は調査中)。なおこれらは他のMarkdown実装では機能することが多い。

------------------------------------------------------------------------

[コードスパン](code-spans.md)
← [目次](index.md) →
[ブロック](blocks.md)

[GFM]: introduction.md#11-github-flavored-markdownとは
[HTMLブロック]: html-block.md
[ハード改行]: hard-line-breaks.md
[パラグラフ]: paragraphs.md
[リストアイテム]: list-items.md
[表]: tables.md
[使用できないHTML要素]: disallowed-html-elements.md
