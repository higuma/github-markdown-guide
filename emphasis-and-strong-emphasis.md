# [6.4 斜体と太字](https://higuma.github.io/github-markdown-guide/#emphasis-and-strong-emphasis)

[6.3 コードスパン](code-spans.md)
← [目次](index.md) →
[6.5 打ち消し線](strikethrough-extension.md)

------------------------------------------------------------------------

## Best practice

## Summary

* 斜体は`*...*`または`_..._`
* 太字は`**...**`または`__...__`
* 斜体太字は`***...***`または`___...___`






## Examples

### 強調記号

強調記号は

* 斜体は`*...*`または`_..._`
* 太字は`**...**`または`__...__`
* 斜体太字は`***...***`または`___...___`

### スペースで区切られている場合

強調対象となる語の前後がスペース(または文頭/文末)で栗切られている場合は次のように強調文字の外側をスペースまたは文頭/文末とし、強調する文字の先頭と末尾が非空白文字であればよい。

* `*italic* _italic_` → *italic* _italic_
* `**bold** __bold__` → **bold** __bold__
* `***bold italic*** ___bold italic___` → ***bold italic*** ___bold italic___

### 密着している場合

強調書式の前後とも英数字の場合は`*`だけが強調文字として認識される(`_`は効かない)。

* `aa*bb*cc 11_22_33` → aa*bb*cc 11_22_33
* `11**22**33 aa*__bb__cc` → 11**22**33 aa__bb__cc
* `aa***bb***cc 11___22___33` → aa***bb***cc 11___22___33

強調文字列内部の境界文字が英数字ではない区切り文字の場合は強調書式の外側の境界文字で判定し、全て空白または区切り文字であれば強調書式が適用される。

* `*!Italic!* __(Bold)__ ***"Bold italic"***` → *!Italic!* __(Bold)__ ***"Bold italic"***
* `|*!Italic!*|__(Bold)__|***"Bold italic"***|` → |*!Italic!*|__(Bold)__|***"Bold italic"***|

それ以外(英数字や日本語文字など)が密着していると強調ではないと判定する。以下の例文では手前の文字`0`,`A`,`あ`の後に空白または区切り文字がある場合に強調、密着していれば強調ではないと判定していることに注意

* `0 *!italic!* BUT 0*!not!*` → 0 *!italic!* BUT 0*!not!*
* `A-__;bold;__ BUT A__;not;__` → A-__;bold;__ BUT A__;not;__
* `あ ***'bold italic'*** BUT あ***'not'***` → `あ ***'bold italic'*** BUT あ***'not'***

### ネスト

斜体と太字は互いにネスト可能。

* `_italic **bold italic**_` → _italic **bold italic**_
* `__bold *bold italic*__` → __bold *bold italic*__

ネストはできてもオーバーラップはできない。次は失敗例で、受け付けてもらえず中途半端な結果になる。

* `_italic **bold italic_ bold**` → _italic **bold italic_ bold**
* `**bold _bold italic** italic_` → **bold _bold italic** italic_

> 正しくは次の通り。
> 
> * `_italic **bold italic**_ **bold**` → _italic **bold italic**_ **bold**
> * `**bold _bold italic_** _italic_` → **bold _bold italic_** _italic_


次(Example 378, 382)は斜体(`<em>`)の2重掛けと認識される。同じものを複数回ネストしても1回分と同じで、(CSSを駆使して特殊な設定を行わない限り)全体が斜体になる以上の効果はない。

`*(*foo*)* _(_foo_)_` → *(*foo*)* _(_foo_)_

境界が空白で明確化されている場合は次のように同種の文字を使っても認識する。

* `*italic **bold italic***` → *italic **bold italic***
* `**bold *bold italic***` → **bold *bold italic***

密着している場合は外側に`_`、内側に`*`を用いる。

* `_Italic**Bold italic**Italic_` → _Italic**Bold italic**Italic_
* `__Bold*Bold italic*Bold__` → __Bold*Bold italic*Bold__

> (参考) 逆にするとうまくいかない。次は失敗例。
> 
> * `*Italic__Bold-italic__Italic*` → *Italic__Bold-italic__Italic*
> * `**Bold_Bold-italic_Bold**` → **Bold_Bold-italic_Bold**

### バックスラッシュエスケープと文字参照

強調構文の内部ではバックスラッシュエスケープと文字参照が有効で、これらを用いて内部の`*`や`_`を通常文字として認識させることができる。まずバックスラッシュエスケープを使った場合。

* `_italic \*\*not bold italic\*\*_` → _italic \*\*not bold italic\*\*_
* `**bold \_not bold italic\_**` → **bold \_not bold italic\_**

文字参照でも同じことができる(バックスラッシュエスケープの方が楽なので参考)。

* `_italic &ast;&ast;not bold italic&ast;&ast;_` → _italic &ast;&ast;not bold italic&ast;&ast;_
* `**bold &UnderBar;not bold italic&UnderBar;**` → **bold &UnderBar;not bold italic&UnderBar;**

### スネークケース

aa_bb_ccのような[「スネークケース」(Snake case, snake_case)](https://en.wikipedia.org/wiki/Snake_case)と呼ばれる記法は、GFMではそのまま書くことができる。

> 前後に空白文字がない場合は`*`だけ強調書式と認識し、`_`は認識しないことに注意。これはスネークケースを考慮した仕様で、`aa_bb_cc`の中間の`_`はそのまま文字として扱われる。

スネークケース全体に対する強調書式は普通に書けばよい。

* `_aa_bb_cc_ *xx_yy_zz*` → _aa_bb_cc_ *xx_yy_zz*
* `__aa_bb_cc__ **xx_yy_zz**` → __aa_bb_cc__ **xx_yy_zz**
* `___aa_bb_cc___ ***xx_yy_zz***` → ___aa_bb_cc___ ***xx_yy_zz***

入れ子にして途中だけ書式を追加する場合は外側に`_`、内側に`*`を用いる(中間に書式設定ではない文字の`_`があるため逆はできない)。次は全体を太字、`bb`だけ斜体太字にする例。

* `__aa_*bb*_cc_dd__` → __aa_*bb*_cc_dd__

ただし同じ方法で全体を斜体、`bb`を斜体太字にしようとすると`_aa_`, `**bb**`, `_cc_dd_`の3つと認識される。中間の`_`が消え、`bb`は太字のみの書式設定になる。

* `_aa_**bb**_cc_dd_` → _aa_**bb**_cc_dd_

正解は次の通り。文字と認識させたい部分をバックスラッシュエスケープすればよい。

* `_aa\_**bb**\_cc_dd_` → _aa\_**bb**\_cc_dd_

### インライン構文の挿入

内部に別のインライン構文を挿入できる。まず次は表示効果も効くもの。

* 打ち消し線
* リンク

文例

* `__bold ~~strikethrough~~__` → __bold ~~strikethrough~~__
* `_italic [link](https:///www.example.com/)_` → _italic [link](https:///www.example.com/)_

挿入はできるが表示効果は効かないもの。

* コードスパン
* 画像

### 日本語の斜体

これはMarkdownではなくHTMLレンダリング処理に関するものだが「日本語に斜体が効かない」という有名な問題がある。メイリオなどのフォントが適用される場合、英数字や他のアルファベット(ギリシャ文字やキリル文字など)はよいが、日本語に使われる文字に対して斜体が効かない。

https://web-365.biz/made_in_wordpress/webfont-how-to-italic

なおギリシャ文字は上記のように斜体が効くが、日本語で使う文字の多くは効かない。

------------------------------------------------------------------------

[6.3 コードスパン](code-spans.md)
← [目次](index.md) →
[6.5 打ち消し線](strikethrough-extension.md)
