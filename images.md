# 画像

[リンク]
← [目次] →
[コードスパン]

------------------------------------------------------------------------

文書中にインラインで画像を挿入する場合は`![代替テキスト](URL ”タイトル")`の書式を用いる。

```markdown
![LED-3](img/3.svg "3") + ![LED-8](img/5.svg "5") = ![LED-8](img/8.svg "8")
```

> ![LED-3](img/3.svg "3") + ![LED-8](img/5.svg "5") = ![LED-8](img/8.svg "8")

これは次のようなHTMLに変換される(見やすさを考慮して改行とインデントを追加)。代替テキストは`alt`属性、タイトルは`title`属性に設定される。代替テキストは主にサイト分析や視覚障がい者用の画像説明情報などに用いられる。また画像上にマウスを移動するとタイトルをポップアップ表示する。

```html
<p>
  <img src="img/3.svg" alt="LED-3" title="3">
  +
  <img src="img/5.svg" alt="LED-5" title="5">
  =
  <img src="img/8.svg" alt="LED-8" title="8">
</p>
```

代替テキストは空でもよい。タイトルも省略可能。

```markdown
![](https://github.githubassets.com/images/icons/emoji/unicode/1f349.png?v8 "すいか")

![メロン](https://github.githubassets.com/images/icons/emoji/unicode/1f348.png?v8)

![](https://github.githubassets.com/images/icons/emoji/unicode/1f34a.png?v8)

![](img/0.svg)![](img/1.svg)![](img/2.svg)![](img/3.svg)![](img/4.svg)\
![](img/5.svg)![](img/6.svg)![](img/7.svg)![](img/8.svg)![](img/9.svg)
```

> ![](https://github.githubassets.com/images/icons/emoji/unicode/1f349.png?v8 "すいか")
> 
> ![メロン](https://github.githubassets.com/images/icons/emoji/unicode/1f348.png?v8)
> 
> ![](https://github.githubassets.com/images/icons/emoji/unicode/1f34a.png?v8)
> 
> ![](img/0.svg)![](img/1.svg)![](img/2.svg)![](img/3.svg)![](img/4.svg)\
> ![](img/5.svg)![](img/6.svg)![](img/7.svg)![](img/8.svg)![](img/9.svg)

------------------------------------------------------------------------

[リンク]
← [目次] →
[コードスパン]

[リンク]: links.md
[目次]: index.md#images
[コードスパン]: code-spans.md



