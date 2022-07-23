# [1.Introduction](https://higuma.github.io/github-flabored-markdown/#introduction)


[About this document](README.md)
← [Table of Contents](index.md) →
[2 Preliminaries](preliminaries.md)

------------------------------------------------------------------------

## [1.1 What is GitHub Flavored Markdown?](https://higuma.github.io/github-flabored-markdown/#what-is-github-flavored-markdown-)

GitHub Flavored Markdown (以下 __GFM__)はGitHub及びGitHub Enterproseで用いられている[Markdown]方言。[CommonMark]をベースとして独自拡張を行ったもので、現在では事実上の標準仕様に近い扱いを受けている。

> [CommonMark] (→ [Wiki](https://en.wikipedia.org/wiki/Markdown#Standardization))は[John MacFarlane](John_MacFarlane_(philosopher))を中心に進められている[Markdown]の標準化プロジェクト(→ [仕様書一覧](https://spec.commonmark.org/))。[CommonMark]直系の処理系がHaskell実装の[Pandoc](https://pandoc.org/) (→ [Wiki](https://en.wikipedia.org/wiki/Pandoc))で、[Jupyter Notebook](https://jupyter.org/)などに用いられている。

GFM仕様は厳密な[CommonMark]のsupersetであり、オリジナルにない機能は __extensions__ と呼んで区別する。(2022年)現在のGFM仕様書([Version 0.29-gfm](https://higuma.github.io/github-flabored-markdown/))は[CommonMark仕様書 (Version 0.29)](https://spec.commonmark.org/0.29/)を原本とし、そこから部分的に追加・変更した体裁を取っている。

> [仕様書目次](https://higuma.github.io/github-flabored-markdown/)の中で、色付き背景で末尾に"(extension)"と明記されている項目が該当部。ただし今ではこれらも事実上の標準扱いになっており、例えば [Qiita](https://qiita.com/) や [はてなブログ](https://hatenablog.com/) はこれらの多くを受け付ける。

GitHubサイトにHTMLレンダリングする際、セキュリティと一貫性のためのプリプロセスとサニタライズ処理が行われる。

> ただしGitHub自体もGFM仕様に完全準拠しているわけではなく、独自拡張もあれば逆に未実装部分もある。ただし習得中はまだ考えなくてよい。

## [1.2 What is Markdown?](https://higuma.github.io/github-flabored-markdown/#what-is-markdown-)

[Markdown]は(2022年現在)最もポピュラーな[軽量マークアップ言語]で、多種多様な分野に利用されている。その起源は2004年に遡り、John Gruberによる[最初の仕様](https://daringfireball.net/projects/markdown/syntax)とその[Perl実装](https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip)が発表されている。

> [Markdown]以前にも[軽量マークアップ言語]は多数存在していた。[Markdown]仕様は[AsciiDoc]、[ATX]、[Setext]など当時の既存[軽量マークアップ言語]の影響を受けており、仕様を借用している。今では当時の先行[軽量マークアップ言語]はその役目を終え、[Markdown]に引き継がれている。

その後[Markdown]には(初期仕様にはなかった)脚注や表組みなど多くの機能が追加されて普及し、それとともにWeb以外の一般文書にも応用されるようになり現在に至っている。

> 後半の[AsciiDoc]との比較は今はもう読む必要なし([AsciiDoc]はとうの昔に過去のもの)。本文中のAsciiDocサイトへのリンクもすでに消滅しており、いかにも危なそうなポップアップが出る別サイトへ誘導されるので注意。

## [1.3 Why is a spec needed?](https://higuma.github.io/github-flabored-markdown/#why-is-a-spec-needed-)

初期のMarkdownは仕様に曖昧な点が多数存在していた。その後長年に渡り色々な複数の開発グループにより仕様や実装の改良が行われ、その結果今では多くの方言が生まれ、異なる実装が多数存在する(→ [Wikipedia: Markdown - Variants](https://en.wikipedia.org/wiki/Markdown#Variants))。

GFMはこの点を踏まえ、標準として耐えうる仕様と安定した動作を目指して作られている(→ [README](https://github.com/github/cmark-gfm/blob/master/README.md))。今では単に[Markdown]といえばオリジナル仕様ではなく[CommonMark]以降、特にGFM仕様を指す場合が多い。

> 仕様書本文ではオリジナルMarkdownの文法の曖昧さを14項目も指摘して解説しているが、今はもう読む必要なし。

## [1.4 About this document](https://higuma.github.io/github-flabored-markdown/#about-this-document)

GFMはできる限り曖昧さを排除したMarkdown文法を目指して作られているが完璧という訳ではない。元は色々な人達によって作られた記法の寄せ集めであり、これにより生じる矛盾を可能な限り吸収して寛容でリーズナブルな出力を行うように仕様を調整している。

> 本文のテストや文書生成用のPythonスクリプトに関する文章は読む必要なし。ちなみにこれらは次のrepoの中身のことを言っているものと思われる([CommonMark]からforkしており、READMEには本仕様書へのリンクも貼られているのでまず間違いない)。
> 
> https://github.com/github/cmark-gfm/
> 
> ただし現在は[`spec_tests.py`](https://github.com/github/cmark-gfm/blob/master/test/spec_tests.py)というファイルはあるが、`spec.txt`や`tools/makespec.py`は見当たらない。また[Makefile](https://github.com/github/cmark-gfm/blob/master/Makefile)を読むと`test/spec.txt`という記述はあるものの、本文の内容とは処理が異なる。今ではもうrepo側の処理方法は変更され、仕様書の文章だけが未修正のまま残っているものと推測される。

最後にGFM仕様書の記法に関して一つ注意。コード例内部のTab文字は`→`で表す。

> (参考) GFM及びそのGitHub実装に関して問題を指摘しているドキュメントを見つけたのでリンクを残しておく。特にGFM仕様と実際のGitHubサイトへの出力の振る舞いの違いは本投稿の後半部に書かれている(有用)。
> 
> https://qiita.com/tk0miya/items/6b81e0e4563199037018
> 
> ただしGitHubの中の人達はこういうことは十分承知しているはずで、我々利用者は重箱の隅を突くことよりも、必ず意図通りに出力するような明解な記法の習得に専念すべきだろう。

------------------------------------------------------------------------

[About this document](README.md)
← [Table of Contents](index.md) →
[2 Preliminaries](preliminaries.md)

[AsciiDoc]: https://en.wikipedia.org/wiki/AsciiDoc
[ATX]: https://en.wikipedia.org/wiki/Aaron_Swartz#atx
[CommonMark]: https://commonmark.org/
[Markdown]: https://ja.wikipedia.org/wiki/Markdown
[Setext]: https://en.wikipedia.org/wiki/Setext
[軽量マークアップ言語]: https://ja.wikipedia.org/wiki/軽量マークアップ言語
