# [6.10 生HTML](https://higuma.github.io/github-markdown-guide/gfm/#raw-html)

[6.9 自動リンク (GFM拡張)](autolinks-extension.md)
← [目次](index.md) →
[6.11 使用できないHTML要素](disallowed-html-elements.md)

------------------------------------------------------------------------

## ベストプラクティス

TODO

## まとめ

TODO

## 文例

### IDの設定

特定の用語にIDを設定する場合は`<span>`を用いるとよい。次は[表]のセル中の用語に設定する例。

```markdown
| 項目 | 解説 |
| - | - |
| <span id="横線">横線</span> | → [リンク](thematic-breaks.md) |
| <span id="見出し">見出し</span> | → [リンク](headings.md) |
```

> | 項目 | 解説 |
> | - | - |
> | <span id="横線">横線</span> | → [リンク](thematic-breaks.md) |
> | <span id="見出し">見出し</span> | → [リンク](headings.md) |

上記出力には実際にIDが設定されている。次で確認できる(項目をクリック)。

* → [`id="横線"`](#横線)
* → [`id="見出し"`](#見出し)

### 書式設定

次の書式設定を使える。

* 下線: `<u>下線</u>` → <u>下線</u>
* 上付き文字: `_a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>_` → _a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>_
* 下付き文字: `C<sub>7</sub>H<sub>5</sub>N<sub>3</sub>O<sub>6</sub>` → C<sub>7</sub>H<sub>5</sub>N<sub>3</sub>O<sub>6</sub>
* ルビ







------------------------------------------------------------------------

[6.9 自動リンク (GFM拡張)](autolinks-extension.md)
← [目次](index.md) →
[6.11 使用できないHTML要素](disallowed-html-elements.md)

[表]: tables.md
