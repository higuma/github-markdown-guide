# [4.1 Thematic breaks](https://higuma.github.io/github-flabored-markdown/#thematic-breaks)

[4 Leaf blocks](leaf-blocks.md)
← [Table of contents](index.md) →
[4.2 ATX headings](atx-headings.md)

------------------------------------------------------------------------

上下のブロック構文の間に横線を引く。HTML要素の`<hr>`を出力する。

## Best practice

* `---------`のように明確に判別できる十分な長さのハイフンを用いる(3文字以上、スペースなし)
* 前後に[空行]を入れる(誤認識対策)

```markdown
パラグラフ(1)

------------------------------------------------------------------------

パラグラフ(2)
```

> パラグラフ(1)
> 
> ------------------------------------------------------------------------
> 
> パラグラフ(2)

## Summary

> 詳細仕様の解説だが覚えたところで実用性は乏しい。興味がなければ読む必要なし。

GFM仕様では次の形式に当てはまる行が横線(`<hr>`)に変換される。

* `-`が3文字以上、または``_``が3文字以上、または``*``が3文字以上
    * 全て同種文字で、行中にスペース以外の別の文字があってはならない
* 先頭に3文字までインデント用スペース可(4文字以上は[インデント式コードブロック]と認識される)
* 中間と行末に任意個のスペースが挿入されていてもよい

次に示す例は(見かけは全然異なるが)すべて上記条件を満たしており横線に変換される。

```markdown
---

____

* * * * *

   ---
```

> ---
> 
> ____
> 
> * * * * *
> 
>    ---

> このような極めて緩やかな仕様になっているのは昔のテキスト記法を可能な限り寛大に受け付けて処理するため(後方互換対策)。どれを用いてもよいが今では逆にすべて覚える必要はない。1種類(例えば上に示したBest Practiceだけ)覚えておけば十分。

## Examples

> これも興味がなければ読まなくていい(些末仕様説明用で実用性なし)。ただし誤認識を未然に防ぐには前後の[空行]が効果的という知識は覚えておくと何かと役に立つ。

GFM仕様によれば前後に[空行]は不要で、次の文例([Example 28])は[パラグラフ]を上下に区切る。

```markdown
Foo
***
bar
```

> Foo
> ***
> bar

ただし横線を表す文字に`-`を使う場合は注意。

```markdown
Foo
---
bar
```

この場合は`Foo`が[Setext見出し]と認識され``<h2>``に変換される。

> Foo
> ---
> bar

このような誤認識への対策のため前後に[空行]を挿入することが望ましい(推奨)。

> またGFM以外のMarkdown実装では前後の状況により[空行]が必要なものが多い。例として上に示した[Example 28]をBabelmarkで処理した確認結果を示す。
> 
> * Example 28 (空行なし) → https://babelmark.github.io/?text=Foo%0A***%0Abar
> * 前後に空行を挿入 → https://babelmark.github.io/?text=Foo%0A%0A***%0A%0Abar
> 
> [空行]なしの場合は横線と認識しないMarkdown実装が多数ある(特に[Jupyter notebook]などに用いられる[Pandoc]が認識しないことに注目)。これに対し前後に[空行]を入れれば主要Markdown実装は問題なく横線と認識する。
> 
> このように前後の[空行]を入れておくことが可搬性の高い記述を行うことにもつながる(具体的にはGitHub用に作成したMarkdown文章をそのまま[Jupyter notebook]にコピーペーストできる)。[空行]が不要な場合は単に無視されるため(無害)、[空行]挿入は効果的なトラブルの未然防止策になる。

------------------------------------------------------------------------

[4 Leaf blocks](leaf-blocks.md)
← [Table of contents](index.md) →
[4.2 ATX headings](atx-headings.md)

[Example 28]: https://higuma.github.io/github-flabored-markdown/#example-28
[Jupyter Notebook]: https://jupyter.org/
[Pandoc]: https://pandoc.org/
[Setext見出し]: setext-headings.md
[インデント式コードブロック]: indented-code-blocks.md
[パラグラフ]: paragraphs.md
[空行]: blank-lines.md
[空白文字]: https://higuma.github.io/github-flabored-markdown/#whitespace-character
[正規表現]: https://deeloper.mozilla.org/ja/docs/Web/JavaScript/Guide/Regular_Expressions
[見出し]: #42-atx-headings
