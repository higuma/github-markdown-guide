# リンク

[太字、斜体、打ち消し文字]
← [目次] →
[画像]

------------------------------------------------------------------------

## 自動リンク

URLを表すテキスト`URL`を`<...>`で囲むと自動リンクに変換され、`<URL>`に対して<a href="URL">URL</a>`と出力する。

```markdown
<https://example.com/>

GitHub DocsのURLは<https://docs.github.com/>です。
```

> <https://example.com/>
> 
> GitHub DocsのURLは<https://docs.github.com/>です。

> &#x2757;&#xFE0F; 今では次の[拡張自動リンク](#拡張自動リンク)が適用されるため、この記法は大部分のケースで不要になっている。ただし拡張自動リンクの検出には前後に区切り文字が必要であるため、特に日本語の文章の中にURLを入れるとよく誤認識する(文末の`です。`をURLの続きと認識)。
> 
> ```markdown
> GitHub DocsのURLはhttps://docs.github.com/です。
> ```
> 
> > GitHub DocsのURLはhttps://docs.github.com/です。
> 
> こういう場合はURLを`<...>`で囲むと認識する。
> 
> ```markdown
> GitHub DocsのURLは<https://docs.github.com/>です。
> ```
> 
> > GitHub DocsのURLは<https://docs.github.com/>です。
> 
> 代わりにURLの前後にスペースを入れてもよい(好みの問題)。
> 
> ```markdown
> GitHub DocsのURLは https://docs.github.com/ です。
> ```
> 
> > GitHub DocsのURLは https://docs.github.com/ です。

## 拡張自動リンク

さらに[GitHub Flavored Markdown仕様](https://github.github.com/gfm/#autolinks-extension-)ではテキスト中にURLと認識できる文字列パターンを検出すると、その部分を自動的に自動リンクに変換する。要約すると次の通り。

- まずテキスト文字列を[句読文字]で分割してから判定
- 次のいずれかのケースをURLと判定し、`<...>`で囲まなくても自動リンクを作成
  - `www.`で始まるパターンから文字列の終わりまで
    - 先頭に`https://`または`http://`を補ってから判定し、全体として正しいURLであれば認識
  - `https://`または`http://`で始まる連続文字列もURL判定を行い、正しいと判定した場合に認識
- 途中に`@`がある場合にメールアドレスの判定を行い、正しいと判定した場合に認識

```markdown
www.example.com

https://github.com

foo@example.com
```

> www.example.com
> 
> https://github.com
> 
> foo@example.com

### 拡張自動リンクのエスケープ

しかしこの仕様には副作用がある。リンクを作成せず単にURLをテキストとして記述しようとしてもGitHub Markdownではそれができない。次のように[バックスラッシュエスケープ]や[文字参照]をいくら用いても自動リンクが作成される。

```markdown
https\:\/\/www\.github\.com

https&colon;&sol;&sol;www&period;github&period;com
```

> https\:\/\/www\.github\.com
> 
> https&colon;&sol;&sol;www&period;github&period;com

> &#x2757;&#xFE0F; Babelmark(→ [結果](https://babelmark.github.io/?text=https%5C%3A%5C%2F%5C%2Fwww%5C.github%5C.com%0A%0Ahttps%26colon%3B%26sol%3B%26sol%3Bwww%26period%3Bgithub%26period%3Bcom))で比較すると以上の方法が効く実装が多数あるが、やはり動作はまちまちで環境依存が大きい。必要になった場合は必ず実環境チェックすること。

GitHub環境では自動リンク拡張検出を[バックスラッシュエスケープ]と[文字参照]の処理後に行うためこれらは効果がない。URLの条件にマッチする文字列を自動リンクさせないためには次のように`<span>`を用いてマッチ対象部分を分断すればエスケープできる(非常に特殊)。

```markdown
ht<span>tps://ww</span>w.github.com
```

> ht<span>tps://ww</span>w.github.com

> &#x2714;&#xFE0F; まず`https:://`がマッチ対象なのでわざとその途中から`<span>`を開始し、次に`www.`もマッチ対象なのでその中間に`</span>`を入れる。両方必要なことに注意。

同様にGitHubでは`@`を含む文字列も[バックスラッシュエスケープ]や[文字参照]が効かず、常に自動リンクを生成する。

```markdown
foo\@example.com

foo&commat;example.com
```

> foo\@example.com
> 
> foo&commat;example.com

これも`<span>`を用いて解決する。

```markdown
foo<span>@</span>example.com
```

> foo<span>@</span>example.com

## リンク

HTMLでリンクを表す`<a href="URL">テキスト</a>`はMarkdownでは`[テキスト](URL)`で表現する。

```markdown
GitHubの公式ドキュメントは[GitHub Docs](https://docs.github.com/)です。
```

> GitHubの公式ドキュメントは[GitHub Docs](https://docs.github.com/)です。

### `title`属性の設定

`title`属性を追加する場合は次のいずれかの書式を用いる。

- `[テキスト](URL "タイトル")`
- `[テキスト](URL 'タイトル')`
- `[テキスト](URL (タイトル))`

ポインタをリンクの上に移動するとtitle属性に設定した文字列がポップアップする。

```markdown
- [例1](# "タイトル1")
- [例2](# 'タイトル2')
- [例3](# (タイトル3))
```

> - [例1](# "タイトル1")
> - [例2](# 'タイトル2')
> - [例3](# (タイトル3))

### URLがスペースを含む場合

スペースを含むURLは全体を`<...>`で囲むと認識し、URL内のスペースはURLエンコードを適用して`%20`に自動変換される。

```markdown
[Wikipedia: Pablo Picasso](<https://en.wikipedia.org/wiki/Pablo Picasso>)
```

> [Wikipedia: Pablo Picasso](<https://en.wikipedia.org/wiki/Pablo Picasso>)

## リンク参照定義

同じリンクを繰り返し記述する場合に用いる機能としてリンク参照定義(Link reference definition)がある。まずMarkdownドキュメントのどこかの行([コードブロック]の内部以外ならどこでもよいが典型的には末尾)に`[参照名]: URL`の形式で定義を記述する。

```
[GitHub]: https://github.com/
```

この1行は単独の[ブロック]として扱われる。前後にある別の[ブロック]構文との判別には[空行]を挿入すればよい。なお複数ある場合は次のように間に[空行]を置かず連続して記述してよい。これら自体はドキュメントとして一切出力されない。

```
[GitHub]: https://github.com/
[HTML]: https://ja.wikipedia.org/wiki/HTML
[LaTeX]: https://ja.wikipedia.org/wiki/LaTeX
[Markdown]: https://ja.wikipedia.org/wiki/Markdown
```

> 本ページをソース表示すると末尾にこれと同じものが実際に記述されているのを確認できる。

これにより[リンク](#リンク)を`[参照名]`だけで記述できるようになる。

```markdown
[Markdown]はテキスト入力を[HTML]に変換する。[GitHub]の[Markdown]環境は[LaTeX]にも対応している。
```

> [Markdown]はテキスト入力を[HTML]に変換する。[GitHub]の[Markdown]環境は[LaTeX]にも対応している。

なお参照名の検索は大文字と小文字を区別しないことに注意。次のように大文字と小文字の区別だけが異なる参照名を用いた場合は参照時に用いた名前に対してURLを設定する。

```markdown
[html], [markDOWN]
```

> [html], [markDOWN]

------------------------------------------------------------------------

[太字、斜体、打ち消し文字]
← [目次] →
[画像]

[コードブロック]: code-blocks.md
[バックスラッシュエスケープ]: characters.md#バックスラッシュエスケープ
[ブロック]: blocks.md
[拡張自動リンク]: #拡張自動リンク
[画像]: images.md
[空行]: characters.md#空行
[句読文字]: characters.md#句読文字
[太字、斜体、打ち消し文字]: bold-italic-strikethrough.md
[目次]: index.md
[文字参照]: characters.md#文字参照

<!-- リンク参照定義説明用 -->
[GitHub]: https://github.com/
[HTML]: https://ja.wikipedia.org/wiki/HTML
[LaTeX]: https://ja.wikipedia.org/wiki/LaTeX
[Markdown]: https://ja.wikipedia.org/wiki/Markdown
