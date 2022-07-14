# [1.Introduction](https://higuma.github.io/github-flabored-markdown/#introduction)

[Table of Contents](index.md) →
[2 Preliminaries](preliminaries.md)

------------------------------------------------------------------------

## [1.1 What is GitHub Flavored Markdown?](https://higuma.github.io/github-flabored-markdown/#what-is-github-flavored-markdown-)

GitHub Flavored Markdown (以下GFM)はGitHub及びGitHub Enterproseで用いられているMarkdown方言。[CommonMark][]をベースとして独自拡張を行ったもので、現在では事実上の標準仕様になっている。

GFMは厳密な[CommonMark][]のsupersetで、オリジナルにない機能は __extensions__ と呼んで区別する。

> GitHubサイトにHTMLレンダリングする際にはセキュリティと一貫性のためのサニタライズ処理が行われる。

## [1.2 What is Markdown?](https://higuma.github.io/github-flabored-markdown/#what-is-markdown-)

Markdownはi(2019年現在)最もポピュラーな軽量マークアップ言語で、多種多様な分野に利用されている。その起源は2004年に遡り、John Gruberによる[最初の仕様](https://daringfireball.net/projects/markdown/syntax)とそのPerl実装が発表されている。

その後(初期仕様にはなかった)脚注や表組など多くの機能が追加されて普及し、それとともにWeb以外の一般文書にも応用されるようになり現在に至っている。

> 後半のAsciiDocとの比較は今では無意味(読むだけ無駄)。また本文中のAsciiDocサイトへのリンクはとうの昔に消滅しており、いかにも危なそうなポップアップが出る別サイトへ誘導されるので注意すること。

## [1.3 Why is a spec needed?](https://higuma.github.io/github-flabored-markdown/#why-is-a-spec-needed-)

初期のMarkdownは仕様に曖昧な点が多数存在していた。その後長年に渡り色々な複数の開発グループにより仕様や実装の改良が行われ、その結果今では多くの方言が生まれ、異なる実装が多数存在する(例えば[Pandoc](https://pandoc.org/)の変換はGFMとは異なる)。

> 本文ではオリジナルMarkdownの文法の曖昧さを14項目も指摘して解説しているが、今はもう読む必要なし。

## [1.4 About this document](https://higuma.github.io/github-flabored-markdown/#about-this-document)

できる限り曖昧さを排除したMarkdown文法を目指して作られたのがこのGFMだが、これでも完璧という訳ではない(作った側もそれは承知しているはず)。問題を指摘している人を見つけたのでリンクを残しておく(参考)。

https://qiita.com/tk0miya/items/6b81e0e4563199037018

ただしGFMは初期実装と比較すれば格段に安定した仕様であり、多くの人がこれで実用上は十分と判断したため現在の事実上の標準を地位を得たものと考えられる(実際昔に比べれば表現力も進歩しているし、おかしな出力結果も少なくなった)。

> 後ろの方にテストや文書生成用のPythonスクリプトに関する文章があるが読まなくていい。ちなみにこれらは次のrepoの中身のことを言っているものと思われる。[CommonMark][]からforkしており、READMEには本仕様書へのリンクも貼られているのでたぶん間違いないと思う。
> 
> https://github.com/github/cmark-gfm/
> 
> ただし[`spec_tests.py`](https://github.com/github/cmark-gfm/blob/master/test/spec_tests.py)というファイルはあるが、`spec.txt`や`tools/makespec.py`は見当たらない。また[Makefile](https://github.com/github/cmark-gfm/blob/master/Makefile)を読むと`test/spec.txt`という記述はあるが、どうも本文の文章と噛み合っていない。今はもう処理方法は変更され、この文章だけが修正されずに残っているものと推測される。

最後の本書の記法に関して一つ注意。TAB文字は`→`で表す。

------------------------------------------------------------------------

[Table of Contents](index.md) →
[2 Preliminaries](preliminaries.md)

[CommonMark]: https://commonmark.org/
