# 文法の構造

[文字と行](characters.md)
← [目次](index.md) →
[TODO](#)

------------------------------------------------------------------------

Markdownは出力形式であるHTMLと同様の木構造に基づいた文法解析を行う。Markdownにおける文法構造は大きく分けて次の2種類がある。

* インライン - 行の内部に配置される構造
* ブロック - 1行以上の大きさを持ち、行で区切られる構造

> (参考)これはHTMLのインライン/ブロック要素に由来する(次を参照)。ただしMarkdownを理解するのに必須の知識という訳ではない(知っていれば理解の助けになる程度)。
> 
> * [MDN - インライン要素](https://developer.mozilla.org/ja/docs/Web/HTML/Inline_elements)
> * [MDN - ブロックレベル要素](https://developer.mozilla.org/ja/docs/Web/HTML/Block-level-elements)
> 
> なおインライン/ブロック文法モデルはHTML4.01までの旧式で、現在のHTMLは[コンテンツカテゴリー](https://developer.mozilla.org/ja/docs/Web/Guide/HTML/Content_categories)という新しいモデルを用いる(これも参考: Markdownとの関係は薄い)。

## インライン

Markdownの文法構成要素の中で行の中に配置するものを**インライン**と呼ぶ。

* [テキスト]
* [書式設定]
    * 太字
    * 斜体
    * 斜体太字
    * 取り消し線
* リンク
    * [(通常)リンク]
    * [自動リンク]
* [画像]
* [コードスパン]
* [インラインHTML]
    * 上付き文字、下付き文字
    * 変数
    * ルビ
    * etc.

<!-- ハード改行・ソフト改行はパラグラフにしか適用されない(見出しに使われることはない)。そのためパラグラフ内での改行や空白の扱いとして説明すればよい(専門のセクションは設けない) -->

## ブロック

複数行で構成可能な文法構造を**ブロック**と呼ぶ。またブロックの中に別のブロックをネストして配置できるものを[コンテナブロック]\(container blocks)、そうでないものを[葉ブロック]\(leaf blocks)と呼ぶ。

* [葉ブロック]
    * [パラグラフ]
    * [見出し]
    * [コードブロック]
    * [表]
    * [横線]
    * [HTMLブロック]
* [コンテナブロック]
    * [引用]
    * [リスト]
    * [タスクリスト]

## 構文解析

まず大前提としてMarkdownには文法エラーというものはない。どのような入力でも受付け、変換処理してHTMLとして表示可能な状態で出力する。

変換処理の際に構文解析を行うが、その場合はブロックの認識を先に行い、その後でインラインを解析する。例としてまず次のようなMarkdownコードを考える。

```markdown
ABC _DEF
GHI_ JKL
```

結果はこうなる。

> ABC _DEF
> GHI_ JKL

この例では1行目`ABC _DEF`と2行目`GHI_ JKL`の間には改行が一つだけある。空行ではないため連結されて1つのパラグラフ(ブロック)と認識される(1行扱い)。次に`_DEF`と(スペースを挿入して連結された)`GHI_`が評価され、斜体で表示される。

ところが次の例では状況が全く異なる。

```markdown
- ABC _DEF
- GHI_ JKL
```

2行とも先頭の`-`を検出してリストアイテムと判定される。結果は次の通り。

> - ABC _DEF
> - GHI_ JKL

全体で1つのリスト(ブロック)を構成するが、個別のリストアイテムもブロックであり、実はブロックが二重の入れ子になっている(外側はリスト、内側はリストアイテム)。そのため`_DEF`と`GHI_`は連結されず別ブロック扱いとなり、斜体ではなく通常文字として出力される。

------------------------------------------------------------------------

[文字と行](characters.md)
← [目次](index.md) →
[TODO](#)






[HTMLブロック]: html-blocks.md
[コードスパン]: code-spans.md
[コードブロック]: code-blocks.md
[コンテナブロック]: container-blocks.md
[パラグラフ]: paragraphs.md
[リスト]: lists.md
[リストアイテム]: list-items.md
[引用]: block-quotes.md
[葉ブロック]: leaf-blocks.md
[表]: tables.md
[見出し]: headings.md