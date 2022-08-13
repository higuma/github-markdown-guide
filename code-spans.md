# [6.3 Code spans](https://higuma.github.io/github-flabored-markdown/#code-spans)

[6.2 Entity and numeric character references](entity-and-numeric-character-references.md)
← [Table of contents](index.md) →
[6.4 Emphasis and strong emphasis](emphasis-and-strong-emphasis.md)

------------------------------------------------------------------------

## [6.3 Code spans](https://higuma.github.io/github-flabored-markdown/#code-spans)

コードスパンは[インライン]構文中のコードを表現する。

## Best practice

コードスパンはバックティック(`` ` ``)を用いて`` `code` ``のように表現する。

```markdown
DOMのグローバルオブジェクトは`window`で参照する。
```

> DOMのグローバルオブジェクトは`window`で参照する。

コードスパン内に連続でない`` ` ``が含まれる場合は次のシーケンスを用いる。最初と最後のスペースは処理時に除去される。

* 開始は``` ``  ``` (バックティック2個の後にスペース)
* 連続でない`` ` ``を含むコード
* 終了は```  `` ``` (スペースの後にバックティック2個)

```markdown
シェルスクリプトのコマンド置換は`` `コマンド` ``で記述する(例: `` echo `ps` ``)。
```

> シェルスクリプトのコマンド置換は`` `コマンド` ``で記述する(例: `` echo `ps` ``)。

連続する`` ` ``を含む場合は次の記法がお勧め。

* 開始は```` ```..`  ```` (内部の連続バックティックより多い個数の後にスペース)
* 連続する`` ` ``を含むコード
* 終了は````  ```..` ```` (スペースの後に開始と同じ数のバックティック)

```markdown
GFMではコードスパンを``` `` echo `ps` `` ```のように記述できる。
```

> GFMではコードスパンを``` `` echo `ps` `` ```のように記述できる。

## Summary

コードスパンは`` `...` ``で表現する。内部のコードでは[バックスラッシュエスケープ]や書式設定は一切効かず、またHTMLで文字参照を用いる必要のある文字は自動的に変換される。その形でHTMLの`<code>...</code>`の中に入れて出力する。

```markdown
ソースコードの例(C): `printf("\"x = %5.2f\"\n", x);`

HTML要素の例: `<a href="#">**太字ではない**</a>`
```

> ソースコードの例(C): `printf("\"x = %5.2f\"\n", x);`
> 
> HTML要素の例: `<a href="#">**太字ではない**</a>`

ただし前後のスペースは除去される。また中間のスペースはいくらあっても縮約されて1個分になる。

```markdown
手前にスペース2個、中間にスペース4個、最後にスペース3個: `  foo    bar   `
```

> 手前にスペース2個、中間にスペース4個、最後にスペース3個: `  foo    bar   `

> これはMarkdownの仕様ではなくHTMLの`<code>`の仕様。例えば`<code>  foo    bar   </code>`としても`<code>foo bar</code>`と同じ出力になる。

前後にスペースを挿入する場合、または内部に`` ` ``がある場合は次の書式を用いる。最初と最後のスペースは処理時に除去される。

* 開始は```` ```..`  ```` (内部の連続バックティックより多い数の後にスペース1個)
* コード
* 終了は````  ```..` ```` (スペース1個の後に開始と同じ数のバックティック)

```markdown
手前にスペース2個、最後にスペース3個を挿入: ```   foo    ```
```

> 手前にスペース2個、最後にスペース3個を挿入: ```   foo    ```







## Examples



------------------------------------------------------------------------

[6.2 Entity and numeric character references](entity-and-numeric-character-references.md)
← [Table of contents](index.md) →
[6.4 Emphasis and strong emphasis](emphasis-and-strong-emphasis.md)

[インライン]: inlines.md
[バックスラッシュエスケープ]: backslash-escapes.md
