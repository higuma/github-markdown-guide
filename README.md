# GitHub Markdown 実践ガイド

[目次](index.md) →
[はじめに](intro.md)

------------------------------------------------------------------------

## 概要

Web標準のドキュメント記述言語は[HTML]だが、現在のHTMLは人間が直接認識・入力することを想定した作りではない。そこでWebドキュメントをより簡便に扱うための言語として[Markdown]がある。

[Markdown]では人間がより扱いやすいテキスト形式で入力し、Markdown処理実装を用いてHTMLに変換・出力する。この利点から[Markdown]はGitHubを始めとする多くの技術系Webサービスのドキュメント記述言語として採用されている。

[Markdown]は寛容な言語仕様を持ち、どんなテキスト文書もブラウザで表示できるようにHTMLに変換して出力する(基本的にエラーを発生するという概念はない)。仕様は一般的な文書向けで、特に技術文書の作成によく用いられる。Webアプリには向いていない。

また[Markdown]は利用するWebサービスにより詳細仕様が異なる。[Markdown]にはHTMLのような標準仕様書はないが、それに近い存在として[GitHub Flavored Markdown] \(GFM)仕様がある。GitHubではこのGFMをベースとして、さらにGitHubのWebサービス用に機能拡張した専用実装を用いている。

本解説はGitHubの[Markdown]実装を主な題材とし、その実践的な記述方法を中心に詳しく解説する。また[Markdown]には詳細仕様の異なる別実装(方言)が多数存在する点を踏まえ、これらの実装の違いに関しても取り扱い、可搬性の高いMarkdown文書を記述するにはどうすべきかについて説明する。

### レベル

本解説は主に上級者向けの内容で、[Markdown]に関する中級程度の知識を前提としている。これから学ぶ人や、まだ実際に[Markdown]で文章を書いた経験がないような人は本解説の前にまず[GitHub docs]などで基本的な書き方を習得し、実際に文書を作成してみるとよい。

> Web検索すれば[Markdown]の学習資料はたくさんある。何でもよいから自分に合いそうな解説を見つけて読めばよい。基本的な文章作成までは割と容易に習得できる。
> 
> > しかし上級向けの資料は見たことがない。結局こういうものを自分で作ってしまった。

### 構成

まず「[はじめに]」で簡単な[Markdown]の例文とその変換結果を実例で示す。ここは[Markdown]経験者であれば容易に理解できる内容で、これを用いて本解説全体で用いる記法(コードリスティング、変換結果、補足説明など)を説明する。

次は本論に入る前に必要な事前知識として「[文字と行]」で主に用語の定義について説明する。次の「[Markdownの構文]」では主に[Markdown]の文法構造、特に[インライン]\(文章中に埋め込むもの)と[ブロック]\(行単位で区切られるもの)の違いを中心に説明する。

本編の前半は[インライン]に属する構文(太字、斜体、リンク、コードスパンなど)、後半は[ブロック]に属する構文(パラグラフ、見出し、リスト、表など)を豊富な実例付きで説明する。GitHub実装の[Markdown]をリファレンスとし、他実装との違いについても補足する。

またGitHub実装には一般的な[Markdown]仕様の他に、見出しのID自動設定やLaTeXを用いた数式など特有の機能を持つ。これらは本編の最後にまとめて説明する。

文書作成には必ずしも必要ない内容や文字コード一覧表などは末尾の[付録]にまとめられている。[Markdown]の成立までの経緯とその発展、[GitHub Flavored Markdown]についての説明、名前付き文字参照や空白文字の一覧表などがある。

### 処理実装間の互換性

最初に述べた通り[Markdown]には標準仕様書はなく、各々のWebサービスやドキュメント処理アプリで用いられている処理実装はどれもよく似てはいるが細かい仕様が異なる。さらに各処理実装には実用ガイドのような文書はあっても仕様書のようなドキュメントを完備しているものはまずない。

> 開発競争の中では十分なドキュメンテーションよりも機能実現の方が優先される(やむを得ない)。GitHub実装もGitHub docsの簡単な説明はあるが、詳細仕様を記したドキュメントは見当たらない。もしあったとしても開発者向けで、利用者向けにまとめられたものは期待できない。

そのため現行のWebサービスやアプリで採用している[Markdown]実装の仕様を確認するためには実際にデータを変換させて比較するしかない。このためのWebアプリとして**Babelmark**があり、主要[Markdown]処理実装に同じ文書を入力し、変換結果を比較する事ができる。

https://babelmark.github.io/

本解説では[Markdown]処理実装の仕様比較を議論する場合にこのBabelmarkを適宜引用して説明を行う。

## 概略目次

- [概要]
- [はじめに]
- [文字と行]
- [Markdownの構文]
- [インライン]
- [ブロック]
- [GitHub Markdown環境]
- [付録]

## [総目次](index.md#総目次)

------------------------------------------------------------------------

[目次](index.md) →
[はじめに](intro.md)

[HTML]: https://ja.wikipedia.org/wiki/HyperText_Markup_Language
[Markdown]: https://ja.wikipedia.org/wiki/Markdown
[GitHub docs]: https://docs.github.com/ja/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
[GitHub Flavored Markdown]: github-flavored-markdown.md
[GitHub Markdown環境]: github-markdown.md
[はじめに]: intro.md
[インライン]: inlines.md
[ブロック]: blocks.md
[概要]: README.md#概要
[付録]: appendices.md
[文字と行]: characters.md
[Markdownの構文]: syntax.md
[文字と行]: characters.md
[Markdownの構文]: syntax.md
