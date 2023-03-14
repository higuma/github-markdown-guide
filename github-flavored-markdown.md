# 付録 - GitHub Flavored Markdown

[Markdownの歴史]
← [目次] →
[名前付き文字参照一覧]

------------------------------------------------------------------------

HTMLなどと異なり、Markdownにはそれを扱う(WHATWGやW3Cのような)標準化組織は存在しない。そのため現実は実装の数だけ仕様が存在する状況だが、今はその中で**GitHub Flavored Markdown** (以下**GFM**)仕様が事実上の標準扱いとなり、仕様のリファレンスとして参照されるようになっている。

しかしGFM仕様書の構成には特殊な事情があり、その理解にはまず仕様書がどのように作られたのかという点から知る必要がある。その点を踏まえ、ここではまずGFM仕様書の成立までの経緯を解説する。次にGFM仕様書の構成とその問題点を説明し、最後に現在の状況について考察する。

## Markdownの登場

MarkdownはHTML生成用の[軽量マークアップ言語]としては後発で、2004年に[John Gruber](https://en.wikipedia.org/wiki/John_Gruber)による[最初の仕様](https://daringfireball.net/projects/markdown/syntax)とその[Perl実装](https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip)が発表された。Markdownは独自仕様だけでなく[ATX]や[Setext]など当時の既存言語の仕様も借用して組み合わせ、人間に対する認識性及び作業効率とHTMLが持つ豊富な表現力の両立を目指した。

## Markdownの普及

Markdownはその後徐々に支持を得て普及し、後に[表]や[打ち消し線]、[脚注]などの機能が追加されるようになった。さらにはHTML生成以外の目的(Webアプリ, [PDF], [epub], etc.)にも応用されるようになり、現在では最もよく用いられる[軽量マークアップ言語]としての地位を獲得している。

Markdownはその登場から現在に至るまで長年に渡り色々な開発グループにより仕様や実装の改良が行われており、その結果今では多くの方言が生まれ、仕様が異なる実装が多数存在する(→ [Wikipedia: Markdown - Variants](https://en.wikipedia.org/wiki/Markdown#Variants))。

## CommonMark

そのような状況の中でリファレンスとなる仕様策定の必要性が求められる中、2014年にCommonMark(→ [Wiki](https://en.wikipedia.org/wiki/Markdown#Standardization))が発表された。

CommonMarkは[John MacFarlane](https://en.wikipedia.org/wiki/John_MacFarlane_(philosopher))を中心に進められているMarkdownの標準化プロジェクトで、同氏が主導するCommonMark関連プロジェクトの中から主なものを簡単に示す。

- [CommonMark]\: Markdownの標準仕様(→ [仕様書一覧](https://spec.commonmark.org/))
  - [cmark](https://github.com/commonmark/cmark): CommonMarkのリファレンス実装(Haskell)
- [Pandoc]\: 汎用文書フォーマット変換ツール(特に[Jupyter Notebook]でよく用いられる)
- [Babelmark]\: Markdown仕様比較Webアプリ

### Babelmark

CommonMarkの関連プロジェクトとして、主要Markdown実装の仕様比較を行うWebアプリの[BabelMark]がある(→ [Repo](https://github.com/babelmark/babelmark.github.io))。

アプリ本体はすでに開発完了しているが(最終commitは2018-10-18)、[レジストリ](https://github.com/babelmark/babelmark-registry)の更新は継続している(最終commitは2022-08-09)。Web APIを提供している主要Markdown実装に対応しており、本解説でも色々な場所で実装比較に利用している。

### CommonMark仕様の現状

CommonMark仕様が発表された2014年当時はまだ他にMarkdown仕様書と呼べるようなものは見当たらず、間もなく事実上の標準としての扱いを受けるようになった。しかしその後は新しい仕様の取り込みなどは行っておらず、今では近況を反映した仕様とは言えない状態になっている。

## GitHub Flavored Markdown

一方GitHubでは早い段階から[表]や[脚注]などの機能を加えた独自のMarkdown実装を運用しており、2009年頃までにはそれを**GitHub Flavored Markdown** (GFM)と呼ぶようになっている[^gfm]。GitHubではその後も[数式]や[名前付き絵文字]などを積極的に導入しながら現在も運用と改良を続けている。

当初は仕様書のようなものはなかったが、2017年にGitHub Flavored Markdown仕様書が発表された[^gfm-blog]。当時はCommonMarkが標準的な地位を得ていた点を考慮し、GFM仕様書はCommonMark仕様を全面的に取り入れ、その上にGitHubの独自機能を追加した上位互換仕様という方針で作成された。

### GFM仕様書の構成

標準仕様書を最初から書くのは大変な作業であることから、まずGFM仕様は**CommonMarkの厳密な上位互換**という方針を採用した([<q>GFM is a strict superset of CommonMark.</q>](https://github.github.com/gfm/#what-is-github-flavored-markdown-))。そして仕様書はCommonMark仕様書本文をそのまま引用し、その上に&ZeroWidthSpace;**(extension)**&ZeroWidthSpace;という名目で追加機能を書き加える体裁で記述されている。該当部は次の通り。

- [4.10 Tables (extension)](https://github.github.com/gfm/#tables-extension-)
- [5.3 Task list items (extension)](https://github.github.com/gfm/#task-list-items-extension-)
- [6.5 Strikethrough (extension)](https://github.github.com/gfm/#strikethrough-extension-)
- [6.9 Autolinks (extension)](https://github.github.com/gfm/#autolinks-extension-)
- [6.11 Disallowed Raw HTML (extension)](https://github.github.com/gfm/#disallowed-raw-html-extension-)

特に4.10の[表]や6.5の[打ち消し線]はCommonMarkにはない仕様だが、今では大部分のMarkdown処理実装がサポートしている。元仕様のCommonMarkは現在もこれらに関して未対応であり、このような状況の中で徐々に事実上の標準仕様としての扱いがCommonMarkからGFMに移り変わった。

### GFM仕様書の問題点

ただしGFM仕様書のこのような構成には構造的な問題があり、仕様書中に矛盾する記述が多数存在する。特に追加機能の副作用によりCommonMark仕様とは異なる動作が色々な場所で発生している。

例えば[6.8 Autolinks](https://github.github.com/gfm/#textual-content)のExamples [619](https://github.github.com/gfm/#example-620), [620](https://github.github.com/gfm/#example-621)は「自動リンクではない」と明記されている。これらはCommonMarkからの丸写しだが、実際には追加機能の拡張自動リンク([6.9 Autolinks (extension)](https://github.github.com/gfm/#autolinks-extension-))によりリンクが作られる。

```markdown
Example 619 → http://example.com

Example 620 → foo@bar.example.com
```

> Example 619 → http://example.com
> 
> Example 620 → foo@bar.example.com

> &#x2714;&#xFE0F; 丸写し自体はその旨を明記しているので問題ない。しかし副作用が避けられない機能を追加したにもかかわらず「**厳密(strict)な**上位互換」を謳っている点が問題で、実際には上記の通り仕様書の中で矛盾する記述を生じている(最低限の対応として**strict**は削除すべき)。

> &#x2714;&#xFE0F; 序論の部分(特に[1.2](https://github.github.com/gfm/#what-is-markdown-),[1.3](https://github.github.com/gfm/#why-is-a-spec-needed-),[1.4](https://github.github.com/gfm/#about-this-document))もCommonMark仕様書の引用だが、これらは少なくとも10年以上前の状況説明であり、今読んでも実用性はない。ただし歴史を知るための読み物としてならその価値はある。

## 最近の動向

GitHubではGFM仕様書の発表後も継続してMarkdown実装に運用上の更新や機能追加を行っているが、仕様書への反映は全く行われていない。しかしGFM仕様書に代わる新たな仕様書も見当たらず、このような状態が長く続いている。

> みな開発競争の中で機能充実を最優先に進めているため、ドキュメント整備は二の次になるのはやむを得ない点はある。だがそれだけでなく多くの人はGFM仕様のレベルでもう十分と考えており、その結果この状況が続いているものと推測される。

またGFM仕様に含まれない仕様で事実上標準化されている(あるいはされつつある)ものは[その他の機能]にまとめた通りだが、これらを取り込んでGFM仕様を改訂することは今後も当分ないものと思われる。

> サイト運用で多忙を極める彼らにそのような余裕はないはず。また現状のままでも仕様は実用上十分なレベルに安定していると考える人が多く、標準化に対する要望はあまり多くはないものと考えられる。

最後にMarkdownに関する今後の動向を予測すると、まずMarkdownは今後も使われ続けるだろう。特に技術ドキュメント分野では主流言語であり、この状況が急変するとは考えにくい。文法に関しても現在のMarkdownから大きく変わることはもうないが、今後必要に応じて徐々に機能追加される可能性はある。

ただし[ブロック]アイテムとして[コードブロック]に[info文字列]を設定して他形式の文書を取り込む手法はすでに半ば標準化されている。GitHubでは現在[Mermaid]、[GeoJSON/TopoJSON](other-features.md#geojson-topojson)、[STL]の3種類をサポートしており、今後もこの方法を用いて新しいデータ形式を順次取り込んでいくものと思われる。

------------------------------------------------------------------------

[Markdownの歴史]
← [目次] →
[名前付き文字参照一覧]

[ATX]: https://en.wikipedia.org/wiki/Aaron_Swartz#atx
[Babelmark]: https://babelmark.github.io/
[CommonMark]: https://commonmark.org/
[epub]: https://ja.wikipedia.org/wiki/EPUB
[info文字列]: code-blocks.md#info文字列
[John MacFarlane]: https://en.wikipedia.org/wiki/John_MacFarlane_(philosopher)
[Jupyter Notebook]: https://jupyter.org/
[Markdownの歴史]: history.md
[Mermaid]: other-features.md#mermaidによるダイアグラムチャート
[Pandoc]: https://en.wikipedia.org/wiki/Pandoc
[PDF]: https://ja.wikipedia.org/wiki/Portable_Document_Format
[Setext]: https://en.wikipedia.org/wiki/Setext
[STL]: other-features.md#stl
[コードブロック]: code-blocks.md
[ブロック]: blocks.md
[その他の機能]: other-features.md
[打ち消し線]: bold-italic-strikethrough.md#打ち消し線
[拡張自動リンク]: links.md#拡張自動リンク
[脚注]: other-features.md#脚注
[最初の仕様]: https://daringfireball.net/projects/markdown/syntax
[軽量マークアップ言語]: https://ja.wikipedia.org/wiki/軽量マークアップ言語
[数式]: other-features.md#数式
[名前付き絵文字]: github-specific.md#名前付き絵文字
[名前付き文字参照一覧]: named-character-references.md
[表]: tables.md
[目次]: index.md#github-flavored-markdown

[^gfm]: Tom Preston-Werner: [Issues: "GitHub Flavored Markdown Examples"](https://github.com/mojombo/github-flavored-markdown/issues/1)
[^gfm-blog]: GitHub Blog: ["A formal spec for GitHub Flavored Markdown"](https://github.blog/2017-03-14-a-formal-spec-for-github-markdown/)
