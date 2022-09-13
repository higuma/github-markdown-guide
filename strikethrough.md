# [6.5 打ち消し線](https://higuma.github.io/github-markdown-guide/gfm/#strikethrough-extension-)

[6.4 斜体と太字](bold-and-italic.md)
← [目次](index.md) →
[6.6 リンク](links.md)

------------------------------------------------------------------------

打ち消し線を表現する(例: ~~取消~~)。

## まとめ

打ち消し線は`~~...~~`で記述する。HTMLの[`<del>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/del)に変換され、横線付きで表示される。

```markdown
Plain text ~~strikethrough~~.

これは~~打ち消し線~~の例文。
```

> Plain text ~~strikethrough~~.
> 
> これは~~打ち消し線~~の例文。


## 文例

外側に別のインライン構文があり、その中に打ち消し線がネストしていてもよい。逆に打ち消し線の中に別のインライン構文がネストしていてもよい。

```markdown
**太字の中の~~打ち消し線~~の例**

[リンクの中の~~打ち消し線~~の例](#)

~~打ち消し線の中の**太字**の例~~

~~打ち消し線の中の<sub>下付き文字</sub>の例~~
```

> **太字の中の~~打ち消し線~~の例**
> 
> [リンクの中の~~打ち消し線~~の例](#)
> 
> ~~打ち消し線の中の**太字**の例~~
> 
> ~~打ち消し線の中の<sub>下付き文字</sub>の例~~

ただしオーバーラップはできない。これは出力形式のHTMLが木構造の構文であることによる当然の結果で、次のように両者を重複させようとしても意図した通りに構文解釈してもらえない。

```markdown
**太字 ~~太字&打ち消し線** 打ち消し線~~
```

> **太字 ~~太字&打ち消し線** 打ち消し線~~

正しくは次の通り。

```markdown
**太字 ~~太字&打ち消し線~~** ~~打ち消し線~~
```

> **太字 ~~太字&打ち消し線~~** ~~打ち消し線~~

> (補足) 打ち消し線は最初のMarkdown実装である[Gruber版]\(2004年)にすでに存在した機能だが、[CommonMark]では(おそらく`~~~`を[コードブロック]に採用した副作用を考慮して)仕様から外した。[GFM]ではこれを復活させており、現在では主要Markdown実装の大部分で利用できる。

------------------------------------------------------------------------

[6.4 斜体と太字](bold-and-italic.md)
← [目次](index.md) →
[6.6 リンク](links.md)

[コードブロック]: code-blocks.md
[CommonMark]: introduction.md#commonmark
[GFM]: https://github.com/higuma/github-markdown-guide/blob/main/introduction.md#11-github-flavored-markdownとは
[Gruber版]: https://daringfireball.net/projects/markdown/syntax

