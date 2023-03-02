# GitHub特有の機能

[その他の機能]
← [目次] →
[付録]

------------------------------------------------------------------------

最後にGitHub独自の機能から主要なものをいくつか説明する。

## 名前付き絵文字

GitHub Markdown環境には昔から独自の絵文字文化があり、`:name:`の書式で絵文字を[インライン]入力できる。

```markdown
:+1: :-1: :smile: :cry:
```

> :+1: :-1: :smile: :cry:

GitHubで使える絵文字名の一覧は次を参照。

https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md

これらの絵文字は対応するPNG画像と組になっている。PNG画像も含めた一覧は次の通り。

https://github.com/higuma/github-emoji-list/blob/main/README.md

> <details>
> <summary><strong>&#x2714;&#xFE0F; 取得方法</strong></summary>
> 
> 一覧はGitHub REST APIで取得できる。方法は次を参照(要GitHub token)。データはJSON形式。
> 
> https://docs.github.com/ja/rest/emojis
> 
> より単純に次のURLにアクセスしても取得可能(token不要)。
> 
> https://api.github.com/emojis
> </details>

> <details>
> <summary><strong>&#x2714;&#xFE0F; GitHub独自の絵文字</strong></summary>
> 
> 大部分はUnicodeの絵文字に対応しているが、中にはGitHub独自の絵文字もある。例えば次のような絵文字はGitHub独自で、Unicodeには対応する文字はない。
> 
> - `:atom:` → :atom:
> - `:electron:` → :electron:
> - `:octocat:` → :octocat:
> 
> 一覧は次を参照。
> 
> https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md#github-custom-emoji
> </details>

## GeoJSON, TopoJSON

[地理情報システム](https://ja.wikipedia.org/wiki/地理情報システム)に用いられる[GeoJSON](https://ja.wikipedia.org/wiki/GeoJSON)及び[TopoJSON](https://github.com/topojson/topojson)の両形式に対応しており、[コードブロック]の[info文字列]にそれぞれ`geojson`, `topojson`を指定して記述する。簡単なGeoJSONの例文を示す。

``````markdown
```geojson
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "label": "東京"
      },
      "geometry": {
        "coordinates": [
          139.76608172126356,
          35.68137975640924
        ],
        "type": "Point"
      }
    },
    {
      "type": "Feature",
      "properties": {
        "label": "富士山"
      },
      "geometry": {
        "coordinates": [
          138.73091465967775,
          35.36282365514147
        ],
        "type": "Point"
      }
    }
  ]
}
```
``````

> ```geojson
> {
>   "type": "FeatureCollection",
>   "features": [
>     {
>       "type": "Feature",
>       "properties": {
>         "label": "東京"
>       },
>       "geometry": {
>         "coordinates": [
>           139.76608172126356,
>           35.68137975640924
>         ],
>         "type": "Point"
>       }
>     },
>     {
>       "type": "Feature",
>       "properties": {
>         "label": "富士山"
>       },
>       "geometry": {
>         "coordinates": [
>           138.73091465967775,
>           35.36282365514147
>         ],
>         "type": "Point"
>       }
>     }
>   ]
> }
> ```

同じデータをTopoJSONに変換したものは次の通り。

``````markdown
```topojson
{
  "type": "Topology",
  "objects": {
    "collection": {
      "type": "GeometryCollection",
      "geometries": [
        {
          "type": "Point",
          "coordinates": [
            9999,
            9999
          ]
        },
        {
          "type": "Point",
          "coordinates": [
            0,
            0
          ]
        }
      ]
    }
  },
  "arcs": [],
  "bbox": [
    138.73091465967775,
    35.36282365514147,
    139.76608172126356,
    35.68137975640924
  ],
  "transform": {
    "scale": [
      0.00010352705886446742,
      0.00003185879600637802
    ],
    "translate": [
      138.73091465967775,
      35.36282365514147
    ]
  }
}
```
``````

> ```topojson
> {
>   "type": "Topology",
>   "objects": {
>     "collection": {
>       "type": "GeometryCollection",
>       "geometries": [
>         {
>           "type": "Point",
>           "coordinates": [
>             9999,
>             9999
>           ]
>         },
>         {
>           "type": "Point",
>           "coordinates": [
>             0,
>             0
>           ]
>         }
>       ]
>     }
>   },
>   "arcs": [],
>   "bbox": [
>     138.73091465967775,
>     35.36282365514147,
>     139.76608172126356,
>     35.68137975640924
>   ],
>   "transform": {
>     "scale": [
>       0.00010352705886446742,
>       0.00003185879600637802
>     ],
>     "translate": [
>       138.73091465967775,
>       35.36282365514147
>     ]
>   }
> }
> ```

> (2022-03現在) GitHubの地図機能がまだ十分なレベルに達しておらず、現段階ではまた有効な使い道としては難しい。ただしこの点は将来改良される可能性が高いので今から使えるように準備しておいて損はない。

## STL

三次元形状を表現する[Standard Triangulated Language (STL)](https://ja.wikipedia.org/wiki/Standard_Triangulated_Language)のテキスト形式(ASCII STL)に対応しており、[コードブロック]の[info文字列]に`stl`を指定して記述する。

``````markdown
```stl
solid tetrahedron
  facet normal -0.5773502691896258 0.5773502691896258 0.5773502691896258
    outer loop
      vertex 1 1 1
      vertex 0 1 0
      vertex 0 0 1
    endloop
  endfacet
  facet normal 0.5773502691896258 -0.5773502691896258 0.5773502691896258
    outer loop
      vertex 0 0 1
      vertex 1 0 0
      vertex 1 1 1
    endloop
  endfacet
  facet normal 0.5773502691896258 0.5773502691896258 -0.5773502691896258
    outer loop
      vertex 1 0 0
      vertex 0 1 0
      vertex 1 1 1
    endloop
  endfacet
  facet normal -0.5773502691896258 -0.5773502691896258 -0.5773502691896258
    outer loop
      vertex 0 0 1
      vertex 0 1 0
      vertex 1 0 0
    endloop
  endfacet
endsolid
```
``````

> ```stl
> solid tetrahedron
>   facet normal -0.5773502691896258 0.5773502691896258 0.5773502691896258
>     outer loop
>       vertex 1 1 1
>       vertex 0 1 0
>       vertex 0 0 1
>     endloop
>   endfacet
>   facet normal 0.5773502691896258 -0.5773502691896258 0.5773502691896258
>     outer loop
>       vertex 0 0 1
>       vertex 1 0 0
>       vertex 1 1 1
>     endloop
>   endfacet
>   facet normal 0.5773502691896258 0.5773502691896258 -0.5773502691896258
>     outer loop
>       vertex 1 0 0
>       vertex 0 1 0
>       vertex 1 1 1
>     endloop
>   endfacet
>   facet normal -0.5773502691896258 -0.5773502691896258 -0.5773502691896258
>     outer loop
>       vertex 0 0 1
>       vertex 0 1 0
>       vertex 1 0 0
>     endloop
>   endfacet
> endsolid
> ```

> <details>
> <summary>&#x2714;&#xFE0F; <strong>例: 立方体</strong></summary>
> 
> ``````markdown
> ```stl
> solid cube
>   facet normal -1 0 0
>     outer loop
>       vertex 0 0 0
>       vertex 0 1 1
>       vertex 0 1 0
>     endloop
>     outer loop
>       vertex 0 0 0
>       vertex 0 0 1
>       vertex 0 1 1
>     endloop
>   endfacet
>   facet normal 1 0 0
>     outer loop
>       vertex 1 0 0
>       vertex 1 1 0
>       vertex 1 1 1
>     endloop
>     outer loop
>       vertex 1 0 0
>       vertex 1 1 1
>       vertex 1 0 1
>     endloop
>   endfacet
>   facet normal 0 -1 0
>     outer loop
>       vertex 0 0 0
>       vertex 1 0 1
>       vertex 0 0 1
>     endloop
>     outer loop
>       vertex 0 0 0
>       vertex 1 0 0
>       vertex 1 0 1
>     endloop
>   endfacet
>   facet normal 0 1 0
>     outer loop
>       vertex 0 1 0
>       vertex 0 1 1
>       vertex 1 1 1
>     endloop
>     outer loop
>       vertex 0 1 0
>       vertex 1 1 1
>       vertex 1 1 0
>     endloop
>   endfacet
>   facet normal 0 0 -1
>     outer loop
>       vertex 0 0 0
>       vertex 1 1 0
>       vertex 1 0 0
>     endloop
>     outer loop
>       vertex 0 0 0
>       vertex 0 1 0
>       vertex 1 1 0
>     endloop
>   endfacet
>   facet normal 0 0 1
>     outer loop
>       vertex 0 0 1
>       vertex 1 0 1
>       vertex 1 1 1
>     endloop
>     outer loop
>       vertex 0 0 1
>       vertex 1 1 1
>       vertex 0 1 1
>     endloop
>   endfacet
> endsolid
> ```
> ``````
> 
> > ```stl
> > solid cube
> >   facet normal -1 0 0
> >     outer loop
> >       vertex 0 0 0
> >       vertex 0 1 1
> >       vertex 0 1 0
> >     endloop
> >     outer loop
> >       vertex 0 0 0
> >       vertex 0 0 1
> >       vertex 0 1 1
> >     endloop
> >   endfacet
> >   facet normal 1 0 0
> >     outer loop
> >       vertex 1 0 0
> >       vertex 1 1 0
> >       vertex 1 1 1
> >     endloop
> >     outer loop
> >       vertex 1 0 0
> >       vertex 1 1 1
> >       vertex 1 0 1
> >     endloop
> >   endfacet
> >   facet normal 0 -1 0
> >     outer loop
> >       vertex 0 0 0
> >       vertex 1 0 1
> >       vertex 0 0 1
> >     endloop
> >     outer loop
> >       vertex 0 0 0
> >       vertex 1 0 0
> >       vertex 1 0 1
> >     endloop
> >   endfacet
> >   facet normal 0 1 0
> >     outer loop
> >       vertex 0 1 0
> >       vertex 0 1 1
> >       vertex 1 1 1
> >     endloop
> >     outer loop
> >       vertex 0 1 0
> >       vertex 1 1 1
> >       vertex 1 1 0
> >     endloop
> >   endfacet
> >   facet normal 0 0 -1
> >     outer loop
> >       vertex 0 0 0
> >       vertex 1 1 0
> >       vertex 1 0 0
> >     endloop
> >     outer loop
> >       vertex 0 0 0
> >       vertex 0 1 0
> >       vertex 1 1 0
> >     endloop
> >   endfacet
> >   facet normal 0 0 1
> >     outer loop
> >       vertex 0 0 1
> >       vertex 1 0 1
> >       vertex 1 1 1
> >     endloop
> >     outer loop
> >       vertex 0 0 1
> >       vertex 1 1 1
> >       vertex 0 1 1
> >     endloop
> >   endfacet
> > endsolid
> > ```
> > </details>

## ソースリスティングURIの範囲指定

TODO




### CSSの色表現

Issues/Pull requests/Discussionsでは[コードスパン]中にCSSの色表現(例: `rgb(80, 120, 240)`)を記述するとカラーサンプル付きで表示する。これはGitHub repoでは機能しないのでgistのコメントとして実例を作成した。次の(本文ではなくその下の)コメント欄を見ると効果を確認できる。

https://gist.github.com/higuma/80cff0982f9f7e2a267b33cad20f984a




------------------------------------------------------------------------

[その他の機能]
← [目次] →
[付録]

[info文字列]: code-blocks.md#info文字列
[インライン]: inlines.md
[コードブロック]: code-blocks.md
[その他の機能]: other.features.md
[目次]: index.md#github-specific
[付録]: appendices.md



<!--
[HTMLブロック]: html-blocks.md
[コードスパン]: code-spans.md
[ノーブレークスペース]: texts.md#ノーブレークスペース
[バックスラッシュエスケープ]:characters.md#バックスラッシュエスケープ
[ブロック]: blocks.md
[非表示区切り]: texts.md#非表示区切り
[空行]: characters.md#空行
[文字参照]: characters.md#文字参照
[ASCII句読文字]: backslash-escapes.md#ASCII句読文字
[折りたたみ]: html-blocks.md#折りたたみ
[見出し]: thematic-breaks.md
-->
