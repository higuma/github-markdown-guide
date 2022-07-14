    foo

# [2 Preliminaries](https://higuma.github.io/github-flabored-markdown/#preliminaries)

[1 Introduction](introduction.md)
← [Table of Contents](index.md) →
[3 Blocks and inlines](blocks-and-inlines.md)

------------------------------------------------------------------------

## [2.1 Characters and lines](https://higuma.github.io/github-flabored-markdown/#characters-and-lines)

まずMarkdownの世界では文法エラーというものは存在しない。変な作りの文章でもできるだけ作成者の意図に沿った結果になるように出力する(大昔HTMLが[RFC](https://ja.wikipedia.org/wiki/Request_for_Comments)で仕様策定されていた頃のような方針)。

後は用語の定義。どれもごく一般的な用法で、特殊なものは何もないので説明略。

## [2.2 Tabs](https://higuma.github.io/github-flabored-markdown/#tabs)

> __重要__: 以降のExampleでは左側のコード欄内部のスペースに対してドットが見えるように書式設定を行っていることに注意(CSSを読むと`span.space::after { content: "."; ... }`としているのが分かる)。

TABはスペースに置換されずそのまま処理される。ただし`<pre>`や`<code>`のようにタブストップが適用される状況では空白4つ分とみなされる。

> Example 1-11まであるが略。自分はもう10年以上前からTABはどうしても必要な場合以外は使わないことにしている。結局TABを使う限り処理系により出力結果が変わる可能性を完全排除できないので、ならば元から断つのが一番ということ(昔は文字数削減効果を無視できなかったが、それは少なくとも20年以上前の話)。
> 

## [2.3 Insecure characters](https://higuma.github.io/github-flabored-markdown/#insecure-characters)

NUL文字(U+0000)はセキュリティ上の理由から置換文字(U+FFED)に置き換えられる。

------------------------------------------------------------------------

[1 Introduction](introduction.md)
← [Table of Contents](index.md) →
[3 Blocks and inlines](blocks-and-inlines.md)
