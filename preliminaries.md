# [2 Preliminaries](https://higuma.github.io/github-flabored-markdown/#preliminaries)

[1 Introduction](introduction.md)
← [Table of contents](index.md) →
[3 Blocks and inlines](blocks-and-inlines.md)

------------------------------------------------------------------------

## [2.1 Characters and lines](https://higuma.github.io/github-flabored-markdown/#characters-and-lines)

本節の仕様書原文は文字や行などの用語の定義だが、どれもごく一般的な用法で常識の範囲で理解できる(説明略)。もし分からなければ[GFM仕様書本文](https://higuma.github.io/github-flabored-markdown/#characters-and-lines)を読むこと(平易な英文で、何も難しい点はない)。

__補足(重要)__: 前章で説明した通りGFM仕様書本文中のコード例(Examples [1](https://higuma.github.io/github-flabored-markdown/#example-1)-[673](https://higuma.github.io/github-flabored-markdown/#example-673))の記述ではタブ(+U0009)は`→`で表す。またコード欄内部のスペース(+U0020)に対してドットが見えるように書式設定を行っていることに注意すること(HTMLソースのCSS部分を読むと`span.space::after { content: "."; ... }`としているのが分かる)。

## [2.2 Tabs](https://higuma.github.io/github-flabored-markdown/#tabs)

文書中のタブ(U+0009)はスペースに置換されずそのままHTMLへ出力される。ただし[コードブロック](fenced-code-blocks.md)中や、[リスト](lists.md)のようにインデントを認識する文脈ではスペース4つ分として扱われる。

> Examples 1-11まであるが略。今ではタブの積極的な使用は勧められない。

## [2.3 Insecure characters](https://higuma.github.io/github-flabored-markdown/#insecure-characters)

文書中にNUL文字(U+0000)がある場合、セキュリティ上の理由から置換文字(U+FFED)に置き換えられる。

> 詳細不明だがこれを悪用した攻撃方法があり、その対策と推測される。特に知る必要なし。

## 本ガイドの構成

### 背景

[Markdown]が最初に作られた頃はコンソール上(`less`コマンド等)やテキストエディタ上での文書としての認識性(読みやすさ)が重要視されていた。例として当時の見出し行(`<h2>`)の典型的な表現方法を2種類示す。これらはテキスト形式で出力した場合の装飾的効果を優先した記法を用いている。

> 以下の記法は見れば大体の見当は付くと思う。もし分からなければ本節後半の [コード例の表現方法](#コード例の表現方法) を参照。

```markdown
## Example heading ##

Example heading
---------------
```

GFMではどちらも使用可能で、同一のHTMLを出力する。

> ## Example heading ##
> 
> Example heading
> ---------------

しかし今ではこのような需要は減り、代わりにテキストエディタと並行して[Markdown]ビューアを立ち上げ、変換結果を確認しながら作業するようになった。またWebページ上で編集する場合はプレビュー表示と比較しながら作業できるものが多い。その結果テキスト文書としての装飾記法は今では逆に不要なものになりつつある。

また[Markdown]は色々な人達が考えた記法の寄せ集めであり、人によって書き方に大きな幅がある。GFMはこれらをできる限り全て受け付けるように仕様が作られているが、これが入門者に対して敷居が高い要因にもなっている。例えば次は全て[区切り](thematic-breaks.md)(`<hr>`)に変換される。

```markdown
---

****    ****    ****    ****

   _ _ _ _ _ _ _ _
```

変換結果は次の通り。テキストの見かけはまるで異なるが全て同一出力になる。

> ---
> 
> ****    ****    ****    ****
> 
>    _ _ _ _ _ _ _ _

GFM仕様書はこのような考えられる全てのケースに対する仕様の正確な記述を目的としており、(文書作成者用ではなく)処理実装の作成者向けに書かれている。そのため全体的に(重箱の隅のような)特殊ケースの解説が大部分を占めており、学習用には全く向いていない。

> [HTML Living standard](https://html.spec.whatwg.org/multipage/index.html)の大部分はブラウザベンダー用の内容で、一般のHTML文書作成者には理解が難しいのと理屈は同じ。

### 本ガイドの方針

> ここはTODO

前に述べた通りMarkdown処理は絶対にエラーを出さない。


色々な解説書は

...

そこで本ガイドは実装の違いや細かい動作をいちいち解説するのではなく、どのように書けば確実に文書作成者の意図通りに文法認識してもらえるかという点を最重要項目とする。

またMarkdown処理実装は

現実のMarkdown実装はGFMをベースとしてはいるが、全て少しずつ異なる点も記述が必要。

最終的なリファレンスはGFM仕様書ではなく、現実のGitHub処理実装とするという点も書く。


### 各セクションの構成

本ガイドはMarkdownビューアやWebアプリを利用して文書作成作業を行う状況を前提とし、各セクションの冒頭に2022年現在のお勧め記法を __Best practice__ として示す。各セクションの詳細解説が分からなくても、Best practiceだけ読んで理解すれば実践的な文書作成知識が得られるように書かれている。

> 初めて読む時は「Best practiceだけ先に一気読み」がお勧め。なおベストプラクティスと言っても強制ではなくあくまで現時点のお勧め記法という程度。いっそ __今のベストプラクティスだって来年はもうアンチパターンかも?__ くらいに考えておくべき。最適な記法は年月と共に移り変わる。

> ここから先TODO

詳細解説はその後の __Details__ に記述する。ただしBest practiceに用いられている表現の説明を最優先し、些末な詳細仕様は適宜説明を簡略化あるいは省略する。それよりも自分が表現したい文書をどのように書けばMarkdown処理実装が自分の意図通りにHTMLに変換してくれるかという点に焦点を絞る。

また仕様説明の補助として[正規表現]を用いる。`/.../`の形式で記述し、仕様はJavaScriptの[正規表現]と同じとする。

### タブ文字の扱い

> キーボードの`Tab`キーや文字コードのタブ(U+0009)が作られた経緯は[Wikipedia](https://ja.wikipedia.org/wiki/タブキー)を参照。元はタイプライターからコンピュータ分野に取り入れた機能だが、アプリケーションにより動作が異なり統一した振る舞いというものはない。多くの場合アプリ側の設定により動作できるようになっている。

タブ文字(U+0009)を使う限りテキストビューア・エディタ・[Markdown]などの処理でその表示や出力結果に違いを生じる可能性をどうしても排除できない。通常は処理系側にタブの扱いに関する設定があり、それを[Markdown]ソース側から制御することは基本的にできない。

そこで本ガイドではタブは(説明にどうしても必要な場合を除き)使わないものとする。またタブを用いた文法やその文例は原則として解説対象から除外する。

> 筆者は昔Cプログラミングでタブを4文字分に設定していたが、10年ほど前からタブの使用をやめスペース派へ移行した。CPU能力が貧弱だった昔はタブの使用によるデータサイズ削減及びコンパイル時間短縮効果が有用だったが、今はもうそういう時代ではない。

### コード例の表現方法

コード例は次のように[フェンスドコードブロック](fenced-code-blocks.md)を使って表現する。

```markdown
* Item 1
    * Item 1-1
    * Item 1-2
* Item 2
* Item 3
```

対応する出力例の表示は次のように[引用](block-quotes.md)で囲んで本文記述と区別する。

> * Item 1
>     * Item 1-1
>     * Item 1-2
> * Item 2
> * Item 3

### 公開方法

本ガイドはそれ自体がGFMで記述されており、GitHubサイトのMarkdown処理実装を通じて公開している。

------------------------------------------------------------------------

[1 Introduction](introduction.md)
← [Table of contents](index.md) →
[3 Blocks and inlines](blocks-and-inlines.md)

[Markdown]: https://ja.wikipedia.org/wiki/Markdown
[正規表現]: https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
