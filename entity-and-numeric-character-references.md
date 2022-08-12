# [6.2 Entity and numeric character references](https://higuma.github.io/github-flabored-markdown/#entity-and-numeric-character-references)

[6.1 Backslash escapes](backslash-escapes.md)
← [Table of contents](index.md) →
[6.3 Code spans](code-spans.md)

------------------------------------------------------------------------

HTMLの[文字参照](https://html.spec.whatwg.org/multipage/syntax.html#character-references)を表現する。

## Best practice

Markdownでは使う必要はほとんどない。

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

## Summary

Markdownでは次の3種類すべて`&`で始まり`;`で終わる書式を用いる。

* [実体参照](#実体参照): `&{実体名};`
* [10進数文字参照](#10進数文字参照): `&#{コードポイントの10進表現};`
* [16進数文字参照](#16進数文字参照): `&#x{コードポイントの16進表現};`, `&#X{コードポイントの16進表現};`

### [実体参照](https://higuma.github.io/github-flabored-markdown/#entity-references)

実体参照(entity references)はHTMLの[名前付き文字参照](https://html.spec.whatwg.org/multipage/named-characters.html#named-character-references)と同じ書式を用いる。

```markdown
&lt; &gt; &amp; &copy;
```

> &lt; &gt; &amp; &copy;

ただしHTMLでは(後方互換対応のため)`;`を省略した表現も許可されているが、Markdownでは(文法明確化のため)必ず末尾の`;`が必要なことに注意。次はHTMLでは文字実体参照と認識されるが、Markdownでは認識されず文字通り出力する。

```markdown
&lt &gt &amp &copy
```

> &lt &gt &amp &copy

一覧は次の通り。

* [HTML標準仕様書](https://html.spec.whatwg.org/multipage/named-characters.html#named-character-references)
* [Markdown版](https://gist.github.com/higuma/36c7ff658c4b280b1dfbf802bae52356)

### [10進数文字参照](https://higuma.github.io/github-flabored-markdown/#decimal-numeric-character-references)

10進数文字参照(decimal numeric character references)は`&#{Unicodeコードポイントの10進表現};`の形式で表現する。

```markdown
&#48; &#65; &#97; &#12354;
```

> &#48; &#65; &#97; &#12354;


### [16進数文字参照](https://higuma.github.io/github-flabored-markdown/#hexadecimal-numeric-character-references)

16進数文字参照(hexadecimal numeric character references)は`&#x{Unicodeコードポイントの16進表現};`または`&#X{Unicodeコードポイントの16進表現};`の形式で表現する。

```markdown
&#x30; &#X41; &#x61; &#X3042;
```

> &#x30; &#X41; &#x61; &#X3042;

## Examples

MarkdownではHTMLのマークアップ文字(特に`<`, `>`, `&`)は自動的に文字参照に変換されるため使う必要がない。次はHTMLで文字参照が必要になる典型例。

```markdown
0 &lt; x &lt; 100
```

> 0 &lt; x &lt; 100

Markdownでは`<`は自動的に変換されるためそのまま書けばよい。

```markdown
0 < x < 100
```

> 0 < x < 100

ただしMarkdownの書式設定と判別される可能性がある文脈では[バックスラッシュエスケープ]を用いて処理する([\*shels](https://en.wikipedia.org/wiki/*shels)は米国のロックグループ)。

```markdown
\*shels
```

> \*shels

また今ではほぼ全ての環境がUnicode文字の直接入力に対応しているため、特殊記号も文字参照を使わず直接入力すればよい。次は文字参照を用いた場合。



```markdown
cr&eacute;me br&ucirc;l&egrave;e

&ClockwiseContourIntegral; D&CenterDot;dS = Q
```

> cr&eacute;me br&ucirc;l&egrave;e
> 
> &ClockwiseContourIntegral; D&CenterDot;dS = Q

これらも直接入力した方が明解で分かりやすい。

```markdown
créme brûlèe

∲ D·dS = Q
```

> créme brûlèe
> 
> ∲ D·dS = Q

------------------------------------------------------------------------

[6.1 Backslash escapes](backslash-escapes.md)
← [Table of contents](index.md) →
[6.3 Code spans](code-spans.md)

[バックスラッシュエスケープ]: backslash-escapes.md
