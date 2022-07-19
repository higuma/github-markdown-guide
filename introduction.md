# [1.Introduction](https://higuma.github.io/github-flabored-markdown/#introduction)

[Table of Contents](index.md) →
[2 Preliminaries](preliminaries.md)

------------------------------------------------------------------------

## [1.1 What is GitHub Flavored Markdown?](https://higuma.github.io/github-flabored-markdown/#what-is-github-flavored-markdown-)

GitHub Flavored Markdown (以下GFM)はGitHub及びGitHub Enterproseで用いられている[Markdown]方言。[CommonMark]をベースとして独自拡張を行ったもので、現在では事実上の標準仕様に近い扱いを受けている。

GFMは厳密な[CommonMark]のsupersetであり、オリジナルにない機能は __extensions__ と呼んで区別する。

> [目次](https://higuma.github.io/github-flabored-markdown/)の中で、色付き背景で末尾に"(extension)"と明記されている項目が該当部。

GitHubサイトにHTMLレンダリングする際にはセキュリティと一貫性のためのサニタライズ処理が行われる。

## [1.2 What is Markdown?](https://higuma.github.io/github-flabored-markdown/#what-is-markdown-)

[Markdown]は(2019年現在)最もポピュラーな[軽量マークアップ言語]で、多種多様な分野に利用されている。その起源は2004年に遡り、John Gruberによる[最初の仕様](https://daringfireball.net/projects/markdown/syntax)とその[Perl実装](https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip)が発表されている。

> [Markdown]以前にも[軽量マークアップ言語]は多数存在していた。[Markdown]仕様は[AsciiDoc]、[ATX]、[Setext]など当時の既存[軽量マークアップ言語]の影響を受けており、仕様を借用している。

その後(初期仕様にはなかった)脚注や表組みなど多くの機能が追加されて普及し、それとともにWeb以外の一般文書にも応用されるようになり現在に至っている。

> 後半の[AsciiDoc]との比較は今では無意味(読むだけ無駄)。また本文中のAsciiDocサイトへのリンクはとうの昔に消滅しており、いかにも危なそうなポップアップが出る別サイトへ誘導されるので注意すること。

## [1.3 Why is a spec needed?](https://higuma.github.io/github-flabored-markdown/#why-is-a-spec-needed-)

初期のMarkdownは仕様に曖昧な点が多数存在していた。その後長年に渡り色々な複数の開発グループにより仕様や実装の改良が行われ、その結果今では多くの方言が生まれ、異なる実装が多数存在する(→ [Wikipedia: Markdown - Variants](https://en.wikipedia.org/wiki/Markdown#Variants))。

> 本文ではオリジナルMarkdownの文法の曖昧さを14項目も指摘して解説しているが、今はもう読む必要なし。

GFMはこの点を踏まえ、標準として耐えうる仕様と安定した動作を目指して作られている(→ [README](https://github.com/github/cmark-gfm/blob/master/README.md))。

## [1.4 About this document](https://higuma.github.io/github-flabored-markdown/#about-this-document)

GFMはできる限り曖昧さを排除したMarkdown文法を目指して作られてはいるが、これでも完璧という訳ではない(作った側もそれは承知しているはず)。問題を指摘している人を見つけたのでリンクを残しておく(参考)。

https://qiita.com/tk0miya/items/6b81e0e4563199037018

ただしGFMは初期実装と比較すれば格段に安定した仕様であり、多くの人がこれで実用上は十分と判断して現在の事実上の標準的地位を得たものと考えられる(実際昔に比べれば表現力も格段に進歩し、おかしな出力結果も少なくなった)。

> 後半部のテストや文書生成用のPythonスクリプトに関する文章は読まなくていい。ちなみにこれらは次のrepoの中身のことを言っているものと思われる([CommonMark]からforkしており、READMEには本仕様書へのリンクも貼られているのでたぶん間違いない)。
> 
> https://github.com/github/cmark-gfm/
> 
> ただし[`spec_tests.py`](https://github.com/github/cmark-gfm/blob/master/test/spec_tests.py)というファイルはあるが、`spec.txt`や`tools/makespec.py`は見当たらない。また[Makefile](https://github.com/github/cmark-gfm/blob/master/Makefile)を読むと`test/spec.txt`という記述はあるが、どうも本文の文章と噛み合わない。今はもう処理方法は変更され、この文章だけが修正されずに残っているものと推測される。

最後に仕様書の記法に関して一つ注意。Tab文字は`→`で表す。

------------------------------------------------------------------------

[Table of Contents](index.md) →
[2 Preliminaries](preliminaries.md)

[Markdown]: https://ja.wikipedia.org/wiki/Markdown
[CommonMark]: https://commonmark.org/
[軽量マークアップ言語]: https://ja.wikipedia.org/wiki/軽量マークアップ言語
[AsciiDoc]: https://en.wikipedia.org/wiki/AsciiDoc
[ATX]: https://en.wikipedia.org/wiki/Aaron_Swartz#atx
[Setext]: https://en.wikipedia.org/wiki/Setext
