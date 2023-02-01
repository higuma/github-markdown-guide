# 太字、斜体、打ち消し線

[通常テキスト](texts.md)
← [目次](index.md) →
[リンク](links.md)

------------------------------------------------------------------------

> **TODO**: いったん自分なりに書いてみたが、その後GFM仕様書と突き合わせて仕様表現を見直し中。おおそらく全面書き直しまたはそれに近いことになると思う。

Markdown標準の表示効果は[太字]、[斜体]、[打ち消し線]の3種類ある。[太字]はHTML要素の[`<strong>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/strong)、[斜体]は[`<em>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/em)、打ち消し線は[`<del>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/del)にそれぞれ変換される。またこれらを組み合わせて太字斜体、打ち消し線付き太字なども表現できる。

## 太字

`**テキスト**`または`__テキスト__`のように表示効果を与える対象テキストの前後を`**`または`__`で囲む。これはHTMLの[`<strong>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/strong)に変換され、ブラウザ上では太字で表示される。

```markdown
**text テキスト**

__text テキスト__
```

> **text テキスト**
> 
> __text テキスト__

## 斜体

`*text*`または`_text_`のように表示効果を与える対象テキストの前後を`*`または`_`で囲む。これはHTMLの[`<em>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/em)に変換され、ブラウザ上では斜体で表示される。

```markdown
*text テキスト*

_text テキスト_
```

> *text テキスト*
> 
> _text テキスト_

> **重要**: Windows環境では`テキスト`の部分が斜体にならない場合がとても多い。ただしこれはWindow環境側の問題によるものであり、

### 斜体とWindowsフォント

**重要**) Windows上の表示環境では日本語文字に対して斜体が機能せず通常表示になる場合がとても多い。そこで本解説では全ての表示環境で同等の出力を保証するため、基本的に斜体のコード例は全て英数字を用いている。詳しくは本章最後の [補足 - 斜体と日本語](#補足-斜体と日本語) で説明する。

> 
> 次は動作確認用(ここだけ例外的に日本語に斜体を設定)。表示環境(具体的にはブラウザ)が表示フォントとしてWindows標準の[メイリオ]\(または同等の設定を持つフォント)を使用している場合は日本語部分に斜体が効かず`テキスト`が通常表示になる。
> 
> ```markdown
> *text テキスト*
> ```
> 
> > *text テキスト*

## 打ち消し線

`~~text~~`のように表示効果を与える対象テキストの前後を`~~`で囲む。これはHTMLの[`<del>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/del)に変換され、ブラウザ上では横線を重ねた状態で表示される。

```markdown
~~text テキスト~~
```

> ~~text テキスト~~

## 組み合わせ

[斜体]、[太字]、[打ち消し線]の3つをネストして組み合わせて用いることができる。組み合わせ方法は多数あるがみな同様の表示結果になるため、ここではそれぞれ一番覚えやすそうなものを代表として1種類だけ示す。

### 太字+斜体

```markdown
***bold+italic***
```

> ***bold+italic***

<details>
<summary>組み合わせ一覧(6通り)</summary>

- `***bold+italic***` → ***bold+italic***
- `___bold+italic___` → ___bold+italic___
- `**_bold+italic_**` → **_bold+italic_**
- `__*bold+italic*__` → __*bold+italic*__
- `*__bold+italic__*` → *__bold+italic__*
- `_**bold+italic**_` → _**bold+italic**_

</details>

### 太字+打ち消し線

```markdown
~~**bold+strikeout**~~
```

> ~~**bold+strikeout**~~

<details>
<summary>組み合わせ一覧(4通り)</summary>

- `**~~bold+strikeout~~**` → **~~bold+strikeout~~**
- `__~~bold+strikeout~~__` → __~~bold+strikeout~~__
- `~~**bold+strikeout**~~` → ~~**bold+strikeout**~~
- `~~__bold+strikeout__~~` → ~~__bold+strikeout__~~

</details>

### 斜体+打ち消し線

```markdown
~~*italic+strikeout*~~
```

> ~~*italic+strikeout*~~

<details>
<summary>組み合わせ一覧(4通り)</summary>

- `*~~italic+strikeout~~*` → *~~italic+strikeout~~*
- `_~~italic+strikeout~~_` → _~~italic+strikeout~~_
- `~~*italic+strikeout*~~` → ~~*italic+strikeout*~~
- `~~_italic+strikeout_~~` → ~~_italic+strikeout_~~

</details>

### 太字+斜体+打ち消し線

```markdown
~~***bold+italic+strikeout***~~
```

> ~~***bold+italic+strikeout***~~

<details>
<summary>組み合わせ一覧(20通り)</summary>

- `***~~bold+italic+strikeout~~***` → ***~~bold+italic+strikeout~~***
- `**_~~bold+italic+strikeout~~_**` → **_~~bold+italic+strikeout~~_**
- `__*~~bold+italic+strikeout~~*__` → __*~~bold+italic+strikeout~~*__
- `___~~bold+italic+strikeout~~___` → ___~~bold+italic+strikeout~~___
- `**~~*bold+italic+strikeout*~~**` → **~~*bold+italic+strikeout*~~**
- `**~~_bold+italic+strikeout_~~**` → **~~_bold+italic+strikeout_~~**
- `__~~*bold+italic+strikeout*~~__` → __~~*bold+italic+strikeout*~~__
- `__~~_bold+italic+strikeout_~~__` → __~~_bold+italic+strikeout_~~__
- `*__~~bold+italic+strikeout~~__*` → *__~~bold+italic+strikeout~~__*
- `_**~~bold+italic+strikeout~~**_` → _**~~bold+italic+strikeout~~**_
- `*~~**bold+italic+strikeout**~~*` → *~~**bold+italic+strikeout**~~*
- `*~~__bold+italic+strikeout__~~*` → *~~__bold+italic+strikeout__~~*
- `_~~**bold+italic+strikeout**~~_` → _~~**bold+italic+strikeout**~~_
- `_~~__bold+italic+strikeout__~~_` → _~~__bold+italic+strikeout__~~_
- `~~***bold+italic+strikeout***~~` → ~~***bold+italic+strikeout***~~
- `~~**_bold+italic+strikeout_**~~` → ~~**_bold+italic+strikeout_**~~
- `~~__*bold+italic+strikeout*__~~` → ~~__*bold+italic+strikeout*__~~
- `~~___bold+italic+strikeout___~~` → ~~___bold+italic+strikeout___~~
- `~~*__bold+italic+strikeout__*~~` → ~~**_bold+italic+strikeout_**~~
- `~~_**bold+italic+strikeout**_~~` → ~~_**bold+italic+strikeout**_~~

</details>

## ネスト

これら3種類の書式は互いに部分的にネストすることも可能で、例えば全体が太字でその中の一部が太字+斜体の場合は次のように書いてよい。

```markdown
**Bold _and italic_**
```

> **Bold _and italic_**

> `**Bold *and italic***`でもよいが、同じ記号を使うと文法上の認識に問題を生じやすい。またそれぞれのネスト範囲を明示する意味で記号を分けた方が見た目も意味が分かりやすい。

ネスト(入れ子)構造に従っていればどのような組み合わせも可能。

```markdown
**太字で~~さらに取り消し線~~の後で太字に戻る**

_Italic **and bold ~~and strikeout~~** → back to italic_
```

> **太字で~~さらに取り消し線~~の後で太字に戻る**
> 
> _Italic **and bold ~~and strikeout~~** → back to italic_

ただしネストはできてもオーバーラップはできない。次は(意図的に作った)失敗例で、`**...**`の範囲を太字、`_..._`の範囲を斜体、そして両者の共通部分は斜体+太字に設定しようとしたもの。しかしネスト構造の条件を満たしていないため意図した通りに文法認識してもらえない。

```markdown
**Bold _bold+italic** italic_
```

> **Bold _bold+italic** italic_

正しくは次の通り。ネスト構造に従って記述する必要があるため`bold+italic`の後でいったん書式設定を終了し、その後で`italic`を単独の斜体に設定する。

```markdown
**Bold _bold+italic_** _italic_
```

> **Bold _bold+italic_** _italic_

## エスケープ

通常テキストの中に`*`,`_`,`~~`が含まれており、表示効果の書式と一致する場合は適宜[バックスラッシュエスケープ]を用いて表示効果ではないことを認識させる。全てをエスケープする必要はなく、文法認識の起点となる部分をエスケープすればよい。

```markdown
\*not italic*

\_not italic_

\~~取り消し線ではない~~
```

> \*not italic*
> 
> \_not italic_
> 
> \~~取り消し線ではない~~

> (参考) 代わりに[文字参照]を用いてもよい。ただし[バックスラッシュエスケープ]の方が楽に書ける。
> 
> ```markdown
> &ast;not italic*
> ```
> 
> > &ast;not italic*

ただし太字の場合に注意。エスケープ1つだけでは足りず、残りの部分が斜体と認識される。先頭の2つを両方エスケープしてやっと通常文字と認識される。

```markdown
\**italic surrounded by asterisks**

\__italic surrounded by underscores__

\*\*normal text**

\_\_normal text__
```

> \**italic surrounded by asterisks**
> 
> \__italic surrounded by underscores__
> 
> \*\*normal text**
> 
> \_\_normal text__

太字斜体も同様で、先頭の3つ全てエスケープする必要がある。`*`の場合のみ示す(`_`も同様)。

```markdown
***bold and italic***

\***bold surrounded by asteriks***

\*\**italic surrounded by double-asteriks***

\*\*\*normal text***
```

> ***bold and italic***
> 
> \***bold surrounded by asteriks***
> 
> \*\**italic surrounded by double-asteriks***
> 
> \*\*\*normal text***

別のケースとして書式設定対象テキストが`*`や`_`を含んでおり、そこで書式終了と認識される場合もエスケープを用いて対応する。次の文例は"What's the f\*\*k up!?"という文章を太字に設定しようとしたものだが、中間に`**`があるためそこで太字終了と認識されてしまう。

```markdown
**What's the f**k up!?**
```

> **What's the f**k up!?**

このような場合に文内の`*`をエスケープすることで解決できる。

```markdown
**What's the f\*\*k up!?**
```

> **What's the f\*\*k up!?**

> (注意) 以上はGitHub Markdownの場合で、異なるMarkdown実装では詳細動作が異なることが多い。他のMarkdown環境上でも使う可能性がある文章には考えられ得る箇所全てをエスケープしておく方動作の詳細はMarkd

## 太字と斜体の文法認識

太字と斜体の文法認識はもともと英文のように単語をスペースで区切る文書を想定した仕様になっている。また[GFM]仕様のMarkdownでは書式設定テキスト内に`_`が含まれる場合(特に[スネークケース])を考慮し、`*`と`_`の扱いが非対称な仕様になっている。

### 空白で区切られている場合

設定対象テキストの前後が空白または文頭/文末で区切られている場合の判定条件をパターンとして示す。簡単に言えば書式記号(`*`,`_`,`**`,`__`)の前後にある空白(または文頭/文末)を検出して書式範囲の開始・終了を認識する。

- 開始パターン
  1. 空白または文頭
  2. `*`, `_`, `**`, `__`のいずれか
  3. 非空白文字(書式対象文字列の最初)
- 終了パターン
  1. 非空白文字(書式対象文字列の最後)
  2. `*`, `_`, `**`, `__`のいずれか(開始と同一のもの)
  3. 空白または文末

```markdown
**bold** _italic_ ***bold+italic***
```

> **bold** _italic_ ***bold+italic***

なお`***bold+italic***`のケースは2段階で評価される。まず外側の`*...*`を検出し、その内部を斜体に設定する。次に内側の`**...**`を検出し、その内部を太字に設定する。

> この斜体が太字より優先する仕様は[GFM]仕様書原文で確認した。[Example 425](https://github.github.com/gfm/#example-425)の出力を見ると`<em>`の内側に`<strong>`を生成している。またブラウザの開発ツールで実際の出力を確認しても結果は一致する。ただし実用上は特に知る必要はなくどちらでも構わない(逆でも出力は同等)。

### 密着している場合

対象テキストの前後が空白または文頭/文末でない場合は条件が変化する。

まず**書式記号の前後とも英数字の場合**は`*`だけを認識し、`_`は通常文字扱いでそのまま表示する。このルールにより[スネークケース](例 - `MAX_DATA_SIZE`)を通常テキストとして記述する場合に中間の`_`をエスケープせずそのまま記述できる。

```markdown
abc*123*xyz abc_123_xyz
```

> abc*123*xyz abc_123_xyz

```markdown
123**abc**456 123__abc__456
```

> 123**abc**456 123__abc__456

```markdown
abc***123***xyz abc___123___xyz
```

> abc***123***xyz abc___123___xyz

対象テキスト側の境界(先頭文字と末尾文字)が[句読文字]の場合は書式記号を挟んだ反対側にある外側の境界文字で判定する。外側の境界文字が空白または句読文字であれば書式の境界、それ以外は境界ではないと判定し、前後に同種の境界があればその内部を書式設定範囲とする。

次のコード例は全て内部が

```markdown
前後
```











強調文字列内部の境界文字が英数字ではない句読文字の場合は強調書式の外側の境界文字で判定し、全て空白または句読文字であれば強調書式が適用される。

* `*!Italic!* __(Bold)__ ***"Bold italic"***` → *!Italic!* __(Bold)__ ***"Bold italic"***
* `|*!Italic!*|__(Bold)__|***"Bold italic"***|` → |*!Italic!*|__(Bold)__|***"Bold italic"***|

それ以外(英数字や日本語文字など)が密着していると強調ではないと判定する。以下の例文では手前の文字`0`,`A`,`あ`の後に空白または句読文字がある場合に強調、密着していれば強調ではないと判定していることに注意

* `0 *!italic!* BUT 0*!not!*` → 0 *!italic!* BUT 0*!not!*
* `A-__;bold;__ BUT A__;not;__` → A-__;bold;__ BUT A__;not;__
* `あ ***'bold italic'*** BUT あ***'not'***` → `あ ***'bold italic'*** BUT あ***'not'***

### ネスト

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










## 補足 - 斜体と日本語

ブラウザのHTMLレンダリング処理に関して「Windowsでは日本語に斜体が効かない」という有名な問題がある。具体的にはブラウザ表示フォントに[メイリオ]を用いる場合、英数字や他のアルファベット文字(ギリシャ文字やキリル文字など)は斜体になるが、日本語に使われる文字(かな、漢字など)は斜体が効かない。

### フォントの基礎知識

これを説明するにはまず[フォント]に関する基礎知識を知っておく必要がある。表示に用いるフォントには標準(Regular)、[斜体]\(Italic)、[太字]\(Bold)の文字種があり、これらの集合で一組のフォントとして扱われる。

> 実際はもっと複雑で、一般に「斜体」と呼ばれる書体には[イタリック体](https://ja.wikipedia.org/wiki/イタリック体)(Italic)と[オブリーク体](https://ja.wikipedia.org/wiki/斜体)(Oblique)の2種類ある。また字の太さ([ウェイト](https://ja.wikipedia.org/wiki/フォント#ウェイト_(太字フォント・細字フォント)))が豊富に用意されているフォントもある。ただしMarkdownではそこまで細かい設定はできない。以下Markdownで設定可能な上記3種類に限定して説明する。

### ブラウザの処理動作

ブラウザなどのHTML表示環境では[斜体]と[太字]に関してだいたい次のように処理している(概要だがこの程度の理解で十分)。[斜体]の場合を示す([太字]も同様)。

1. 表示用フォントが斜体データを持っている場合はそれを使用する(優先)
   1. 斜体データが表示する文字コードに対応していればそれを出力
   2. 未対応の場合は標準フォントで出力(この場合だけ斜体にならない - この点に注意)
2. 斜体データを持たないフォントはブラウザ側で斜め変形レンダリングして表示

日本語対応フォントの多く(MS Pゴシックなど)は斜体データを持たないため、2番目の方法でブラウザが斜め変形処理して表示する。

### メイリオで生じる問題

現在のWindowsでは[メイリオ]をベースとしたフォントが日本語表示用の標準として用いられている。[メイリオ]は構造が本格的で、斜体や太字の専用データを持っている。しかし斜体に関してはデータが不完全で、日本語用文字に対する斜体データが作られていない。

そのため英数字やギリシャ文字などはデータが作られているため斜体表示するが、日本語用文字は上記の条件1-2の「斜体データが適用されるがその文字コードに対して未対応」に該当し、斜体ではなく標準で表示する。

> メイリオがこのような仕様になった経緯に関しては次を参照。
>
> https://ja.wikipedia.org/wiki/メイリオ#フォントファミリーの仕様
> 
> ただし理由として書かれている「和文は斜体表記を行う文化的背景がない」は事実ではなく、実際はメイリオよりはるか昔から広告分野などで日本語の斜体文字は用いられている。推測だが工数が膨大で対応困難だったというのが本当の理由だろう。

Windows用ブラウザの多くはインストール時にメイリオを標準の表示フォントに設定しており、ユーザーがフォント設定を変更しない限り[`<em>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/em)や[`<i>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/i)を設定しても斜体にならない。

> メイリオが有名だが、これ以外にもメイリオと同じ設定の(斜体データはあるが日本語文字に対応していない)フォントをブラウザが用いていれば同じ問題が発生する。

### 有効な対策

Windowsユーザーの多くはブラウザのフォント設定をわざわざ変えたりしないし、そもそもこういう問題があることを知る人は少ない。どの環境のユーザーに対しても同等の表示を保証するには「日本語に斜体を使わない」という回避策しか有効な方法はない。

------------------------------------------------------------------------

[通常テキスト](texts.md)
← [目次](index.md) →
[リンク](links.md)

[ASCII句読文字]: characters.md#ascii句読文字
[GFM]: github-flavored-markdown.md
[スネークケース]: https://en.wikipedia.org/wiki/Snake_case
[バックスラッシュエスケープ]: characters.md#バックスラッシュエスケープ
[フォント]: https://ja.wikipedia.org/wiki/フォント
[メイリオ]: https://ja.wikipedia.org/wiki/メイリオ
[打ち消し線]: #打ち消し線
[斜体]: #斜体
[太字]: #太字
[文字参照]: characters.md#文字参照
