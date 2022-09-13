# GitHub Markdown 実践ガイド

目次 →
[本ガイドについて](README.md)

------------------------------------------------------------------------

章及び節番号は[GitHub Flaboored Markdown仕様書](https://higuma.github.io/github-markdown-guide/gfm/)に準じているが、部分的に説明順序を入れ替えている部分がある(番号が前後している箇所)。また本ドキュメント独自の解説もある(章/節番号なし)。

## 目次

* [本ガイドについて](README.md)
* [1 はじめに](introduction.md)
* [2 予備知識](preliminaries.md)
* [3 ブロックとインライン](blocks-and-inlines.md)
* [4 葉ブロック](leaf-blocks.md)
* [5 コンテナブロック](container-blocks.md)
* [6 インライン](inlines.md)
* [GitHub Markdown実装](github-markdown.md)
* [付録: A parsing strategy](appendix-a-parsing-strategy.md)

## 総目次

* [本ガイドについて](README.md)
* [1 はじめに](introduction.md)
    * [Markdownの成立まで](introduction.md#Markdownの成立まで)
    * [1.2 Markdownとは](introduction.md#12-markdownとは)
    * [1.1 GitHub Flavored Markdownとは](introduction.md#11-github-flavored-markdownとは)
    * [1.3 仕様書の必要性](introduction.md#13-仕様書の必要性)
    * [1.4 GFM仕様書について](introduction.md#14-gfm仕様書について)
* [2 予備知識](preliminaries.md)
    * [2.1 文字と行](preliminaries.md#21-文字と行)
    * [2.2 タブ](preliminaries.md#22-タブ)
    * [2.3 安全ではない文字](preliminaries.md#23-安全ではない文字)
    * [本ガイドの構成](preliminaries.md#本ガイドの構成)
        * [背景](preliminaries.md#背景)
        * [各セクションの構成](preliminaries.md#各セクションの構成)
        * [タブ文字の扱い](preliminaries.md#タブ文字の扱い)
        * [コード例の表現方法](preliminaries.md#コード例の表現方法)
        * [公開方法](preliminaries.md#公開方法)
* [3 ブロックとインライン](blocks-and-inlines.md)
    * [3.1 優先度](blocks-and-inlines.md#31-優先度)
    * [3.2 コンテナブロックと葉ブロック](blocks-and-inlines.md#32-コンテナブロックと葉ブロック)
* [4 葉ブロック](leaf-blocks.md)
    * [4.1 横線](thematic-breaks.md)
    * [4.2 見出し](headings.md)
    * [4.3 Setext見出し](setext-headings.md)
    * [4.4 インデント式コードブロック](indented-code-blocks.md)
    * [4.5 コードブロック](code-blocks.md)
    * [4.6 HTMLブロック](html-blocks.md)
    * [4.7 リンク参照定義](link-reference-definitions.md)
    * [4.8 パラグラフ](paragraphs.md)
    * [4.9 空行](blank-lines.md)
    * [4.10 表](tables.md)
* [5 コンテナブロック](container-blocks.md)
    * [5.1 引用](block-quotes.md)
    * [5.2 リストアイテム](list-items.d)
    * [5.3 タスクリストアイテム](task-list-items.md)
    * [5.4 リスト](lists.md)
* [6 インライン](inlines.md)
    * [6.1 バックスラッシュエスケープ](backslash-escapes.md)
    * [6.2 文字参照](character-references.md)
    * [6.3 コードスパン](code-spans.md)
    * [6.4 斜体と太字](bold-and-italic.md)
    * [6.5 打ち消し線](strikethrough.md)
    * [6.6 リンク](links.md)
    * [6.7 画像](images.md)
    * [6.8 自動リンク](autolinks.md)
    * [6.9 自動リンク(AFM拡張)](autolinks-extension.md)
    * [6.10 生HTML](raw-html.md)
    * [6.11 使用できないHTML要素](disallowed-html-elements.md)
    * [6.12 ハード改行](hard-line-breaks.md)
    * [6.13 ソフト改行](soft-line-breaks.md)
    * [6.14 テキストコンテント](textual-content.md)
* [GitHub Markdown実装](github-markdown.md)
* [付録: A parsing strategy](appendix-a-parsing-strategy.md)
    * [Overview](appendix-a-parsing-strategy.md#overview)
    * [Phase 1: block structure](appendix-a-parsing-strategy.md#phase-1-block-structure)
    * [Phase 2: inline structure](appendix-a-parsing-strategy.md#phase-2-inline-structure)

------------------------------------------------------------------------

目次 →
[本ガイドについて](README.md)
