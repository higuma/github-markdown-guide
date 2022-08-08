# [6 Inlines](https://higuma.github.io/github-flabored-markdown/#inlines)

[5 Container blocks](container-blocks.md)
← [Table of contents](index.md) →
[Appendix: A parsing strategy](appendix-a-parsing-strategy.md)

------------------------------------------------------------------------

[インライン]構文は文字ストリームの並び順に評価される。

## [6.1 Backslash escapes](https://higuma.github.io/github-flabored-markdown/#backslash-escapes)

Markdown構文に用いる区切り文字(空白と英数字以外の[印字可能ASCII文字](https://ja.wikipedia.org/wiki/ASCII印字可能文字))を書式でなく文字そのものと認識させる場合はバックスラッシュ(`\`)を用いてエスケープする。

<details>
<summary>__区切り文字__ とは</summary>
「区切り文字」(punctuation characters)を次のように定義する。

* [ASCIIの印字可能文字](https://ja.wikipedia.org/wiki/ASCII印字可能文字)(U+0020..U+007F)
* そこから空白(U+0020)、英数字(U+0030..0039, U+0041..005A, U+0061..006A)を除いた残り
</details>




### Best practice

バックスラッシュエスケープは[ASCIIの印字可能文字](https://ja.wikipedia.org/wiki/ASCII印字可能文字)(U+0020..U+007F)に限定する。



### Details

* 区切り文字(punctuation characters)(→ [一覧])

> (参考) Unicodeの全ての区切り文字一覧は次の通り。
> 
> https://www.fileformat.info/info/unicode/category/Po/list.htm

ASCIIの印字可能文字すべてが実際に区切り文字一覧。

| U+ | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | A | B | C | D | E | F |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 0020 | \  | \! | \" | \# | \$ | \% | \& | \' | \( | \) | \* | \+ | \, | \- | \. | \/ |
| 0030 | \0 | \1 | \2 | \3 | \4 | \5 | \6 | \7 | \8 | \9 | \: | \; | \< | \= | \> | \? |
| 0040 | \@ | \A | \B | \C | \D | \E | \F | \G | \H | \I | \J | \K | \L | \M | \N | \O |
| 0050 | \P | \Q | \R | \S | \T | \U | \V | \W | \X | \Y | \Z | \[ | \\ | \] | \^ | \_ |
| 0060 | \` | \a | \b | \c | \d | \e | \f | \g | \h | \i | \j | \k | \l | \m | \n | \o |
| 0070 | \p | \q | \r | \s | \t | \u | \v | \w | \x | \y | \z | \{ | \| | \} | \~ |



## [6.2 Entity and numeric character references](https://higuma.github.io/github-flabored-markdown/#entity-and-numeric-character-references)

## [6.3 Code spans](https://higuma.github.io/github-flabored-markdown/#code-spans)

[コードスパン]は[インライン]構文としてのコードを表現する。

### Best practice





### Details



## [6.4 Emphasis and strong emphasis](https://higuma.github.io/github-flabored-markdown/#emphasis-and-strong-emphasis)

## [6.5 Strikethrough (extension)](https://higuma.github.io/github-flabored-markdown/#strikethrough-extension-)

> 初期実装のGruber版Markdownにあった機能だが、CommonMarkでは(おそらく`~~~`をFenced code blockに用いた副作用で)機能が削除された。GFMではこれを復活させた。

## [6.6 Links](https://higuma.github.io/github-flabored-markdown/#links)

## [6.7 Images](https://higuma.github.io/github-flabored-markdown/#images)

## [6.8 Autolinks](https://higuma.github.io/github-flabored-markdown/#autolinks)

## [6.9 Autolinks (extension)](https://higuma.github.io/github-flabored-markdown/#autolinks-extension-)

## [6.10 Raw HTML](https://higuma.github.io/github-flabored-markdown/#raw-html)

## [6.11 Disallowed Raw HTML (extension)](https://higuma.github.io/github-flabored-markdown/#disallowed-raw-html-extension-)

## [6.12 Hard line breaks](https://higuma.github.io/github-flabored-markdown/#hard-line-breaks)

## [6.13 Soft line breaks](https://higuma.github.io/github-flabored-markdown/#soft-line-breaks)

## [6.14 Textual content](https://higuma.github.io/github-flabored-markdown/#textual-content)

------------------------------------------------------------------------

[5 Container blocks](container-blocks.md)
← [Table of contents](index.md) →
[Appendix: A parsing strategy](appendix-a-parsing-strategy.md)

[インライン]: #
[コードスパン]: #63-code-spans




