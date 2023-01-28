# HTMLブロック

[タスクリスト]
← [目次] →
[GitHub Markdown環境]

------------------------------------------------------------------------

[ブロック]のレベルでも標準Markdownにはない機能に対してHTMLタグを直接用いるケースがある。ただしMarkdown実装及びそれを用いるWebサービスやアプリでは主に動作保証上の理由で利用可能な機能を制限しており、特定のHTML要素や属性しか使えないようになっている。

以下はGitHub Markdown環境で動作確認できた範囲のみを解説する。他のMarkdown環境で同じ方法が使えるかは全く保証できないので、他環境に応用する場合は必ず自分で実環境チェックを行うこと。

## 折りたたみ

[`<details>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/details)を用いて折りたたみセクションを作成できる。開始タグの後にタイトル文の[`<summary>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/summary)が必須で、それに続き任意のMarkdown構文を記述できる。終了は`</details>`を用いる。

```markdown
<details>
<summary>折りたたみセクション</summary>

パラグラフ

- リスト1
  1. リスト1-1
  2. リスト1-2
- リスト項目2

| ヘッダ1 | ヘッダ2 |
| ------- | ------- |
| セル1-1 | セル1-2 |
| セル2-1 | セル2-2 |

</details>
```

出力は次の通り。「⯈ 折りたたみセクション」の部分をマウスクリックするか、またはタブキーでフォーカスしてリターンキーまたはスペースバーを押すと展開/折りたたみ動作する。

> <details>
> <summary>折りたたみセクション</summary>
> 
> パラグラフ
> 
> - リスト1
>   1. リスト1-1
>   2. リスト1-2
> - リスト2
> 
> | ヘッダ1 | ヘッダ2 |
> | ------- | ------- |
> | セル1-1 | セル1-2 |
> | セル2-1 | セル2-2 |
> 
> </details>

なおタイトル部の`<summary>`の内部にはMarkdown構文が効かない。局所的に[HTMLインライン]を用いると解決できる。

```markdown
<details：ｗ>
<summary>**強調されない**</summary>
コンテンツ
</details>

<details>
<summary><strong>強調される</strong></summary>
コンテンツ
</details>
```

> <details>
> <summary>**強調されない**</summary>
> コンテンツ
> </details>
> 
> <details>
> <summary><strong>強調される</strong></summary>
> コンテンツ
> </details>

また折りたたみコンテンツ開始位置(`</summary>`の直後)に[ブロック]アイテムを記述する場合、その認識に[空行]が必要になる場合がある(アイテムの種類により異なる)。

```markdown
<details>
<summary>パラグラフは空行不要</summary>
パラグラフ
</details>

<details>
<summary>リストは空行が必要(失敗例)</summary>
- リストと認識されない
</details>

<details>
<summary>リストは空行が必要(成功例)</summary>

- リスト
</details>

<details>
<summary>表は空行が必要(失敗例)</summary>
| ヘッダ | ヘッダ |
| ------ | ------ |
|  セル  |  セル  |
</details>

<details>
<summary>表は空行が必要(成功例)</summary>

| ヘッダ | ヘッダ |
| ------ | ------ |
|  セル  |  セル  |
</details>
```

> <details>
> <summary>パラグラフは空行不要</summary>
> パラグラフ
> </details>
> 
> <details>
> <summary>リストは空行が必要(失敗例)</summary>
> - リストと認識されない
> </details>
> 
> <details>
> <summary>リストは空行が必要(成功例)</summary>
> 
> - リスト
> </details>
> 
> <details>
> <summary>表は空行が必要(失敗例)</summary>
> | ヘッダ | ヘッダ |
> | ------ | ------ |
> |  セル  |  セル  |
> </details>
> 
> <details>
> <summary>表は空行が必要(成功例)</summary>
> 
> | ヘッダ | ヘッダ |
> | ------ | ------ |
> |  セル  |  セル  |
> </details>

ただしこのようなケースバイケースの仕様をいちいち調べるよりも、単に**空行は常に入れる**と覚えておけば確実に認識する。

### 折りたたみのネスト

折りたたみはネストできる。

```
<details>
<summary>レベル1</summary>

レベル1コンテンツ

<details>
<summary>レベル2</summary>

レベル2コンテンツ

<details>
<summary>レベル3</summary>

レベル2コンテンツ

</details>
</details>
</details>
```

> <details>
> <summary>レベル1</summary>
> 
> レベル1コンテンツ
> 
> <details>
> <summary>レベル2</summary>
> 
> レベル2コンテンツ
> 
> <details>
> <summary>レベル3</summary>
> 
> レベル2コンテンツ
> 
> </details>
> </details>
> </details>

## 高度な表

[GitHub Markdown環境]は[`<table>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/table)及びその関連要素を(確認した範囲内では全て)受け付ける。これを利用してMarkdownの[表]の範囲ではできない次のような表組みを表現できる。

### セルの結合

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

### 表のネスト

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

**注意**: この場合はセル(`<th>`, `<td>`)の内部にMarkdown書式は使えない。例えば`<td>[link](#)</td>`と書いても[リンク]として処理されずそのままテキストで表示される。HTMLで記述し`<td><a href="#">link</a></td>`とすればよい。

------------------------------------------------------------------------

[タスクリスト]
← [目次] →
[GitHub Markdown環境]

[HTMLインライン]: html-inlines.md
[タスクリスト]: task-lists.md
[ブロック]: blocks.md
[空行]: characters.md#空行
[表]: tables.md
[目次]: index.md
[GitHub Markdown環境]: github-markdown.md
