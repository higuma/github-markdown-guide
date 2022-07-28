# [1.Introduction](https://higuma.github.io/github-flabored-markdown/#introduction)


[About this document](README.md)
← [Table of contents](index.md) →
[2 Preliminaries](preliminaries.md)

------------------------------------------------------------------------

本章は [HTML] → [軽量マークアップ言語] → [Markdown] → [CommonMark] → GitHub Flavored Markdown (__GFM__)へと続く歴史的経緯の解説。はじめに[HTML]から[Markdown]までの簡単な序論、その後はGFM仕様書と順番を入れ替えて1.2 → 1.1 → 1.3 → 1.4 の順に解説する。

> 読者は[HTML]に関する中級程度の知識があるものとする。

## Markdownの成立まで

[HTML]以前のユーザーインターフェースはテキスト形式が主流で、Unix系OSの[manページ]をはじめとする電子文書の多くはテキスト形式で作成・閲覧していた。

その後[HTML]と[ウェブブラウザ]の普及に伴い、電子文書にも徐々に[HTML]が普及していった。[HTML]は従来のテキスト形式にはない豊富な表現力を持つ。しかしタグを用いる独特の文法が複雑で、簡単に言えば[HTML]は人間には「読みにくい」「書きにくい」等の問題がある。

現在でも[HTML]文書の作成は(直接あるいは間接的に)テキストエディタを使う場合が多く、テキストエディタ上での認識性と入力の容易さが作業効率に大きな影響を与える。そこで文書入力は人間が扱いやすい形式で行い、それを[HTML]に変換するツールが考えられるようになった。

その手法のひとつが[軽量マークアップ言語]で、最初は一般用([Setext]など)やソフトウエア用([POD]など)のフォーマットツール(出力先はテキスト、[PDF]、書籍など)に[HTML]出力機能を加えたものが利用されるようになった。後に有用性が認められ後発仕様も多数作られた([MediaWiki], [AsciiDoc]など)。

> (参考) 主要な[軽量マークアップ言語]とその機能比較、成立時期は次の一覧表を参照。
> 
> <https://en.wikipedia.org/wiki/Lightweight_markup_language#Comparison_of_language_features>

## [1.2 What is Markdown?](https://higuma.github.io/github-flabored-markdown/#what-is-markdown-)

[軽量マークアップ言語]としては後発の[Markdown]は2004年に[John Gruber](https://en.wikipedia.org/wiki/John_Gruber)による[最初の仕様](https://daringfireball.net/projects/markdown/syntax)とその[Perl実装](https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip)が発表された。[Markdown]は独自仕様だけでなく[ATX]や[Setext]など当時の既存言語の仕様も借用して組み合わせ、人間に対する認識性と豊富な表現力の両立を目指した。

> Gruber版[Markdown]の詳しい解説は以前まとめているので興味のある人は次を参照。
> 
> https://github.com/higuma/markdown_cheat_sheet
> 
> > なお後半部にGFMの解説もあるが内容が古い(GFMが[CommonMark]を取り入れるようになる前)。今はもう役に立たないので本解説を読むこと。

その後は徐々に支持を得て普及し、それとともに[表組み]などの機能が追加されるようになった。さらにはHTML以外の目的(Webアプリ, [PDF], [epub], etc.)にも応用されるようになり、現在では最もよく用いられる[軽量マークアップ言語]としての地位を獲得している。

なお長年に渡り色々な開発グループにより仕様や実装の改良が行われており、その結果今では多くの方言が生まれ、仕様が異なる実装が多数存在する(→ [Wikipedia: Markdown - Variants](https://en.wikipedia.org/wiki/Markdown#Variants))。

### [CommonMark]

[CommonMark] (→ [Wiki](https://en.wikipedia.org/wiki/Markdown#Standardization))はそのような状況の中で[John MacFarlane](John_MacFarlane_(philosopher))を中心に進められている[Markdown]の標準化プロジェクト(→ [仕様書一覧](https://spec.commonmark.org/))。その公式[Haskell]実装が[Pandoc](https://pandoc.org/) (→ [Wiki](https://en.wikipedia.org/wiki/Pandoc))で、[Jupyter Notebook](https://jupyter.org/)などに用いられている。

> GFM仕様書本文後半の[AsciiDoc]との比較は学習用には不要なので読まなくていい。これは[CommonMark]仕様書からの引用(丸写し)で、[AsciiDoc]に対する[Markdown]の優位性を主張するのが目的の記述。
>
> > また仕様書本文中のAsciiDocサイトへのリンクはすでに消滅しており、危険そうなポップアップが出る別サイトへ誘導されるので注意すること。

## [1.1 What is GitHub Flavored Markdown?](https://higuma.github.io/github-flabored-markdown/#what-is-github-flavored-markdown-)

GitHub Flavored Markdown (GFM)はGitHub及びGitHub Enterproseで用いられている[Markdown]方言。[CommonMark]をベースとして独自拡張を行ったもので、現在ではむしろ[CommonMark]よりもGFMが事実上の[MarkDown]標準仕様という扱いを受けている。

現在のGFM仕様は厳密な[CommonMark]のsuperset(全仕様を受け継いだ拡張版)であり、オリジナルにない機能は __extensions__ と呼んで区別する。(2022年)現在のGFM仕様書([Version 0.29-gfm](https://higuma.github.io/github-flabored-markdown/))は[CommonMark仕様書 (Version 0.29)](https://spec.commonmark.org/0.29/)を原本とし、そこから部分的に追加・変更した体裁を取っている。

> [GFM仕様書目次](https://higuma.github.io/github-flabored-markdown/)の中で、色付き背景で末尾に"(extension)"と明記されている項目が該当部。ただし今ではこれらも事実上の標準扱いになっており、例えば投稿サイトの [Qiita](https://qiita.com/) や [はてなブログ](https://hatenablog.com/) では[表組み](leaf-blocks.md#410-tables-extension-)や[オートリンク拡張](inlines.md#69-autolinks-extension-)などの機能を利用できる。

GitHubサイトにHTMLレンダリングする際、セキュリティと一貫性のためのプリプロセスとサニタライズ処理が行われる。

> それだけでなく、実はGitHubのMarkdown実装はGFMとは異なる点が多数ある。GitHubのサイト運用に際して日常的に手が加えられており多くの独自拡張機能がある。一方GFMとは動作が異なったり、あるいは未実装の部分もある。詳しくは本ガイド最後の [補足 - GitHubのMarkdown実装](github-markdown-implementation.md) で説明する。

## [1.3 Why is a spec needed?](https://higuma.github.io/github-flabored-markdown/#why-is-a-spec-needed-)

GFMは[Markdown]の成立から現在までの経緯を踏まえ、標準として耐えうる仕様と安定した動作を目指して作られている(→ [README](https://github.com/github/cmark-gfm/blob/master/README.md))。先に述べた通り今では単に[Markdown]といえば[CommonMark]以降、特にGFM仕様を指す場合が多い。

> GFM仕様書本文ではオリジナルMarkdownの文法の曖昧さを14項目も指摘して解説しているが、今はもう読む必要なし。これも[CommonMark]仕様書からの丸写しで、Gruber版[Markdown]に対する[CommonMark]の優位性を主張する目的の文章。

最後の __... nothing in Markdown counts as a “syntax error, ...”__ という一節は重要なので補足説明する。[Markdown]の世界では文法エラーというものは存在しない。どのような文書入力もエラーにはせず、できる限り文書作成者の意図に沿った結果になるよう寛容に処理して出力する。

> (参考) 大昔の[HTML]は[IETF]の[RFC]で[仕様策定](https://datatracker.ietf.org/doc/html/rfc1945)され、これと同様の寛容な方針を取っていた。しかし後を引き継いだ[W3C]が厳密な文法の[XHTML]を強行し、文法不備の文書はエラーとしてブラウザは文書表示を拒否する方針を打ち出し一時期大混乱になった(2000年頃)。
> 
> 結局権力を濫用した形の[W3C]はその地位を失い、現在は[WHATWG]が仕様策定を引き継いでいる。現行の[HTML Living Standard]は寛容な仕様に戻り、昔の不完全なHTML文書も受け付ける(現行ブラウザがどんな昔のHTMLでも表示できるのはこのおかげ)。
> 
> 新しく作られる仕様は上からの強制ではなく、むしろ人間社会という生態系の中での合意形成プロセスにより進められる。[Markdown]も例外ではなく、時代の要求に応えられる仕様を提示し、それが多くの支持を得たことが成功の理由といえるだろう。
> 
> > [HTML]の成立から現在までの歴史の流れに興味のある人は [とほほのWWW入門 - HTML Living StandardとHTMLの歴史](https://www.tohoho-web.com/html/memo/htmlls.htm) を読むとよい。[HTML]の仕様策定は [IETF] \(1990-1996) → [W3C] \(1996-2019) → [WHATWG] \(2019-) と移り変わっている。

## [1.4 About this document](https://higuma.github.io/github-flabored-markdown/#about-this-document)

GFMはできる限り曖昧さを排除した[Markdown]文法を目指して作られているが完璧という訳ではない。元々が色々な人達によって作られた記法の寄せ集めであり、これにより生じる矛盾を可能な限り吸収して寛容でリーズナブルな出力を行うように仕様を調整している。

> GFM仕様書本文のテストや文書生成用のPythonスクリプトに関する文章は読む必要なし。ちなみにこれらは次のrepoの中身のことを言っているものと思われる([CommonMark]からforkしており、READMEには本仕様書へのリンクも貼られているのでまず間違いない)。
> 
> https://github.com/github/cmark-gfm/
> 
> ただし現在は[`spec_tests.py`](https://github.com/github/cmark-gfm/blob/master/test/spec_tests.py)というファイルはあるが、`spec.txt`や`tools/makespec.py`は見当たらない。また[Makefile](https://github.com/github/cmark-gfm/blob/master/Makefile)に`test/spec.txt`という記述はあるものの本文の内容と異なる。今はもう処理方法は変更され、仕様書の文章だけが未修正のまま残っているものと推測される。

最後にGFM仕様書内の記法に関して一つ注意。コード例内部のタブ文字(U+0009)は`→`で表す。

------------------------------------------------------------------------

[About this document](README.md)
← [Table of contents](index.md) →
[2 Preliminaries](preliminaries.md)

[AsciiDoc]: https://en.wikipedia.org/wiki/AsciiDoc
[ATX]: https://en.wikipedia.org/wiki/Aaron_Swartz#atx
[CommonMark]: https://commonmark.org/
[epub]: https://ja.wikipedia.org/wiki/EPUB
[Haskell]: https://ja.wikipedia.org/wiki/Haskell
[HTML]: https://ja.wikipedia.org/wiki/HyperText_Markup_Language
[HTML Living Standard]: https://html.spec.whatwg.org/multipage/
[IETF]: https://datatracker.ietf.org/doc/html/rfc1945
[manページ]: https://ja.wikipedia.org/wiki/Manページ
[Markdown]: https://ja.wikipedia.org/wiki/Markdown
[MediaWiki]: https://ja.wikipedia.org/wiki/MediaWiki
[PDF]: https://ja.wikipedia.org/wiki/Portable_Document_Format
[POD]: https://ja.wikipedia.org/wiki/Plain_Old_Documentation
[RFC]: https://ja.wikipedia.org/wiki/Request_for_Comments
[Setext]: https://en.wikipedia.org/wiki/Setext
[W3C]: https://www.w3.org/
[WHATWG]: https://whatwg.org/
[XHTML]: https://ja.wikipedia.org/wiki/Extensible_HyperText_Markup_Language
[ウェブブラウザ]: https://ja.wikipedia.org/wiki/ウェブブラウザ
[軽量マークアップ言語]: https://ja.wikipedia.org/wiki/軽量マークアップ言語
[正規表現]: https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
[表組み]: leaf-blocks.md#410-tables-extension-
