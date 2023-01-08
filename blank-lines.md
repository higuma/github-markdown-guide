# [4.9 空行](https://higuma.github.io/github-markdown-guide/gfm/#blank-lines)

[4.8 パラグラフ](paragraphs.md)
← [目次](index.md) →
[4.10 表](tables.md)

------------------------------------------------------------------------

> **旧版(完成後削除)**

空行は上下のブロック構文を文法的に区切る。

## ベストプラクティス

* 空行には改行のみを用いる(スペースやタブを入れない)
* 上下のブロック構文の間に区切りとして入れる

## まとめ

一行の中に文字を全く含まない(改行のみ)か、またはスペース(U+0020)とタブ(U+0009)のみを含んで改行する行を空行という(→ [仕様書定義](https://higuma.github.io/github-markdown-guide/gfm/#blank-line))。空行はブロック構文の区切りとして用いられ、構文解析後は除去して処理される。

> [ノーブレークスペース]がある場合は空行ではない。[ノーブレークスペース]は英数字と同じように扱われる。

## 文例

### 空行が必要な場合

空行はMarkdown構文の色々な状況でブロック区切りとして用いられるが、空行が必要かどうかは構文の種類により異なる。詳しくは次を参照。

* [横線] - [空行の必要性](thematic-breaks.md#空行の必要性)
* [パラグラフ] - [直前構文との認識](paragraphs.md#直前構文との認識)、[直後構文との認識](paragraphs.md#直後構文との認識)
* [表] - [表の認識(前後構文との関係)](tables.md#表の認識前後構文との関係)
* [ハード改行] - [次行の構文認識](hard-line-breaks.md#次行の構文認識)
* [ソフト改行] - [次行の構文認識](soft-line-breaks.md#次行の構文認識)

ただし詳細規則はやや複雑なので、分からない場合は空行を入れておくのがよい。空行は構文解析後は除去してから処理されるため、不要な空行は全く無害で文書出力に悪影響を与えることはない。

### 無駄スペースの副作用

空行にスペースやタブが入っていても機能はするが、単に無駄なだけではなく思わぬ誤認識の元になる場合もある。例えば次のような2つのパラグラフがあり、中間の空行は2つのスペースを含んでいるとする。

```markdown
First sentence.
Second sentence - next blank line contains double spaces.
  
Third sentence.
```

> First sentence.
> Second sentence - next blank line contains double spaces.
>   
> Third sentence.

上下を一つのパラグラフにまとめようとして` ... next blank line contains double spaces.`の末尾の改行を削除した場合、外見では[ソフト改行]のように見える。

```markdown
First sentence.
Second sentence - next blank line contains double spaces.  
Third sentence.
```

しかし実際には末尾にスペース2個が追加されているため[ハード改行]と判定され、次のように意図しない改行が入る。

> First sentence.
> Second sentence - next blank line contains double spaces.  
> Third sentence.

このようなミスは日頃から空行には改行だけを用い、無駄なスペースを入れないように心掛けていれば未然に防ぐことができる。

------------------------------------------------------------------------

[4.8 パラグラフ](paragraphs.md)
← [目次](index.md) →
[4.10 表](tables.md)

[GFM]: introduction.md#11-github-flavored-markdownとは
[ソフト改行]: soft-line-breaks.md
[ノーブレークスペース]: character-references.md#ノーブレークスペース
[ハード改行]: hard-line-breaks.md
[パラグラフ]: paragraphs.md
[表]: tables.md
[横線]: thematic-breaks.md
