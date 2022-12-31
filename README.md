# GitHub Markdown 実践ガイド

[目次](index.md) →
[はじめに](intro.md)

------------------------------------------------------------------------

## 概要

Web標準のドキュメント記述言語は[HTML]だが、HTMLは人間が認識・入力しやすいようにはできていない。そこでWebドキュメントをより簡便に扱うための言語として[Markdown]がある。

[Markdown]では人間がより扱いやすい形式で入力し、Markdown処理実装を用いてHTMLに変換・出力する。この利点から[Markdown]はGitHubを始めとする多くの技術系Webサービスのドキュメント記述言語として採用されている。

ただし[Markdown]は利用するWebサービスにより細かい仕様が異なる。HTMLのような標準仕様書はないが、それに近い存在として[GitHub Flavored Markdown] \(GFM)仕様がある。GitHubではこのGFMに基づき、さらにGitHubのWebサービス用に機能拡張した専用実装を用いている。

本ドキュメントはGitHubの[Markdown]実装を主題材とし、その実践的な記述方法を中心に詳しく解説する。また他のMarkdown実装との違いに関しても取り扱い、可搬性の高いMarkdown文書を記述するにはどうすべきかについて補足説明する。

### レベル

本ドキュメントは主に上級者向けの内容で、[Markdown]に関する中級程度の知識を前提としている。これから学ぶ人や、まだ実際に[Markdown]で文章を書いた経験がないような人は本ドキュメントの前にまず[GitHub docs]などで基本的な書き方を習得し、実際に文書を作成してみるとよい。

> Web検索すれば[Markdown]の学習資料はたくさんある。何でもよいから自分に合いそうな解説を見つけて読めばよい。基本的な文章作成までは割と容易に習得できる。
> 
> > しかし上級向けの資料は少ない。結局自分で作ってしまいこのようなドキュメントになった。

### 構成

まず「[はじめに]」で簡単な[Markdown]の例文とその変換結果を実例で示す。ここは[Markdown]経験者であれば容易に理解できる内容で、ここで本ドキュメント全体で用いる記法(コードリスティング、変換結果、補足説明など)などを説明する。

次は本論に入る前に必要な事前知識として「[文字と行]」で主に用語の定義について説明する。次の「[文法の構造]」では主に[Markdown]の文法構造、特に[インライン]\(文章中に埋め込むもの)と[ブロック]\(業単位で区切られるもの)の違いを中心に説明する。

本編の前半は[インライン]に属する構文(太字、斜体、リンク、コードスパンなど)、後半は[ブロック]に属する構文(パラグラフ、見出し、リスト、表など)を豊富な実例付きで説明する。GitHub実装の[Markdown]をリファレンスとし、他実装との違いについても補足する。

またGitHub実装には一般的な[Markdown]仕様の他に、ID設定やLaTeXを用いた数式など特有の機能を持つ。これらは本編の最後にまとめて説明する。

文書作成には必ずしも必要ない内容や文字コード一覧表などは末尾の[付録]にまとめられている。[Markdown]の成立までの経緯とその発展、GitHub Flavored Markdownについての説明、名前付き文字参照や空白文字の一覧表などがある。

### 処理実装間の互換性

最初に述べた通り[Markdown]には標準仕様書はなく、各々のWebサービスやドキュメント処理アプリで用いられている処理実装はどれもよく似てはいるが細かい仕様が異なる。さらに各処理実装には実用ガイドのような文書はあっても仕様書のような完全なドキュメントを用意しているものはまずない。

> 開発競争の中では機能実現が優先されるため、ドキュメンテーションに割く労力はどうしても不十分になりがちになる側面がある。GitHub実装もGitHub docsの簡単な説明はあるものの、詳細な仕様を記したドキュメントはおそらくない。

そのため利用するWebサービスやアプリで採用している[Markdown]実装の仕様確認には、実際にデータを変換させて比較するのが現実的な方法となる。このためのWebアプリとして**Babelmark**があり、主要[Markdown]処理実装に同じ文書を入力し、変換結果を比較する事ができる。

https://babelmark.github.io/

本ドキュメントでは[Markdown]処理実装の仕様比較を議論する場合にこのBabelmarkを引用して説明を行う。

## 概略目次

- [概要]
- [はじめに]
- [文字と行]
- [文法の構造]
- [インライン]
- [ブロック]
- [GitHub Markdown実装]
- [付録]

## [総目次](index.md#総目次)

------------------------------------------------------------------------

[目次](index.md) →
[はじめに](intro.md)

[HTML]: https://ja.wikipedia.org/wiki/HyperText_Markup_Language
[Markdown]: https://ja.wikipedia.org/wiki/Markdown
[GitHub docs]: https://docs.github.com/ja/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
[GitHub Flavored Markdown]: github-flavored-markdown.md
[GitHub Markdown実装]: github-markdown.md
[はじめに]: intro.md
[インライン]: inlines.md
[ブロック]: blocks.md
[概要]: README.md#概要
[付録]: appendices.md
[文字と行]: characters.md
[文法の構造]: syntax.md
[文字と行]: characters.md
[文法の構造]: syntax.md

## [総目次](index.md#総目次)
