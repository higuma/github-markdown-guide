# HTMLブロック

[タスクリスト]
← [目次] →
[GitHub Markdown環境]

------------------------------------------------------------------------

[ブロック]のレベルでも標準Markdownにはない機能に対してHTMLタグを直接用いるケースがある。ただしMarkdown実装及びそれを用いるWebサービスやアプリでは主に動作保証上の理由で利用可能な機能を制限しており、特定のHTML要素や属性しか使えないようになっている。

以下はGitHub Markdown環境で動作確認できた範囲のみを解説する。他のMarkdown環境で同じ方法が使えるかは全く保証できないので、他環境に応用する場合は必ず自分で実環境チェックを行うこと。

またHTMLブロックを用いた場合、その内部の特定部分に対してMarkdown書式が適用されなくなることが多い(環境に依存する)。これはその部分をMarkdownではなくHTMLとして直接扱っていることを意味し、その場合は内部も部分的にHTMLで記述する必要がある。この点に関してもGitHub環境の動作を解説する。

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
> </details>

なおタイトル部の`<summary>`の内部にはMarkdown構文が効かない(GitHub環境特有)。この場合は内部に[HTMLインライン]を局所的に用いると解決できる。

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

また`<summary>`の終了タグ`</summary>`の後には[空行]が必要。空行なしの場合はMarkdown文ではなくHTMLブロックを用いて記述された文と認識され、Markdown書式が効かなくなる。

```markdown
<details>
<summary>失敗例</summary>
**コンテンツは強調されない**
</details>

<details>
<summary>成功例</summary>

**コンテンツは強調される**
</details>
```

> <details>
> <summary>失敗例</summary>
> **コンテンツは強調されない**
> </details>
> 
> <details>
> <summary>成功例</summary>
> 
> **コンテンツは強調される**
> </details>

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

レベル3コンテンツ

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
> レベル3コンテンツ
> 
> </details>
> </details>
> </details>

#### ネストレベルの表現

ただし上記の方法では何重にネストしても全て同じレベルのように表示されるため、折りたたみをどのレベルまで展開した状態なのか読者には分かりにくい。その場合は[ブロック引用]と組み合わせて用いるとよい。

```markdown
> <details>
> <summary>レベル1</summary>
> 
> レベル1コンテンツ
> 
> > <details>
> > <summary>レベル2</summary>
> > 
> > レベル2コンテンツ
> > 
> > > <details>
> > > <summary>レベル3</summary>
> > > 
> > > レベル3コンテンツ
> > > 
> > > </details>
> > </details>
> </details>
```

> > <details>
> > <summary>レベル1</summary>
> > 
> > レベル1コンテンツ
> > 
> > > <details>
> > > <summary>レベル2</summary>
> > > 
> > > レベル2コンテンツ
> > > 
> > > > <details>
> > > > <summary>レベル3</summary>
> > > > 
> > > > レベル3コンテンツ
> > > > 
> > > > </details>
> > > </details>
> > </details>

> &#x2714;&#xFE0F; この方法は本解説のいろいろな場所で実際に用いている。

## 説明リスト

> &#x2714;&#xFE0F; **用語の日本語訳について**: 英語原文の"definition lists"に対する一般的な訳語は「定義リスト」「説明リスト」の2種類ある。「定義リスト」の方が正確な訳だが、日本版MDNではより平易な表現の「説明リスト」を用いており、本解説もMDNに従い「説明リスト」としている。

説明リスト全体は[`<dl>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/dl)、用語見出しは[`<dt>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/dt)、用語説明は[`<dd>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/dd)を用いる。

```markdown
<dl>
  <dt>用語1</dt>
  <dd>用語1の説明文</dd>
  <dt>用語2</dt>
  <dd>用語2の説明文</dd>
</dl>
```

> <dl>
>   <dt>用語1</dt>
>   <dd>用語1の説明文</dd>
>   <dt>用語2</dt>
>   <dd>用語2の説明文</dd>
> </dl>

ただしこの場合もGitHub環境では内部にMarkdownが使えないことに注意すること。

```markdown
<dl>
  <dt>_斜体と認識しない_</dt>
  <dd>**強調と認識しない** [リンクと認識しない](#)</dd>
</dl>
```

> <dl>
>   <dt>_斜体と認識しない_</dt>
>   <dd>**強調と認識しない** [リンクと認識しない](#)</dd>
> </dl>

GitHub Markdownで説明リストを記述する場合、`<dt>`及び`<dd>`の内部は全てHTMLで記述する必要がある。

```markdown
<dl>
  <dt><em>斜体(italic)</em></dt>
  <dd><strong>強調</strong> <a href="#">リンク</a></dd>
</dl>
```

> <dl>
>   <dt><em>斜体(italic)</em></dt>
>   <dd><strong>強調</strong> <a href="#">リンク</a></dd>
> </dl>

## 高度な表

GitHubでは[`<table>`](https://developer.mozilla.org/ja/docs/Web/HTML/Element/table)及びその関連要素を(確認した範囲内では全て)受け付ける。これを利用してMarkdownの[表]の範囲ではできない次のような表組みを表現できる。

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

> &#x2757;&#xFE0F; **注意**: 以上のケースでもセル(`<th>`, `<td>`)の内部にMarkdown書式は使えず、例えば`<td>[link](#)</td>`と書いても[リンク]として処理されずそのままテキストで表示される。HTMLで記述し`<td><a href="#">link</a></td>`とすれば受け付ける。

------------------------------------------------------------------------

[タスクリスト]
← [目次] →
[GitHub Markdown環境]

[HTMLインライン]: html-inlines.md
[タスクリスト]: task-lists.md
[ブロック]: blocks.md
[ブロック引用]: blocks引用.md
[リンク]: links.md
[空行]: characters.md#空行
[表]: tables.md
[目次]: index.md
[GitHub Markdown環境]: github-markdown.md
