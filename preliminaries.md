# [2 Preliminaries](https://higuma.github.io/github-flabored-markdown/#preliminaries)

[1 Introduction](introduction.md)
← [Table of Contents](index.md) →
[3 Blocks and inlines](blocks-and-inlines.md)

------------------------------------------------------------------------

## [2.1 Characters and lines](https://higuma.github.io/github-flabored-markdown/#characters-and-lines)

まず[Markdown]の世界では文法エラーというものは存在しない。どんな文章でもエラーにはせず、できる限り文書作成者の意図に沿った結果になるように処理して出力する

> (参考) 大昔の[HTML](https://ja.wikipedia.org/wiki/HyperText_Markup_Language)は[RFC](https://ja.wikipedia.org/wiki/Request_for_Comments)で仕様策定されており、これと同じ方針を取っていた(運用は寛容に)。しかしその後[W3C]が厳密な文法の[XHTML](https://ja.wikipedia.org/wiki/Extensible_HyperText_Markup_Language)を強行して一時期大混乱になった(2000年頃)。結局権力を濫用した形の[W3C]は今ではその地位を失い、[WHATWG](https://whatwg.org/)が[HTML仕様](https://html.spec.whatwg.org/multipage/)の策定を進めている。

本節は文字や行などの用語の定義だが、どれもごく一般的な用法で常識の範囲で理解できる(説明略)。もし分からなければ[仕様書本文](https://higuma.github.io/github-flabored-markdown/#characters-and-lines)を読むこと(平易な英文で、何も難しい点はない)。

__補足(重要)__: 前章で説明した通り仕様書本文中のコード例(Examples [1](https://higuma.github.io/github-flabored-markdown/#example-1)-[673](https://higuma.github.io/github-flabored-markdown/#example-673))の記述ではTab(+U0009)は`→`で表す。またコード欄内部のスペース(+U0020)に対してドットが見えるように書式設定を行っていることに注意すること(HTMLソースのCSS部分を読むと`span.space::after { content: "."; ... }`としているのが分かる)。

## [2.2 Tabs](https://higuma.github.io/github-flabored-markdown/#tabs)

文書中のTab文字(U+0009)はスペースに置換されずそのままHTMLへ出力される。ただし[コードブロック](leaf-blocks.md#45-fenced-code-blocks)中や、[リスト](container-blocks.md#54-lists)のようにインデントを認識する文脈ではスペース4つ分として扱われる。

> Examples 1-11まであるが略。今ではTabの積極的な使用は勧められない。

## [2.3 Insecure characters](https://higuma.github.io/github-flabored-markdown/#insecure-characters)

文書中にNUL文字(U+0000)がある場合、セキュリティ上の理由から置換文字(U+FFED)に置き換えられる。

> 詳細不明だがこれを悪用した攻撃方法があり、その対策と推測される。利用する分には知る必要なし。

## 本ガイドの構成

> __重要__: これはGFM仕様書原文に関してではなく、本ガイドのここから先の構成と読み方に関する説明。

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

また[Markdown]は色々な人達が考えた記法の寄せ集めであり、人によって書き方に大きな幅がある。GFMはこれらをできる限り全て受け付けるように仕様が作られているが、これが入門者に対しては敷居が高くなる要因にもなっている。例えば次は全て[区切り](leaf-blocks.md#41-thematic-breaks)(`<hr>`)に変換される。

> ```markdown
> ---
> 
> ****    ****    ****    ****
> 
>    _ _ _ _ _ _ _ _
> ```

変換結果は次の通り。テキストの見かけは全く異なるが同じ結果になる。

> ---
> 
> ****    ****    ****    ****
> 
>    _ _ _ _ _ _ _ _

GFM仕様書はこのような考えられる全てのケースに対しての仕様の正確な記述を目的としている。そのため全体的に(重箱の隅のような)特殊ケースの解説が大部分を占めており、学習用には全く向いていない。

そこで本ドキュメントは[Markdown]ビューアを併用して文書作成作業を行う状況を前提とし、以降の内容の中で現在では利用価値が低いとみなされる仕様に関しては適宜説明を簡略化あるいは省略する。

そしてセクションの最後に2022年現在のベストプラクティスと考えられる記法をまとめとして示す。たとえ各セクションの内容が分からなくても、最後の"Best practice"だけ読んで理解すれば実践的な文書作成に必要な知識が得られるように書かれている。

> ベストプラクティスと言っても強制するものではない。せいぜい「2022年時点のお勧め」程度で、最適な記法は時代が変われば自然と移り変わる。いっそ「今年のベストプラクティスも来年はもうアンチパターン?」程度に考えておくべきで、記法は年月とともに変化する。

また仕様説明の補助として[正規表現]を用いる。`/.../`の形式で記述し、仕様はJavaScriptの[正規表現]と同じとする。

### Tab文字について

> TabキーやTab文字ができた経緯は[Wikipedia](https://ja.wikipedia.org/wiki/タブキー)を参照。元はタイプライターからコンピュータ分野に取り入れた機能だが、アプリケーションにより動作が異なり統一した振る舞いというものはない。多くの場合アプリ側で設定できるようになっている。

Tabを使う限りテキストビューア/エディタ/[Markdown]処理でその表示や出力結果が同一にならない可能性をどうしても排除できない。通常は処理系側にTabの扱いに関する設定があり、それを[Markdown]ソース側から制御することは基本的にできない。

そこでここから先はTabは(どうしても必要な場合を除き)使わないものとする。またTabを用いた文法やそのExampleは原則として解説対象から除外する。

> 筆者は昔CプログラミングでTabを4文字分に設定していたが、10年ほど前からTabの使用をやめスペース派へ移行した。CPU能力が貧弱だった昔はTabの使用によるデータサイズ削減及びコンパイル時間短縮効果が有用だったが、もうそういう時代ではない。

------------------------------------------------------------------------

[1 Introduction](introduction.md)
← [Table of Contents](index.md) →
[3 Blocks and inlines](blocks-and-inlines.md)

[Markdown]: https://ja.wikipedia.org/wiki/Markdown
[W3C]: https://www.w3.org/
[正規表現]: https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
