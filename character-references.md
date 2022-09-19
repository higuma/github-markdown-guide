# [6.2 文字参照](https://higuma.github.io/github-markdown-guide/gfm/#entity-and-numeric-character-references)

[6.1 バックスラッシュエスケープ](backslash-escapes.md)
← [目次](index.md) →
[6.3 コードスパン](code-spans.md)

------------------------------------------------------------------------

HTMLの[文字参照](https://html.spec.whatwg.org/multipage/syntax.html#character-references)を表現する。

## ベストプラクティス

Markdownでは文字参照が必要になるケースは少なく、多くの場合は用いなくてよい。

HTMLでは特にマークアップに用いられる記号(特に`<`, `>`, `&`)を文字として出力する場合に文字参照が必須だが、Markdownではこれらをそのまま出力できる。

```markdown
x > 0 && x < 100
```

> x > 0 && x < 100

またMarkdownの書式設定との区別が必要な場合は[バックスラッシュエスケープ]を用いて処理できる。

```markdown
\<sub>これは下付き文字ではない\</sub>
```

> \<sub>これは下付き文字ではない\</sub>

ただし有用な文字参照として[ノーブレークスペース]\(`&nbsp;`)は文字間隔調整用に利用できる。

```markdown
Foo&nbsp;&nbsp;&nbsp;&nbsp;bar

Foo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bar
```

> Foo&nbsp;&nbsp;&nbsp;&nbsp;bar
> 
> Foo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bar

## まとめ

Markdownの文字参照はHTMLと同じ書式を用いる。次の3種類がある。

* [実体参照](#実体参照): `&{実体名};`
* [10進数文字参照](#10進数文字参照): `&#{コードポイントの10進表現};`
* [16進数文字参照](#16進数文字参照): `&#x{コードポイントの16進表現};`, `&#X{コードポイントの16進表現};`

### [実体参照](https://higuma.github.io/github-markdown-guide/gfm/#entity-references)

実体参照(entity references)はHTMLの[名前付き文字参照](https://html.spec.whatwg.org/multipage/named-characters.html#named-character-references)と同じ書式を用いる。

```markdown
&lt; &gt; &amp; &copy;
```

> &lt; &gt; &amp; &copy;

ただしHTMLでは(後方互換対応のため)`;`を省略した表現も許可されているが、Markdownでは(文法明確化のため)必ず末尾の`;`が必要なことに注意。次はHTMLでは文字参照と認識されるが、Markdownでは認識されず文字通り出力する。

```markdown
&lt &gt &amp &copy
```

> &lt &gt &amp &copy

一覧は次の通り。

* [HTML標準仕様書](https://html.spec.whatwg.org/multipage/named-characters.html#named-character-references)
* [Markdown版](https://gist.github.com/higuma/36c7ff658c4b280b1dfbf802bae52356)

### [10進数文字参照](https://higuma.github.io/github-markdown-guide/gfm/#decimal-numeric-character-references)

10進数文字参照(decimal numeric character references)は`&#{Unicodeコードポイントの10進表現};`の形式で表現する。

```markdown
&#48; &#65; &#97; &#12354;
```

> &#48; &#65; &#97; &#12354;


### [16進数文字参照](https://higuma.github.io/github-markdown-guide/gfm/#hexadecimal-numeric-character-references)

16進数文字参照(hexadecimal numeric character references)は`&#x{Unicodeコードポイントの16進表現};`または`&#X{Unicodeコードポイントの16進表現};`の形式で表現する。

```markdown
&#x30; &#X41; &#x61; &#X3042;
```

> &#x30; &#X41; &#x61; &#X3042;

## 文例

### 文字参照の適用範囲

文字参照はほとんどのMarkdown構文中で有効だが、[コードブロック]と[コードスパン]の中には適用されずそのまま出力される。

``````markdown
```
&lt; &gt; &copy;
```

`&lt; &gt; &copy;`
``````

> ```
> &lt; &gt; &copy;
> ```
> 
> `&lt; &gt; &copy;`

(参考) それ以外はほぼ全ての構文で機能する。次は仕様書に書かれた特殊ケースの振る舞い(どれも通常使うことはないため一覧のみ)。

* URL → [Example 327](https://higuma.github.io/github-markdown-guide/gfm/#example-327)
* [リンク]タイトル → [Example 328](https://higuma.github.io/github-markdown-guide/gfm/#example-328)
* [リンク参照定義] → [Example 329](https://higuma.github.io/github-markdown-guide/gfm/#example-329)
* [コードブロック]のinfo文字列 → [Example 330](https://higuma.github.io/github-markdown-guide/gfm/#example-330)

### 文字参照の必要性

MarkdownではHTMLのマークアップ文字(特に`<`, `>`, `&`)は自動的に文字参照に変換されるため文字参照が必要になる状況は少ない。次はHTMLで文字参照が必要になる典型例で、タグに用いる`<`,`>`は文字参照で表現する必要がある。Markdownでもこの機能は使える。

```markdown
0 &lt; x &lt; 100
```

> 0 &lt; x &lt; 100

だがMarkdownでは`<`は自動的に変換されるためそのまま書けばよい。

```markdown
0 < x < 100
```

> 0 < x < 100

またMarkdownの書式設定と判別される可能性がある記号は[バックスラッシュエスケープ]を用いて処理すればよい。次の例はどちらも同じ結果になるが、文字参照より`\_`の方が楽に書けるし読みやすい。

```markdown
&UnderBar;not italic&UnderBar;

\_not italic_
```

> &UnderBar;not italic&UnderBar;
> 
> \_not italic_

Unicode仕様が作られた頃はまだ直接入力できる環境が少なく、ASCII文字を用いた入力手段として文字参照がよく用いられた。しかし今ではあらゆる作業環境がUnicodeに完全対応しており、特殊な文字も文字参照を使わず直接入力できる。次は文字参照を用いた場合の例。

```markdown
cr&eacute;me br&ucirc;l&egrave;e

&Integral;<sub>_S_</sub> ***D*** &CenterDot; d ***S*** = _Q_
```

> cr&eacute;me br&ucirc;l&egrave;e
> 
> &Integral;<sub>_S_</sub> ***D*** &CenterDot; d ***S*** = _Q_

これらも直接入力した方が明解で分かりやすい。

```markdown
créme brûlèe

∫<sub>_S_</sub> ***D*** · d ***S*** = _Q_
```

> créme brûlèe
> 
> ∫<sub>_S_</sub> ***D*** · d ***S*** = _Q_

### ノーブレークスペース

ただし[ノーブレークスペース]\(`&nbsp;` \[U+00A0])は文字間隔を調整する目的に利用できる。ノーブレークスペースは通常のスペースと異なり、その位置での改行抑制及び複数空白の縮約抑制の効果を持つ。

スペースはいくら連続してもHTMLがレンダリング処理を行う際に1個分に縮約して表示されるが、`&nbsp;`は個数分だけ間隔を確保する。

```markdown
Foo                    bar

Foo&nbsp;&nbsp;&nbsp;&nbsp;bar

Foo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bar
```

> Foo                    bar
> 
> Foo&nbsp;&nbsp;&nbsp;&nbsp;bar
> 
> Foo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bar

`&#160;`または`&#xA0`でもよい(どれも文字数は同じ)。

```markdown
Foo&#160;&#160;&#160;&#160;bar

Foo&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;bar
```

> Foo&#160;&#160;&#160;&#160;bar
> 
> Foo&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;bar

また「幅0のノーブレークスペース」としてWORD JOINER [U+2060]があり、文字参照`&NoBreak;`で記述できる。これは次のようにコードスパン先頭の空白除去防止に用いる事ができる。

```markdown
` EFG`

&NoBreak;` EFG`
```

> ` EFG`
> 
> &NoBreak;` EFG`

> この部分はやや高度な内容(必要なければ飛ばしてよい)。詳しくは[HTMLレンダリング処理での空白の縮約と除去](code-spans.md#htmlレンダリング処理での空白の縮約と除去)及び[先頭・末尾及び前後のスペースの制御](code-spans.md#先頭末尾及び前後のスペースの制御)を参照。

さらにUnicodeにはこれら以外にも様々な幅や用途を持つ空白文字が多数ある。一覧は次を参照。

https://en.wikipedia.org/wiki/Whitespace_character#Unicode

次の例は最も幅広のEM SPACE [U+2003]を用いたもの。文字参照`&emsp;`で記述できる。

```markdown
Foo&emsp;&emsp;bar

Foo&emsp;&emsp;&emsp;&emsp;bar
```

> Foo&emsp;&emsp;bar
> 
> Foo&emsp;&emsp;&emsp;&emsp;bar

(参考) なお文字コードを直接入力しても機能はする。次のコード例は`Foo`と`bar`の間にコードポイント値U+00A0を直接挿入したもの(→ [source](https://gist.github.com/higuma/e5835a29e87a1e2703a333d5beb3aa1d))。しかしこれではスペースと区別困難になるため推奨しない(文字参照を使わないと確認困難)。

```markdown
Foo     bar

Foo          bar
```

> Foo     bar
> 
> Foo          bar

------------------------------------------------------------------------

[6.1 バックスラッシュエスケープ](backslash-escapes.md)
← [目次](index.md) →
[6.3 コードスパン](code-spans.md)

[コードブロック]: code-blocks.md
[コードスパン]: code-spans.md
[ノーブレークスペース]: https://ja.wikipedia.org/wiki/ノーブレークスペース
[バックスラッシュエスケープ]: backslash-escapes.md
[リンク]: links.md
[リンク参照定義]: link-reference-definitions.md