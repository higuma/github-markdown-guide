# 通常テキスト

[インライン]
← [目次] →
[太字、斜体、打ち消し線]

------------------------------------------------------------------------

## テキスト入力

Markdownでは[ASCII句読文字]を用いて書式設定を行う。ASCII句読文字に該当しないテキスト内の文字はそのまま出力する。

```markdown
abcde αβγδε あいうえお
```

> abcde αβγδε あいうえお

テキスト中の連続するスペースは1個に縮約して出力される。

```markdown
ABCDE      ΑΒΓΔΕ      アイウエオ
```

> ABCDE      ΑΒΓΔΕ      アイウエオ

> &#x2714;&#xFE0F; 多くのMarkdown処理実装ではMarkdown側で縮約を行う。また縮約せずそのまま出力するMarkdown実装もあるが、この場合は通常HTMLパーサ側で縮約が行われる(CSS設定に依存)。どちらの場合もHTMLブラウザに表示される最終出力は縮約された状態で表示されるため多くの場合は同じ結果になる。

## バックスラッシュエスケープ

[ASCII句読文字]に該当する文字をそのまま出力する場合は必要に応じて[バックスラッシュエスケープ]を用いる。次の例では最初の2行は[順序付きリスト]と認識する。これをリストではなく通常テキスト([パラグラフ])として認識させる場合は[ASCII句読文字]の`.`をエスケープする。

```markdown
123. これは順序付きリスト項目
123. そのためこれは`124`になる

123\. ピリオドをエスケープして順序付きリスト項目への認識を回避
123\. 行継続して連結
```

> 123. これは順序付きリスト項目
> 123. そのためこれは`124`になる
> 
> 123\. ピリオドをエスケープして順序付きリスト項目への認識を回避
> 123\. 行継続して連結

エスケープはMarkdown構文と判定される[ASCII句読文字]に対して行うことに注意。次のように[ASCII句読文字]以外をエスケープするとリストへの認識は防止できるが先頭の`\`が表示される。

```markdown
\123. ← リストではないが先頭にバックスラッシュが残る

123\. ← これならバックスラッシュが残らない
```

> \123. ← リストではないが先頭にバックスラッシュが残る
> 
> 123\. ← これならバックスラッシュが残らない

> &#x2714;&#xFE0F; エスケープ候補箇所が色々考えられ、どこに付けたらよいか分からない場合は全ての[ASCII句読文字]をエスケープしてもよい。バックスラッシュエスケープに関する詳細仕様は実装により異なる場合がある。可能性がありそうな場所に付けておくと他環境での誤認識防止に役立つ。

## 文字参照の応用

Markdownでは通常の文字に関しては文字参照の必要性は低い。文法はテキスト優先のため、`<`, `>`, `/`, `"`, `'`のようなHTMLタグに用いられる文字もそのまま入力してよい。これらはHTMLへの変換処理時に検出され、適切に対応する文字参照へと変換される。

例えば次の場合はHTMLでは文字参照を用いないと記述できない。

```markdown
0 &lt; x &lt; 100
```

> 0 &lt; x &lt; 100

だがMarkdownでは`<`は自動的に変換されるためそのまま書けばよい。

```markdown
0 < x < 100
```

> 0 < x < 100

Markdownではこのようなケースで文字参照を用いる必要はない。それよりもUnicodeの機能を用いた書式制御に関して文字参照が有用なケースがいくつかある。

### ノーブレークスペース

[ノーブレークスペース] `&nbsp;` (U+00A0))は文字間隔を調整する目的に利用できる。ノーブレークスペースは通常のスペースと異なり、その位置での改行抑制及び複数空白の縮約抑制の効果を持つ。スペースはいくら連続しても1個分に縮約されるが、`&nbsp;`は個数分だけ間隔を確保する。

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

さらにUnicodeにはこれら以外にも様々な幅や用途を持つ空白文字がある。一覧は次を参照。

https://en.wikipedia.org/wiki/Whitespace_character#Unicode

次の例は最も幅広のEM SPACE (U+2003)を用いたもの。文字参照`&emsp;`で記述できる。

```markdown
Foo&emsp;&emsp;bar

Foo&emsp;&emsp;&emsp;&emsp;bar
```

> Foo&emsp;&emsp;bar
> 
> Foo&emsp;&emsp;&emsp;&emsp;bar

(参考) なお文字コードを直接入力しても機能はする。次のコード例は`Foo`と`bar`の間にコードポイント値U+00A0を直接挿入したもの(→ [ソースコード](src/nbsp-direct-insertion.rb))。しかしこれではスペースと区別困難になるためあまり勧められない(文字参照を使わないと確認困難)。

```markdown
Foo     bar

Foo          bar
```

> Foo     bar
> 
> Foo          bar

### 書式制御文字

> &#x2714;&#xFE0F; やや高度。[太字]と[斜体]を学んでから読むとよい。

Unicodeカテゴリー [Cf](https://www.compart.com/en/unicode/category/Cf) (format) に属する文字は主に書式制御に用いられる。これらの中でMarkdown文書作成時に有用な文字をいくつか紹介する(→ [Wiki](https://ja.wikipedia.org/wiki/Unicode文字のマッピング#その他の特殊用途文字))。

| 名称 | コード | 文字参照 |
| :-: | :-: | :-: |
| [ソフトハイフン]<br>([Soft Hyphen](https://en.wikipedia.org/wiki/Soft_hyphen)) | U+00AD | `&shy;`, `&#xAD;` |
| [ゼロ幅スペース]<br>([Zero-width space](https://en.wikipedia.org/wiki/Zero-width_space)) | U+200B | `&ZeroWidthSpace;`, `&#x200B;` |
| [ゼロ幅非接合子]<br>([Zero-width non-joiner (ZWNJ)](https://en.wikipedia.org/wiki/Zero-width_non-joiner)) | U+200C | `&zwnj;`, `&#x200C;` |
| [ゼロ幅接合子]<br>([Zero-width joiner (ZWJ)](https://en.wikipedia.org/wiki/Zero-width_joiner)) | U+200D | `&zwj;`, `&#x200D;` |
| [単語結合子]<br>([Word joiner (WJ)](https://en.wikipedia.org/wiki/Word_joiner)) | U+2060 | `&NoBreak;`, `&#x2060;` |

これらはみな「幅0で非表示の制御文字」としての機能を持ち、[太字]と[斜体]の制御に用いることができる。太字や斜体を認識させるには境界にスペースを入れる場合が多いが、スペースなしで密着した状態で認識させる場合は代わりにこれらの文字を用いることで解決できる。

強調書式に`_`を用いる場合の典型例を示す。

- 認識しないケース: `A_B_C` → A_B_C (`B`が斜体にならない)
- スペース挿入による解決法: `A _B_ C` → A _B_ C
- 密着状態で認識(スペースを`&shy;`に置き換え): `A&shy;_B_&shy;C` → A&shy;_B_&shy;C

強調書式に`*`を用いる場合の例も示す。

- 認識しないケース: `A**"B"**C` → A**"B"**C (`"B"`が太字にならない)
- スペース挿入による解決法: `A **"B"** C` → A **"B"** C
- 密着状態で認識: `A&shy;**"B"**&shy;C` → A&shy;**"B"**&shy;C

#### 折り返し動作の違い

GitHub Markdownでは表示幅に対して十分短いテキストであれば上記のどれを使ってもよい。文例として次のようなテキストを考える。`Regular`の部分を通常、`Italic`を斜体で表示する。表示幅が十分あれば`&shy;`の代わりに`&ZeroWidthSpace;`や`&NoBreak;`などを使っても変わりはない。

```markdown
Regular&shy;_Italic_&shy;Regular&shy;_Italic_&shy;Regular
```

> Regular&shy;_Italic_&shy;Regular&shy;_Italic_&shy;Regular

しかし折り返しが発生する場合は動作に違いを生じる。まず[ソフトハイフン]\(`&shy;`)と[ゼロ幅スペース]\(`&ZeroWidthSpace;`)は共に単語区切りとしての意味を持ち、折り返し位置の候補として扱われるが、折り返し発生時の処理が両者で異なる。

[ソフトハイフン]\(`&shy;`)は折り返しが発生すると末尾に`-`を挿入する。これを示すために[表]を用い、左端にテスト用テキスト、その右に折り返しを意図的に発生させるためダミーセルを配置する。

```markdown
| text | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X |
| ---- | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
| Regular&shy;_Italic_&shy;Regular&shy;_Italic_&shy;Regular |
```

結果は次の通り。折り返し位置に`-`を挿入する。

> | text | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X |
> | ---- | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
> | Regular&shy;_Italic_&shy;Regular&shy;_Italic_&shy;Regular |

これを[ゼロ幅スペース]\(`&ZeroWidthSpace`)に変更すると折り返し位置には何も挿入しない。

```markdown
| text | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X |
| ---- | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
| Regular&ZeroWidthSpace;_Italic_&ZeroWidthSpace;Regular&ZeroWidthSpace;_Italic_&ZeroWidthSpace;Regular |
```

> | text | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X |
> | ---- | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
> | Regular&ZeroWidthSpace;_Italic_&ZeroWidthSpace;Regular&ZeroWidthSpace;_Italic_&ZeroWidthSpace;Regular |

残りの3つには折り返し抑制効果があり、(ブラウザが表示可能な範囲までは)折り返しを発生させない。

```markdown
| text | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X |
| ---- | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
| Regular&zwnj;_Italic_&zwnj;Regular&zwnj;_Italic_&zwnj;Regular |

| text | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X |
| ---- | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
| Regular&zwj;_Italic_&zwj;Regular&zwj;_Italic_&zwj;Regular |

| text | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X |
| ---- | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
| Regular&NoBreak;_Italic_&NoBreak;Regular&NoBreak;_Italic_&NoBreak;Regular |
```

> | text | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X |
> | ---- | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
> | Regular&zwnj;_Italic_&zwnj;Regular&zwnj;_Italic_&zwnj;Regular |
> 
> | text | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X |
> | ---- | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
> | Regular&zwj;_Italic_&zwj;Regular&zwj;_Italic_&zwj;Regular |
> 
> | text | A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X |
> | ---- | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - | - |
> | Regular&NoBreak;_Italic_&NoBreak;Regular&NoBreak;_Italic_&NoBreak;Regular |

> <details>
> <summary>&#x2714;&#xFE0F; <strong><code>&amp;zwnj;</code>, <code>&amp;zwj;</code>, <code>&amp;NoBreak;</code>の違い</strong></summary>
> 
> GitHub Markdown上ではどれも同じ結果になるが、これら3種類の制御文字は元々Unicodeでは異なる意味を持つ。
> 
> [ゼロ幅非接合子]\(`&zwnj;`)と[ゼロ幅接合子]\(`&zwj;`)はもともとタイポグラフィーの[合字]\([Ligature](https://en.wikipedia.org/wiki/Ligature_(writing)))の制御が目的で、前後を合字として扱う場合に`&zwj;`、また合字ではないことを明示する場合に`&zwnj;`を用いる。
> 
> 次は合字の例で、`oe`には合字表現の`œ`が存在する(U+0153, `&oelig;`)。また`o&zwnj;e`という表現も可能で、これを合字と認識するかどうかはCSSの[font-variant-ligatures](https://developer.mozilla.org/ja/docs/Web/CSS/font-variant-ligatures)の設定に依存する(ただしMarkdown環境でこれを有効にしているものはまずないと思ってよい)。
> 
> - `Schoenberg` → Schoenberg (別々に表示)
> - `Scho&zwj;enberg` → Scho&zwj;enberg (合字が適用されるかどうかはCSS設定に依存)
> - `Sch&oelig;nberg` → Sch&oelig;nberg (常に合字で表示)
> 
> また`&zwj;`には最近新たな意味が加えられた。Unicodeでは絵文字の導入を積極的に進めており、複数の絵文字コードを`&zwj;`で連結して複合絵文字を表現する仕様を発表している。これは急速に普及しており、現在は多くのブラウザがサポートしている(→ [仕様解説](https://github.com/higuma/markdown-emoji-test/blob/main/README.ja.md##ゼロ幅接合子シーケンス)、→ [一覧](https://github.com/higuma/markdown-emoji-test/blob/main/ja/zwj-sequences.md))。

> 一方の`&zwnj;`はデフォルトで合字が適用される言語(アラビア語やペルシャ語など)に対してよく用いられる(Wiki → [ゼロ幅非接合子])。
> 
> 最後に[単語結合子]\(`&NoBreak;`)は[ゼロ幅スペース]\(`&ZeroWidthSpace;`)とほぼ同じ意味だが、折り返しに対する動作が異なる。`&ZeroWidthSpace;`はその位置での折り返しを許容するが、`&NoBreak;`はその逆で折り返しを抑制する。
> </details>

### 絵文字

近年のUnicodeコンソーシアムは絵文字対応を積極的に推進しており、現在はWebブラウザなどでも絵文字が普通に使えるようになっている。MarkdownからもUnicode絵文字の入力を行うことができるが、それには最低限のUnicode絵文字に関する知識が必要になる。

#### 異体字セレクタ

Unicodeで絵文字表現可能な文字コードには2種類ある。

* 絵文字専用コード(例: U+1F9F2 → &#x1F9F2;)
* テキスト・絵文字共有コード(例: U+2601 → &#x2601;&#xFE0E;, &#x2601;&#xFE0F;)

文字コードがテキスト・絵文字両方の表現を持つ場合、その選択にVS15(U+FE0E)またはVS16(U+FE0F)を用いる。これらは異体字セレクタ(Variation selectors)と呼ばれ、同じ文字コードに対して表現が複数ある場合に用いられる。

https://en.wikipedia.org/wiki/Variation_Selectors_(Unicode_block)

対象文字コードの後にVS15(テキスト指定)またはVS16(絵文字指定)を追加して表現を指定する。VS15/16は片方の表現しか持たない文字に対しては単に無視される。適用例は次の通り。U+0041はテキストのみの例、U+1F9F2は絵文字のみ。またU+00A9とU+2601は両方が可能でVS15/16で表示を選択する。

| 文字 | デフォルト | VS15あり | VS16あり |
| :-: | :-: | :-: | :-: |
| U+0041 | `&#x0041;`<br>&#x0041; | `&#x0041;&#xFE0E;`<br>&#x0041;&#xFE0E; | `&#x0041;&#xFE0F;`<br>&#x0041;&#xFE0F; |
| U+00A9 | `&#x00A9;`<br>&#x00A9; | `&#x00A9;&#xFE0E;`<br>&#x00A9;&#xFE0E; | `&#x00A9;&#xFE0F;`<br>&#x00A9;&#xFE0F; |
| U+2601 | `&#x2601;`<br>&#x2601; | `&#x2601;&#xFE0E;`<br>&#x2601;&#xFE0E; | `&#x2601;&#xFE0F;`<br>&#x2601;&#xFE0F; |
| U+1F9F2 | `&#x1F9F2;`<br>&#x1F9F2; | `&#x1F9F2;&#xFE0E;`<br>&#x1F9F2;&#xFE0E; | `&#x1F9F2;&#xFE0F;`<br>&#x1F9F2;&#xFE0F; |

なおデフォルト(VS15/16なし)の場合にどちらが選択されるかはMarkdown処理環境とHTML変換後の表示環境に依存する。環境が一方しか対応していない場合や、あるいは未対応で表示できない場合もある。

#### テキスト/絵文字の切り替え

>  &#x26A0;&#xFE0F; **重要**: 一般的なMarkdown解説にはまず書いていない内容だが**必読**。現在のGitHub Markdown環境ではこの知識がないと解決できないケースが時々発生する。

GitHub Markdownはかなり極端な絵文字優先の仕様で、他の大多数の環境ではデフォルトがテキストの`↔`(U+2194)のような文字も絵文字デフォルトに設定されている。そのため次のようなテキストを書いた場合に困った問題が発生する。

```markdown
左 ↔ 右
```

結果は次の通り。GitHubのMarkdown環境では`↔`が絵文字になってしまう。

> 左 ↔ 右

これを解決するのに異体字セレクタの知識が必要になる。テキスト書体指定のVS15(U+FE0E)を追加して次のように修正すればよい。

```markdown
左 ↔&#xFE0E; 右
```

> 左 ↔&#xFE0E; 右

逆にテキスト表現がデフォルトの文字に対して絵文字表現を指定する場合はVS16を用いる。`©`(U+00A9)には絵文字表現も存在し、VS16を追加すれば絵文字で表示する。

```markdown
©&#xFE0F;
```

> ©&#xFE0F;

なお前に述べた通り、文字のデフォルト表現がテキスト/絵文字のどちらになるかは文字コードだけでなく、処理環境及び表示環境にも依存する。GitHub Markdown環境で絵文字表現が可能な全文字の表示状況は次を参照すること(実環境で調査済み)。

https://github.com/higuma/markdown-emoji-test/blob/main/ja/basic-emojis.md

> &#x2714;&#xFE0F; またUnicodeには複数コードのシーケンスを用いてより複雑な絵文字を表現する仕様が多数ある。本解説の範囲からは外れるが興味のある人は次を参照。
> 
> https://github.com/higuma/markdown-emoji-test/blob/main/README.ja.md

------------------------------------------------------------------------

[インライン]
← [目次] →
[太字、斜体、打ち消し線]

[ASCII句読文字]: characters.md#ascii句読文字
[インライン]: inlines.md
[ゼロ幅スペース]: https://ja.wikipedia.org/wiki/ゼロ幅スペース
[ゼロ幅接合子]: https://ja.wikipedia.org/wiki/ゼロ幅接合子
[ゼロ幅非接合子]: https://ja.wikipedia.org/wiki/ゼロ幅非接合子
[ソフトハイフン]: https://ja.wikipedia.org/wiki/ソフトハイフン
[バックスラッシュエスケープ]: characters.md#バックスラッシュエスケープ
[パラグラフ]: paragraphs.md
[ノーブレークスペース]: https://ja.wikipedia.org/wiki/ノーブレークスペース
[合字]: https://ja.wikipedia.org/wiki/合字
[表]: tables.md
[斜体]: bold-italic-strikethrough.md#斜体
[順序付きリスト]: lists.md#順序付きリスト
[単語結合子]: https://ja.wikipedia.org/wiki/単語結合子
[太字]: bold-italic-strikethrough.md#太字
[太字、斜体、打ち消し線]: bold-italic-strikethrough.md
[目次]: index.md#texts
