# [4.4 インデント式コードブロック](https://higuma.github.io/github-markdown-guide/gfm/#indented-code-blocks)

[4.5 コードブロック](code-blocks.md)
← [目次](index.md) →
[4.6 HTMLブロック](html-blocks.md)

------------------------------------------------------------------------

> **旧版(完成後削除)**

旧式の[コードブロック]書式。初学時は飛ばして先へ進んでよい。

## ベストプラクティス

原則として非推奨。トップレベル構文に対しては現方式の[コードブロック]に統一すること。

<!--

TODO

ただし[リストアイテム]の内部にコードブロックを入れ子で挿入する場合はこの方法しか使えない。次の「参考」以降の内容を参照。

https://docs.github.com/ja/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks#fenced-code-blocks

-->

## まとめ

先頭にスペース4文字のインデントを用いてソースリスティングなどの[コードブロック]を表現する。インデント式コードブロックは前後を[空行]で区切って認識させる。

## 文例

行頭に4つ以上の連続したスペースがある行の連続は[コードブロック]として扱われ、行頭のスペース4つを除去した後、テキスト文書として見た通りに出力する。これは主に次のようなコードリスティングに用いられていた。

```markdown
    #include <stdio.h>
    void main() {
        printf("Hello world!\n");
    }
```

>     #include <stdio.h>
>     void main() {
>         printf("Hello world!\n");
>     }

ただし文法上の問題点が多い。次の文例では前の行が[リストアイテム]の場合はそのアイテムの続きと認識される。さらに[空行]を挿入しても効果はなく[リストアイテム]のインデントとして扱われる。

```markdown
* Item 1
    rest of item 1
* Item 2

    not an indented code block
```

> * Item 1
>     rest of item 1
> * Item 2
> 
>     not an indented code block

説明は以上とする。これ以外にも文法解釈上の問題が多数あり、後に現方式の[コードブロック]が作られた。

> 現在は後方互換対応専用と考えるべき。GitHub Docsの[コードブロック解説](https://docs.github.com/ja/get-started/writing-on-github/working-with-advanced-formatting/creating-and-highlighting-code-blocks)でも[現方式][コードブロック]しか説明していない。

------------------------------------------------------------------------

[4.5 コードブロック](code-blocks.md)
← [目次](index.md) →
[4.6 HTMLブロック](html-blocks.md)

[コードブロック]: code-blocks.md
[リスト]: lists.md
[リストアイテム]: list-items.md
[空行]: blank-lines.md
