# [2 Preliminaries](https://higuma.github.io/github-flabored-markdown/#preliminaries)

[1 Introduction](introduction.md)
← [Table of Contents](index.md) →
[3 Blocks and inlines](blocks-and-inlines.md)

------------------------------------------------------------------------

## [2.1 Characters and lines](https://higuma.github.io/github-flabored-markdown/#characters-and-lines)

まず[Markdown]の世界では文法エラーというものは存在しない。変な作りの文章でもできるだけ作成者の意図に沿った結果になるように出力する(大昔HTMLが[RFC](https://ja.wikipedia.org/wiki/Request_for_Comments)で仕様策定されていた頃のような方針)。

後半は用語の定義だが、どれもごく一般的な用法で常識の範囲で理解できる(説明略)。もし分からなければ[仕様書本文](https://higuma.github.io/github-flabored-markdown/#characters-and-lines)を読むこと。

__補足(重要)__: 仕様書本文中のコード例(Examples [1](https://higuma.github.io/github-flabored-markdown/#example-1)-[673](https://higuma.github.io/github-flabored-markdown/#example-673))の記述ではTab(+U0009)は`→`で表す。またコード欄内部のスペース(+U0020)に対してドットが見えるように書式設定を行っていることに注意すること(CSSを読むと`span.space::after { content: "."; ... }`としているのが分かる)。

## [2.2 Tabs](https://higuma.github.io/github-flabored-markdown/#tabs)

文書中のTab文字(U+0009)はスペースに置換されずそのままHTMLへ出力される。ただし`<pre>`や`<code>`のようにタブストップが適用される状況では空白4つ分として扱われる。

> Example 1-11まであるが略。今ではTabの積極的な使用は勧められない。

## [2.3 Insecure characters](https://higuma.github.io/github-flabored-markdown/#insecure-characters)

文書中にNUL文字(U+0000)がある場合、セキュリティ上の理由から置換文字(U+FFED)に置き換えられる。

## How to read this tutorial

> __重要__: これはGFM仕様書原文に関してではなく、本ドキュメントのここから先の構成と読み方に関する説明。

[Markdown]が最初に作られた頃はコンソール上(`less`コマンド等)やテキストエディタ上での文書としての認識性(読みやすさ)が重要視されていた。例として当時の見出し行(`<h2>`)の典型的な表現方法を2つ示す。これらはテキスト形式で出力した場合の装飾的効果を優先した記法を用いている。

> ```markdown
> ## Example heading ##
> 
> Example heading
> ---------------
> ```

GFMではどちらも使用可能で、同一のHTMLを出力する、

> ## Example heading ##
> 
> Example heading
> ---------------

しかし今ではこのような需要は減り、代わりにテキストエディタと並行して[Markdown]ビューアを立ち上げ、テキストエディタ入力に対して変換結果をリアルタイムで確認しながら作業できるようになった。その結果テキスト文書としての装飾記法は今では逆に無駄なものになりつつある。

また[Markdown]は多種多様な人達が考えた記法の寄せ集めであり、人によって書き方に大きな幅がある。これに対してGFMはできるだけ全てを受け付けるように仕様が作られているが、これが入門者に対しては敷居が高くなる要因にもなっている。

そこで本ドキュメントは[Markdown]ビューアを併用して作業することを前提とし、4-6章の内容の中で現在では利用価値が低いとみなされる仕様に関しては適宜説明を簡略化あるいは省略する。そしてセクションの最後に2022年現在のベストプラクティスと考えられる記法をまとめとして示す。

> もちろん強制するものではない。せいぜい「2022年時点のお勧め」程度で、ベストプラクティスは時代が変われば自然と移り変わる。いっそ「今年のベストプラクティスだって来年はもうアンチパターン?」くらいに考えておくべきで、記法は年月とともに変化する。

また仕様説明の補助として[正規表現]を用いる。`/.../`の形式で記述し、仕様はJavaScriptの[正規表現]と同じとする。

### Do not use tabs

> TabキーやTab文字ができた経緯は[Wikipedia](https://ja.wikipedia.org/wiki/タブキー)を参照。元はタイプライターからコンピュータ分野に取り入れた機能だが、アプリケーションにより動作が異なり統一した振る舞いというものはない。多くの場合アプリ側で設定できるようになっている。

Tabを使う限りテキストビューア/エディタ/[Markdown]処理でその表示や出力結果が同一にならない可能性をどうしても排除できない。通常は処理系側にTabの扱いに関する設定があり、それを[Markdown]ソース側から制御することは基本的にできない。

そこでここから先はTabは(どうしても必要な場合を除き)使わないものとする。またTabを用いた文法やそのExampleは原則として解説対象から除外する。

> 筆者は昔CプログラミングでTabを4文字分に設定していたが、10年ほど前からTabの使用をやめスペース派へ移行した。CPU能力が貧弱だった昔はTabの使用によるデータサイズ削減及びコンパイル時間短縮効果が有用だったが、もうそういう時代ではない。

------------------------------------------------------------------------

[1 Introduction](introduction.md)
← [Table of Contents](index.md) →
[3 Blocks and inlines](blocks-and-inlines.md)

[Markdown]: https://ja.wikipedia.org/wiki/Markdown
[正規表現]: https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
