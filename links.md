# リンク

[太字、斜体、打ち消し文字]
← [目次] →
[画像]

------------------------------------------------------------------------

## 自動リンク

GitHub Markdownはテキスト中にURLの形式と一致する部分文字列を見つけると自動的にそのURLへのリンクを作成する。

```markdown
GitHub Docs: https://docs.github.com/
```

> GitHub Docs: https://docs.github.com/

英語は単語間がスペースで区切られるため自動検出が有効に機能するが、日本語の中に直接埋め込むとよく次のように誤認識する(文末の`です。`をURLの続きと判定)。

```markdown
GitHub DocsのURLはhttps://docs.github.com/です。
```

> GitHub DocsのURLはhttps://docs.github.com/です。

語間をスペースで区切らない日本語では自動認識だけに頼るのは限界がある。こういう場合はURLを`<...>`で囲むと認識する。

```markdown
GitHub DocsのURLは<https://docs.github.com/>です。
```

> GitHub DocsのURLは<https://docs.github.com/>です。

### 自動リンクの問題点

しかしこの仕様には副作用がある。リンクを作成せず単にURLをテキストとして記述しようとしてもGitHub Markdownではそれができない。次のように[バックスラッシュエスケープ]をいくら用いても自動リンクが作成される。

```markdown
https\:\/\/docs\.github\.com\/
```

> https\:\/\/docs\.github\.com\/

> (参考) 他のMarkdown実装ではこの方法でできるものもあるが、今度は[バックスラッシュエスケープ]が部分的にしか効かないなど仕様にばらつきがある。[Babelmark]による主要Markdown実装の比較結果は次の通り。動作はまちまちで、結論としてこのような書き方をしても実用上何もよいことはない。
> 
> https://babelmark.github.io/?text=https%5C%3A%5C%2F%5C%2Fdocs%5C.github%5C.com%5C%2F

またGitHub Markdownは次のように[文字参照]を用いても自動的にリンクが付く。Markdownの範囲ではこれ以上の対応はおそらくできないので、GitHub Markdownでは自動リンクをエスケープする方法は存在しないと結論付けてよい。

```markdown
> &#x68;&#x74;&#x74;&#x70;&#x3A;&#x2F;&#x2F;&#x64;&#x6F;&#x63;&#x73;&#x2E;&#x67;&#x69;&#x74;&#x68;&#x75;&#x62;&#x2E;&#x63;&#x6F;&#x6d;
```

> &#x68;&#x74;&#x74;&#x70;&#x3A;&#x2F;&#x2F;&#x64;&#x6F;&#x63;&#x73;&#x2E;&#x67;&#x69;&#x74;&#x68;&#x75;&#x62;&#x2E;&#x63;&#x6F;&#x6d;

## リンク

HTMLでリンクを表す`<a href="URL">テキスト</a>`はMarkdownでは`[テキスト](URL)`で表現する。

```markdown
GitHubの公式ドキュメントは[GitHub Docs](https://docs.github.com/)です。
```

> GitHubの公式ドキュメントは[GitHub Docs](https://docs.github.com/)です。

## リンク参照定義

同じリンクを繰り返し記述する場合に用いる機能としてリンク参照定義(Link reference definition)がある。まずMarkdownドキュメントのどこか([コードブロック]以外ならどこでもよいが典型的には末尾)に`[参照名]: URL`の形式で定義を記述する。

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

> 本ドキュメントをソース表示すると末尾にこれと同じものが記述されている。

これにより[リンク](#リンク)を`[参照名]`で記述できるようになる。

```markdown
[Markdown]はテキスト入力を[HTML]に変換する。[GitHub]の[Markdown]環境は[LaTeX]にも対応している。
```

> [Markdown]はテキスト入力を[HTML]に変換する。[GitHub]の[Markdown]環境は[LaTeX]にも対応している。

なお参照名の検索は大文字と小文字を区別しないことに注意。次のように大文字と小文字の区別だけが異なる参照名を用いた場合は参照時に用いた名前に対してURLを設定する。

```markdown
[html], [MARKDOWN]
```

> [html], [markDOWN]

------------------------------------------------------------------------

[太字、斜体、打ち消し文字]
← [目次] →
[画像]

[空行]: characters.md#空行
[太字、斜体、打ち消し文字]: bold-italic-strikethrough.md
[目次]: index.md
[画像]: images.md
[文字参照]: characters.md#文字参照
[Babelmark]: history.md#babelmark
[CommonMark]: history.md#commonmark
[コードブロック]: code-blocks.md
[バックスラッシュエスケープ]: characters.md#バックスラッシュエスケープ
[ブロック]: blocks.md

<!-- リンク参照定義説明用 -->
[GitHub]: https://github.com/
[HTML]: https://ja.wikipedia.org/wiki/HTML
[LaTeX]: https://ja.wikipedia.org/wiki/LaTeX
[Markdown]: https://ja.wikipedia.org/wiki/Markdown
