# 画像

[リンク](links.md)
← [目次](index.md) →
[コードスパン](code-spans.md)

------------------------------------------------------------------------

文書中にインラインで画像を挿入する場合は`![代替テキスト](URL ”タイトル")`の書式を用いる。

```markdown
左 ![左矢印](img/arrow-left-circle.svg "左") 中 ![右矢印](img/arrow-right-circle.svg "右") 右
```

> 左 ![左矢印](img/arrow-left-circle.svg "左") 中 ![右矢印](img/arrow-right-circle.svg "右") 右

これは次のようなHTMLに変換される(見やすさを考慮して改行とインデントを追加)。代替テキストは`alt`属性、タイトルは`title`属性に設定される。代替テキストは主にサイト分析や視覚障害者用の画像説明情報などに用いられる。また画像上にマウスを移動するとタイトルをポップアップ表示する。

```html
<p>
  左
  <img src="img/arrow-left-circle.svg" alt="左矢印" title="左">
  中
  <img src="img/arrow-right-circle.svg" alt="右矢印" title="右">
  右
</p>
```

代替テキストは空でもよい。タイトルも省略可能。

```markdown
![](https://github.githubassets.com/images/icons/emoji/unicode/1f349.png?v8 "すいか")

![メロン](https://github.githubassets.com/images/icons/emoji/unicode/1f348.png?v8)

![](https://github.githubassets.com/images/icons/emoji/unicode/1f34a.png?v8)
```

> ![](https://github.githubassets.com/images/icons/emoji/unicode/1f349.png?v8 "すいか")
> 
> ![メロン](https://github.githubassets.com/images/icons/emoji/unicode/1f348.png?v8)
> 
> ![](https://github.githubassets.com/images/icons/emoji/unicode/1f34a.png?v8)

------------------------------------------------------------------------

[リンク](links.md)
← [目次](index.md) →
[コードスパン](code-spans.md)
