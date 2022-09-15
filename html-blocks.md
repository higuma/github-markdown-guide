# [4.6 HTMLブロック](https://higuma.github.io/github-markdown-guide/gfm/#html-blocks)

[4.4 インデント式コードブロック](indented-code-blocks.md)
← [目次](index.md) →
[4.7 リンク参照定義](link-reference-definitions.md)

------------------------------------------------------------------------

HTMLブロック要素を直接認識させる機能。

## ベストプラクティス

TODO

## まとめ

TODO

## 例文

### 折りたたみ

[`<details>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/details)を用いて折りたたみセクションを作成できる。開始タグの後にタイトル文の[`<summary>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/summary)が必須で、それに続き任意のMarkdown構文を記述できる。

```markdown
<details>
<summary>折りたたみセクション</summary>

パラグラフ

* アイテム1
    * アイテム1-1
    * アイテム1-2
* アイテム2

| ヘッダ1 | ヘッダ2 |
| ------- | ------- |
| セル1-1 | セル1-2 |
| セル2-1 | セル2-2 |

</details>
```

出力は次の通り。「▶ 折りたたみセクション」の部分をマウスクリックするか、またはタブキーでフォーカスしてスペースバーを押すと展開/折りたたみ動作する。

> <details>
> <summary>折りたたみセクション</summary>
> 
> パラグラフ
> 
> * アイテム1
>     * アイテム1-1
>     * アイテム1-2
> * アイテム2
> 
> | ヘッダ1 | ヘッダ2 |
> | ------- | ------- |
> | セル1-1 | セル1-2 |
> | セル2-1 | セル2-2 |
> 
> </details>

より細かい注意点は次を参照。

https://gist.github.com/higuma/f1ef8bc5f9c60ec1c941d8406885dde6

まとめると次の通り。

* `<summary>`の内部にはMarkdown書式が効かない
* `<summary>`終了直後にブロック構文を記述すると認識しない場合がある(空行を入れるとよい)
* ネスト可能

### 高度な表

GitHub Markdown実装は[`<table>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/table)及びその関連要素を全て受け付ける。これを利用してMarkdownの[表]の範囲ではできない次のような表組みを表現できる。

#### セルの結合

表の縦横のセルを結合する。セル(`<th>`,`<td>`)に対して横結合には属性`colspan`、縦結合には属性`rowspan`を設定すればよい。

```markdown
<table>
  <thead>
    <tr>
      <th rowspan="2"></th>
      <th rowspan="2">A</th>
      <th colspan="2">B</th>
    </tr>
    <tr>
      <th>B1</th>
      <th>B2</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th rowspan="3">X</th>
      <td>X1A</td>
      <td>X1B1</td>
      <td>X1B2</td>
    </tr>
    <tr>
      <td>X2A</td>
      <td>X2B1</td>
      <td rowspan="2">X2B2<br>X3B2</td>
    </tr>
    <tr>
      <td>X3A</td>
      <td>X3B1</td>
    </tr>
    <tr>
      <th rowspan="3">Y</th>
      <td>Y1A</td>
      <td colspan="2">Y1B</td>
    </tr>
    <tr>
      <td>Y2A</td>
      <td>Y2B1</td>
      <td>Y2B2</td>
    </tr>
  </tbody>
</table>
```

> <table>
>   <thead>
>     <tr>
>       <th rowspan="2"></th>
>       <th rowspan="2">A</th>
>       <th colspan="2">B</th>
>     </tr>
>     <tr>
>       <th>B1</th>
>       <th>B2</th>
>     </tr>
>   </thead>
>   <tbody>
>     <tr>
>       <th rowspan="3">X</th>
>       <td>X1A</td>
>       <td>X1B1</td>
>       <td>X1B2</td>
>     </tr>
>     <tr>
>       <td>X2A</td>
>       <td>X2B1</td>
>       <td rowspan="2">X2B2<br>X3B2</td>
>     </tr>
>     <tr>
>       <td>X3A</td>
>       <td>X3B1</td>
>     </tr>
>     <tr>
>       <th rowspan="3">Y</th>
>       <td>Y1A</td>
>       <td colspan="2">Y1B</td>
>     </tr>
>     <tr>
>       <td>Y2A</td>
>       <td>Y2B1</td>
>       <td>Y2B2</td>
>     </tr>
>   </tbody>
> </table>

#### 表のネスト

[表]のセル内に別の表を挿入する。

```markdown
<table>
  <thead>
    <tr>
      <th>A</th>
      <th>B</th>
      <th>C</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1A</td>
      <td>1B</td>
      <td>1C</td>
    </tr>
    <tr>
      <td>2A</td>
      <td>
        <table>
          <thead>
            <tr>
              <th>X</th>
              <th>Y</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1X</td>
              <td>1Y</td>
            </tr>
            <tr>
              <td>2X</td>
              <td>2Y</td>
            </tr>
          </tbody>
        </table>
      </td>
      <td>2C</td>
    </tr>
  </tbody>
</table>
```

> <table>
>   <thead>
>     <tr>
>       <th>A</th>
>       <th>B</th>
>       <th>C</th>
>     </tr>
>   </thead>
>   <tbody>
>     <tr>
>       <td>1A</td>
>       <td>1B</td>
>       <td>1C</td>
>     </tr>
>     <tr>
>       <td>2A</td>
>       <td>
>         <table>
>           <thead>
>             <tr>
>               <th>X</th>
>               <th>Y</th>
>             </tr>
>           </thead>
>           <tbody>
>             <tr>
>               <td>1X</td>
>               <td>1Y</td>
>             </tr>
>             <tr>
>               <td>2X</td>
>               <td>2Y</td>
>             </tr>
>           </tbody>
>         </table>
>       </td>
>       <td>2C</td>
>     </tr>
>   </tbody>
> </table>

なおセル(`<th>`, `<td>`)の内部にMarkdown書式は使えないことに注意。例えば`<td>[link](#)</td>`と書いても[リンク]として処理されずそのままテキストで表示される。HTMLで記述し`<td><a href="#">link</a></td>`とすればよい。

------------------------------------------------------------------------

[4.4 インデント式コードブロック](indented-code-blocks.md)
← [目次](index.md) →
[4.7 リンク参照定義](link-reference-definitions.md)

[リンク]: links.md
[表]: tables.md
