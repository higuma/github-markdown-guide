# [1.Introduction](https://higuma.github.io/github-flabored-markdown/#introduction)

[About this document](README.md)
← [Table of contents](index.md) →
[2 Preliminaries](preliminaries.md)

------------------------------------------------------------------------

本章は [HTML] → [軽量マークアップ言語] → [Markdown] → [CommonMark] → GitHub Flavored Markdown (__GFM__)へと続く歴史的経緯の解説。はじめに[HTML]から[Markdown]までの簡単な序論、その後はGFM仕様書と順番を入れ替えて1.2 → 1.1 → 1.3 → 1.4 の順に解説する。

> 歴史的経緯に興味がなければ読まずに[次章](preliminaries.md)へ進んでもよい。なお読者は[HTML]に関する中級程度の知識があるものとする。

## Markdownの成立まで

[HTML]以前のユーザーインターフェースはテキスト形式が主流で、Unix系OSの[manページ]をはじめとする電子文書の多くはテキスト形式で作成・閲覧していた。

その後[HTML]と[ウェブブラウザ]の普及に伴い、電子文書にも徐々に[HTML]が普及していった。[HTML]文書は従来のテキスト文書にはない豊富な表現力を持つ。しかしタグを用いる独特の文法が複雑で、ソース(生)の[HTML]文書は簡単に言えば人間には「読みにくい」「書きにくい」という問題がある。

現在でも[HTML]文書の作成は(直接あるいは間接的に)[テキストエディタ]を使う場合が多く、[テキストエディタ]上での認識性と入力の容易さが作業効率に大きな影響を与える。そこで文書入力は人間が扱いやすい形式で行い、それを[HTML]に変換するツールが考えられるようになった。

その手法のひとつが[軽量マークアップ言語]で、はじめは既存の一般用([Setext]など)やソフトウエア用([POD]など)のフォーマットツール(出力先はテキスト、[PDF]、書籍など)に[HTML]出力機能を加えたものが作られた。後に有用性が認められ専用の後発仕様も多数作られた([MediaWiki], [AsciiDoc]など)。

> (参考) 主要な[軽量マークアップ言語]とその機能比較、成立時期は次の一覧表を参照。
> 
> <https://en.wikipedia.org/wiki/Lightweight_markup_language#Comparison_of_language_features>

## [1.2 What is Markdown?](https://higuma.github.io/github-flabored-markdown/#what-is-markdown-)

> ここから先は基本的にGFM仕様書の章立てに従って説明するが、1.1と1.2は順序を逆にして成立時期の時間軸順に説明する。

[軽量マークアップ言語]としては後発の[Markdown]は2004年に[John Gruber](https://en.wikipedia.org/wiki/John_Gruber)による[最初の仕様](https://daringfireball.net/projects/markdown/syntax)とその[Perl実装](https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip)が発表された。[Markdown]は独自仕様だけでなく[ATX]や[Setext]など当時の既存言語の仕様も借用して組み合わせ、人間に対する認識性及び作業効率とHTMLが持つ豊富な表現力の両立を目指した。

> Gruber版[Markdown]の詳しい解説は以前まとめているので興味のある人は次を参照。
> 
> https://github.com/higuma/markdown_cheat_sheet
> 
> > なお後半部にGFMの解説もあるが内容が古い(GFMが[CommonMark]を取り入れるようになる前)。今はもう役に立たないので本解説を読むこと。

その後は徐々に支持を得て普及し、それとともに[脚注]や[表組み]などの機能が追加されるようになった。さらにはHTML以外の目的(Webアプリ, [PDF], [epub], etc.)にも応用されるようになり、現在では最もよく用いられる[軽量マークアップ言語]としての地位を獲得している。

> 本文はCommonMark仕様書の引用(丸写し)で、機能拡張の例として[脚注]と[表組み]が書かれている。しかしCommonMarkではどちらも仕様に含まれていない。[表組み]はCommonMarkの拡張であるGFM、[脚注]はそのさらに拡張であるGitHub Markdown実装に組み込まれている。

なお長年に渡り色々な開発グループにより仕様や実装の改良が行われており、その結果今では多くの方言が生まれ、仕様が異なる実装が多数存在する(→ [Wikipedia: Markdown - Variants](https://en.wikipedia.org/wiki/Markdown#Variants))。

> (参考) [BabelMark](https://babelmark.github.io/faq/)を利用すればWebページ上からMarkdownテキストを入力して変換し、主要なMarkdown処理実装がどのように出力するか比較できる。

### [CommonMark]

[CommonMark] (→ [Wiki](https://en.wikipedia.org/wiki/Markdown#Standardization))はそのような状況の中で[John MacFarlane](John_MacFarlane_(philosopher))を中心に進められている[Markdown]の標準化プロジェクト(→ [仕様書一覧](https://spec.commonmark.org/))。また同氏が推める汎用ドキュメント変換プロジェクトが[Pandoc](https://pandoc.org/) (→ [Wiki](https://en.wikipedia.org/wiki/Pandoc))で、[Jupyter Notebook](https://jupyter.org/)などに用いられている。

> GFM仕様書本文後半の[AsciiDoc]との比較は学習用には不要(読まなくていい)。これは[CommonMark]仕様書からの引用(丸写し)で、[AsciiDoc]に対する[Markdown]の優位性を主張するのが目的の記述。
>
> > また仕様書本文中のAsciiDocサイトへのリンクはすでに消滅しており、危険そうなポップアップが出る別サイトへ誘導されるので注意すること。

## [1.1 What is GitHub Flavored Markdown?](https://higuma.github.io/github-flabored-markdown/#what-is-github-flavored-markdown-)

GitHub Flavored Markdown (GFM)はGitHub及びGitHub Enterpriseで用いられている[Markdown]方言。[CommonMark]をベースとして独自拡張を行ったもので、現在ではむしろ[CommonMark]よりもGFMが事実上の[Markdown]標準仕様という扱いを受けている。

現在のGFM仕様は厳密な[CommonMark]のsuperset(全仕様を受け継いだ拡張版)であり、オリジナルにない機能は __extensions__ と呼んで区別する。(2022年)現在のGFM仕様書([Version 0.29-gfm](https://higuma.github.io/github-flabored-markdown/))は[CommonMark仕様書 (Version 0.29)](https://spec.commonmark.org/0.29/)を原本とし、そこから部分的に追加・変更した体裁を取っている。

> [GFM仕様書目次](https://higuma.github.io/github-flabored-markdown/)の中で、色付き背景で末尾に"(extension)"と明記されている項目が該当部。ただし今ではこれらも事実上の標準扱いで、例えば投稿サイトの [Qiita](https://qiita.com/) や [はてなブログ](https://hatenablog.com/) では[表組み]や[オートリンク拡張]などの機能を利用できる。
> 
> なおextensions仕様が追加されたことにより元の[CommonMark]と仕様が異なる箇所が多数生じている。詳しくは本ガイド最後の [補足 - GitHubのMarkdown実装](github-markdown-implementation.md) で説明する。

GitHubサイトにHTMLレンダリングする際、セキュリティと一貫性のためのプリプロセスとサニタライズ処理が行われる。

> それだけでなくGitHubのMarkdown処理実装には多くの独自拡張機能がある。さらにGitHubのサイト運用に際して日常的に改良が加えられており、その結果GFM仕様書と動作が異なる点も多数ある。これも [補足 - GitHubのMarkdown実装](github-markdown-implementation.md) で説明する。

## [1.3 Why is a spec needed?](https://higuma.github.io/github-flabored-markdown/#why-is-a-spec-needed-)

GFMは[Markdown]の成立から現在までの経緯を踏まえ、標準として耐えうる仕様と安定した動作を目指して作られている(→ [README](https://github.com/github/cmark-gfm/blob/master/README.md))。先に述べた通り今では単に[Markdown]といえば[CommonMark]以降、特にGFM仕様を指す場合が多い。

> GFM仕様書本文ではオリジナルMarkdownの文法の曖昧さを14項目も指摘して解説しているが、今はもう読む必要なし。これも[CommonMark]仕様書からの丸写しで、Gruber版[Markdown]に対する[CommonMark]の優位性を主張する目的の文章。

最後の __... nothing in Markdown counts as a “syntax error, ...”__ という一節は重要なので補足説明する。[Markdown]の世界では文法エラーというものは存在しない。どのような文書入力もエラーにはせず、できる限り文書作成者の意図に沿った結果になるよう寛容に変換処理してHTMLを出力する。

> (参考) 大昔の[HTML]は[IETF]の[RFC]で[仕様策定](https://datatracker.ietf.org/doc/html/rfc1945)され、これと同様の寛容な方針を取っていた。しかし後を引き継いだ[W3C]が厳密な文法の[XHTML]を強行し、文法不備の文書はエラーとしてブラウザは文書表示を拒否する方針を打ち出して一時期大混乱になった(2000年頃)。
> 
> 結局権力を濫用した形の[W3C]はその地位を失い、現在は[WHATWG]が仕様策定を引き継いでいる。現行の[HTML Living Standard]は寛容な仕様に戻り、昔の不完全なHTML文書も受け付ける(現行ブラウザがどんな昔のHTMLでも表示できるのはこのおかげ)。
> 
> 新しく作られる仕様は上からの強制ではなく、むしろ人間社会という生態系の中での合意形成プロセスの中で形成される。[Markdown]も例外ではなく、時代の要求に応えられる仕様を提示し、それが多くの支持を得たことが成功の理由といえるだろう。
> 
> > [HTML]の成立から現在までの歴史の流れに興味のある人は [とほほのWWW入門 - HTML Living StandardとHTMLの歴史](https://www.tohoho-web.com/html/memo/htmlls.htm) を読むとよい。[HTML]の仕様策定は [IETF] \(1990-1996) → [W3C] \(1996-2019) → [WHATWG] \(2019-) と移り変わっている。

## [1.4 About this document](https://higuma.github.io/github-flabored-markdown/#about-this-document)

> (参考) 学習用には全く役に立たない内容なので読む必要なし。

この部分もCommonMark仕様書の丸写しであることに注意。内容は次のGitHub repoに関する説明。

https://github.com/commonmark/commonmark-spec

ただし記述は現在の内容と食い違う点がある。特に`tools/makespec.py`というファイルはもう存在せず、代わりに`tools/make_spec.lua`というファイルがある。これは単にrepo側の変更が仕様書に反映されていないだけだと思われる。

> これも仕様書の不備だが、まあMacFarlane氏はご多忙なのであろう。

最後に仕様書内の記法に関して一つ注意。コード例内部のタブ文字(U+0009)は`→`で表す。

------------------------------------------------------------------------

[About this document](README.md)
← [Table of contents](index.md) →
[2 Preliminaries](preliminaries.md)

[AsciiDoc]: https://en.wikipedia.org/wiki/AsciiDoc
[ATX]: https://en.wikipedia.org/wiki/Aaron_Swartz#atx
[CommonMark]: https://commonmark.org/
[epub]: https://ja.wikipedia.org/wiki/EPUB
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
[オートリンク拡張]: autolinks-extension.md
[テキストエディタ]: https://ja.wikipedia.org/wiki/テキストエディタ
[軽量マークアップ言語]: https://ja.wikipedia.org/wiki/軽量マークアップ言語
[正規表現]: https://developer.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
[表組み]: tables-extension.md
[脚注]: github-markdown-implementation.md#footnotes
