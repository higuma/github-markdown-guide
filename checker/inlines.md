# GFM Examples implementation checker - [6 Inlines](https://higuma.github.io/github-flabored-markdown/#inlines)

[5 Container blocks](container-blocks.md)
← [Table of Contents](index.md) 	
[Appendix: A parsing strategy](appendix-a-parsing-strategy.md)

------------------------------------------------------------------------

### [Example 307](https://higuma.github.io/github-flabored-markdown/#example-307)

`hi`lo`

## [6.1 Backslash escapes](https://higuma.github.io/github-flabored-markdown/#backslash-escapes)

### [Example 308](https://higuma.github.io/github-flabored-markdown/#example-308)

\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~

### [Example 309](https://higuma.github.io/github-flabored-markdown/#example-309)

\	\A\a\ \3\φ\«

### [Example 310](https://higuma.github.io/github-flabored-markdown/#example-310)

\*not emphasized*
\<br/> not a tag
\[not a link](/foo)
\`not code`
1\. not a list
\* not a list
\# not a heading
\[foo]: /url "not a reference"
\&ouml; not a character entity

### [Example 311](https://higuma.github.io/github-flabored-markdown/#example-311)

\\*emphasis*

### [Example 312](https://higuma.github.io/github-flabored-markdown/#example-312)

foo\
bar

### [Example 313](https://higuma.github.io/github-flabored-markdown/#example-313)

`` \[\` ``

### [Example 314](https://higuma.github.io/github-flabored-markdown/#example-314)

    \[\]

### [Example 315](https://higuma.github.io/github-flabored-markdown/#example-315)

~~~
\[\]
~~~

### [Example 316](https://higuma.github.io/github-flabored-markdown/#example-316)

<http://example.com?find=\*>

### [Example 317](https://higuma.github.io/github-flabored-markdown/#example-317)

<a href="/bar\/)">

### [Example 318](https://higuma.github.io/github-flabored-markdown/#example-318)

[foo](/bar\* "ti\*tle")

### [Example 319](https://higuma.github.io/github-flabored-markdown/#example-319)

→ [Example 319](examples/319.md)

### [Example 320](https://higuma.github.io/github-flabored-markdown/#example-320)

``` foo\+bar
foo
```

## [6.2 Entity and numeric character references](https://higuma.github.io/github-flabored-markdown/#entity-and-numeric-character-references)

### [Example 321](https://higuma.github.io/github-flabored-markdown/#example-321)

&nbsp; &amp; &copy; &AElig; &Dcaron;
&frac34; &HilbertSpace; &DifferentialD;
&ClockwiseContourIntegral; &ngE;

### [Example 322](https://higuma.github.io/github-flabored-markdown/#example-322)

&#35; &#1234; &#992; &#0;

### [Example 323](https://higuma.github.io/github-flabored-markdown/#example-323)

&#X22; &#XD06; &#xcab;

### [Example 324](https://higuma.github.io/github-flabored-markdown/#example-324)

&nbsp &x; &#; &#x;
&#87654321;
&#abcdef0;
&ThisIsNotDefined; &hi?;

### [Example 325](https://higuma.github.io/github-flabored-markdown/#example-325)

&copy

### [Example 326](https://higuma.github.io/github-flabored-markdown/#example-326)

&MadeUpEntity;

### [Example 327](https://higuma.github.io/github-flabored-markdown/#example-327)

→ [Example 327](examples/327.md)

### [Example 328](https://higuma.github.io/github-flabored-markdown/#example-328)

[foo](/f&ouml;&ouml; "f&ouml;&ouml;")

### [Example 329](https://higuma.github.io/github-flabored-markdown/#example-329)

→ [Example 329](examples/329.md)

### [Example 330](https://higuma.github.io/github-flabored-markdown/#example-330)

``` f&ouml;&ouml;
foo
```

### [Example 331](https://higuma.github.io/github-flabored-markdown/#example-331)

`f&ouml;&ouml;`

### [Example 332](https://higuma.github.io/github-flabored-markdown/#example-332)

    f&ouml;f&ouml;

### [Example 333](https://higuma.github.io/github-flabored-markdown/#example-333)

&#42;foo&#42;
*foo*

### [Example 334](https://higuma.github.io/github-flabored-markdown/#example-334)

&#42; foo

* foo

### [Example 335](https://higuma.github.io/github-flabored-markdown/#example-335)

foo&#10;&#10;bar

### [Example 336](https://higuma.github.io/github-flabored-markdown/#example-336)

&#9;foo

### [Example 337](https://higuma.github.io/github-flabored-markdown/#example-337)

[a](url &quot;tit&quot;)

## [6.3 Code spans](https://higuma.github.io/github-flabored-markdown/#code-spans)

### [Example 338](https://higuma.github.io/github-flabored-markdown/#example-338)

`foo`

### [Example 339](https://higuma.github.io/github-flabored-markdown/#example-339)

`` foo ` bar ``

### [Example 340](https://higuma.github.io/github-flabored-markdown/#example-340)

` `` `

### [Example 341](https://higuma.github.io/github-flabored-markdown/#example-341)

`  ``  `

### [Example 342](https://higuma.github.io/github-flabored-markdown/#example-342)

` a`

### [Example 343](https://higuma.github.io/github-flabored-markdown/#example-343)

` b `

### [Example 344](https://higuma.github.io/github-flabored-markdown/#example-344)

` `
`  `

### [Example 345](https://higuma.github.io/github-flabored-markdown/#example-345)

``
foo
bar  
baz
``

### [Example 346](https://higuma.github.io/github-flabored-markdown/#example-346)

``
foo 
``

### [Example 347](https://higuma.github.io/github-flabored-markdown/#example-347)

`foo   bar 
baz`

### [Example 348](https://higuma.github.io/github-flabored-markdown/#example-348)

`foo\`bar`

### [Example 349](https://higuma.github.io/github-flabored-markdown/#example-349)

``foo`bar``

### [Example 350](https://higuma.github.io/github-flabored-markdown/#example-350)

` foo `` bar `

### [Example 351](https://higuma.github.io/github-flabored-markdown/#example-351)

*foo`*`

### [Example 352](https://higuma.github.io/github-flabored-markdown/#example-352)

[not a `link](/foo`)

### [Example 353](https://higuma.github.io/github-flabored-markdown/#example-353)

`<a href="`">`

### [Example 354](https://higuma.github.io/github-flabored-markdown/#example-354)

→ [Example 354](examples/354.md)

### [Example 355](https://higuma.github.io/github-flabored-markdown/#example-355)

`<http://foo.bar.`baz>`

### [Example 356](https://higuma.github.io/github-flabored-markdown/#example-356)

<http://foo.bar.`baz>`

### [Example 357](https://higuma.github.io/github-flabored-markdown/#example-357)

```foo``

### [Example 358](https://higuma.github.io/github-flabored-markdown/#example-358)

`foo

### [Example 359](https://higuma.github.io/github-flabored-markdown/#example-359)

`foo``bar``

## [6.4 Emphasis and strong emphasis](https://higuma.github.io/github-flabored-markdown/#emphasis-and-strong-emphasis)

### [Example 360](https://higuma.github.io/github-flabored-markdown/#example-360)

*foo bar*

### [Example 361](https://higuma.github.io/github-flabored-markdown/#example-361)

a * foo bar*

### [Example 362](https://higuma.github.io/github-flabored-markdown/#example-362)

a*"foo"*

### [Example 363](https://higuma.github.io/github-flabored-markdown/#example-363)

* a *

### [Example 364](https://higuma.github.io/github-flabored-markdown/#example-364)

foo*bar*

### [Example 365](https://higuma.github.io/github-flabored-markdown/#example-365)

5*6*78

### [Example 366](https://higuma.github.io/github-flabored-markdown/#example-366)

_foo bar_

### [Example 367](https://higuma.github.io/github-flabored-markdown/#example-367)

_ foo bar_

### [Example 368](https://higuma.github.io/github-flabored-markdown/#example-368)

a_"foo"_

### [Example 369](https://higuma.github.io/github-flabored-markdown/#example-369)

foo_bar_

### [Example 370](https://higuma.github.io/github-flabored-markdown/#example-370)

5_6_78

### [Example 371](https://higuma.github.io/github-flabored-markdown/#example-371)

пристаням_стремятся_

### [Example 372](https://higuma.github.io/github-flabored-markdown/#example-372)

aa_"bb"_cc

### [Example 373](https://higuma.github.io/github-flabored-markdown/#example-373)

foo-_(bar)_

### [Example 374](https://higuma.github.io/github-flabored-markdown/#example-374)

_foo*

### [Example 375](https://higuma.github.io/github-flabored-markdown/#example-375)

*foo bar *

### [Example 376](https://higuma.github.io/github-flabored-markdown/#example-376)

*foo bar
*

### [Example 377](https://higuma.github.io/github-flabored-markdown/#example-377)

*(*foo)

### [Example 378](https://higuma.github.io/github-flabored-markdown/#example-378)

*(*foo*)*

### [Example 379](https://higuma.github.io/github-flabored-markdown/#example-379)

*foo*bar

### [Example 380](https://higuma.github.io/github-flabored-markdown/#example-380)

_foo bar _

### [Example 381](https://higuma.github.io/github-flabored-markdown/#example-381)

_(_foo)

### [Example 382](https://higuma.github.io/github-flabored-markdown/#example-382)

_(_foo_)_

### [Example 383](https://higuma.github.io/github-flabored-markdown/#example-383)

_foo_bar

### [Example 384](https://higuma.github.io/github-flabored-markdown/#example-384)

_пристаням_стремятся

### [Example 385](https://higuma.github.io/github-flabored-markdown/#example-385)

_foo_bar_baz_

### [Example 386](https://higuma.github.io/github-flabored-markdown/#example-386)

_(bar)_.

### [Example 387](https://higuma.github.io/github-flabored-markdown/#example-387)

**foo bar**

### [Example 388](https://higuma.github.io/github-flabored-markdown/#example-388)

** foo bar**

### [Example 389](https://higuma.github.io/github-flabored-markdown/#example-389)

a**"foo"**

### [Example 390](https://higuma.github.io/github-flabored-markdown/#example-390)

foo**bar**

### [Example 391](https://higuma.github.io/github-flabored-markdown/#example-391)

__foo bar__

### [Example 392](https://higuma.github.io/github-flabored-markdown/#example-392)

__ foo bar__

### [Example 393](https://higuma.github.io/github-flabored-markdown/#example-393)

__
foo bar__

### [Example 394](https://higuma.github.io/github-flabored-markdown/#example-394)

a__"foo"__

### [Example 395](https://higuma.github.io/github-flabored-markdown/#example-395)

foo__bar__

### [Example 396](https://higuma.github.io/github-flabored-markdown/#example-396)

5__6__78

### [Example 397](https://higuma.github.io/github-flabored-markdown/#example-397)

пристаням__стремятся__

### [Example 398](https://higuma.github.io/github-flabored-markdown/#example-398)

__foo, __bar__, baz__

### [Example 399](https://higuma.github.io/github-flabored-markdown/#example-399)

foo-__(bar)__

### [Example 400](https://higuma.github.io/github-flabored-markdown/#example-400)

**foo bar **

### [Example 401](https://higuma.github.io/github-flabored-markdown/#example-401)

**(**foo)

### [Example 402](https://higuma.github.io/github-flabored-markdown/#example-402)

*(**foo**)*

### [Example 403](https://higuma.github.io/github-flabored-markdown/#example-403)

**Gomphocarpus (*Gomphocarpus physocarpus*, syn.
*Asclepias physocarpa*)**

### [Example 404](https://higuma.github.io/github-flabored-markdown/#example-404)

**foo "*bar*" foo**

### [Example 405](https://higuma.github.io/github-flabored-markdown/#example-405)

**foo**bar

### [Example 406](https://higuma.github.io/github-flabored-markdown/#example-406)

__foo bar __

### [Example 407](https://higuma.github.io/github-flabored-markdown/#example-407)

__(__foo)

### [Example 408](https://higuma.github.io/github-flabored-markdown/#example-408)

_(__foo__)_

### [Example 409](https://higuma.github.io/github-flabored-markdown/#example-409)

__foo__bar

### [Example 410](https://higuma.github.io/github-flabored-markdown/#example-410)

__пристаням__стремятся

### [Example 411](https://higuma.github.io/github-flabored-markdown/#example-411)

__foo__bar__baz__

### [Example 412](https://higuma.github.io/github-flabored-markdown/#example-412)

__(bar)__.

### [Example 413](https://higuma.github.io/github-flabored-markdown/#example-413)

*foo [bar](/url)*

### [Example 414](https://higuma.github.io/github-flabored-markdown/#example-414)

*foo
bar*

### [Example 415](https://higuma.github.io/github-flabored-markdown/#example-415)

_foo __bar__ baz_

### [Example 416](https://higuma.github.io/github-flabored-markdown/#example-416)

_foo _bar_ baz_

### [Example 417](https://higuma.github.io/github-flabored-markdown/#example-417)

__foo_ bar_

### [Example 418](https://higuma.github.io/github-flabored-markdown/#example-418)

*foo *bar**

### [Example 419](https://higuma.github.io/github-flabored-markdown/#example-419)

*foo **bar** baz*

### [Example 420](https://higuma.github.io/github-flabored-markdown/#example-420)

*foo**bar**baz*

### [Example 421](https://higuma.github.io/github-flabored-markdown/#example-421)

*foo**bar*

### [Example 422](https://higuma.github.io/github-flabored-markdown/#example-422)

***foo** bar*

### [Example 423](https://higuma.github.io/github-flabored-markdown/#example-423)

*foo **bar***

### [Example 424](https://higuma.github.io/github-flabored-markdown/#example-424)

*foo**bar***

### [Example 425](https://higuma.github.io/github-flabored-markdown/#example-425)

foo***bar***baz

### [Example 426](https://higuma.github.io/github-flabored-markdown/#example-426)

foo******bar*********baz

### [Example 427](https://higuma.github.io/github-flabored-markdown/#example-427)

*foo **bar *baz* bim** bop*

### [Example 428](https://higuma.github.io/github-flabored-markdown/#example-428)

*foo [*bar*](/url)*

### [Example 429](https://higuma.github.io/github-flabored-markdown/#example-429)

** is not an empty emphasis

### [Example 430](https://higuma.github.io/github-flabored-markdown/#example-430)

**** is not an empty strong emphasis

### [Example 431](https://higuma.github.io/github-flabored-markdown/#example-431)

**foo [bar](/url)**

### [Example 432](https://higuma.github.io/github-flabored-markdown/#example-432)

**foo
bar**

### [Example 433](https://higuma.github.io/github-flabored-markdown/#example-433)

__foo _bar_ baz__

### [Example 434](https://higuma.github.io/github-flabored-markdown/#example-434)

__foo __bar__ baz__

### [Example 435](https://higuma.github.io/github-flabored-markdown/#example-435)

____foo__ bar__

### [Example 436](https://higuma.github.io/github-flabored-markdown/#example-436)

**foo **bar****

### [Example 437](https://higuma.github.io/github-flabored-markdown/#example-437)

**foo *bar* baz**

### [Example 438](https://higuma.github.io/github-flabored-markdown/#example-438)

**foo*bar*baz**

### [Example 439](https://higuma.github.io/github-flabored-markdown/#example-439)

***foo* bar**

### [Example 440](https://higuma.github.io/github-flabored-markdown/#example-440)

**foo *bar***

### [Example 441](https://higuma.github.io/github-flabored-markdown/#example-441)

**foo *bar **baz**
bim* bop**

### [Example 442](https://higuma.github.io/github-flabored-markdown/#example-442)

**foo [*bar*](/url)**

### [Example 443](https://higuma.github.io/github-flabored-markdown/#example-443)

__ is not an empty emphasis

### [Example 444](https://higuma.github.io/github-flabored-markdown/#example-444)

____ is not an empty strong emphasis

### [Example 445](https://higuma.github.io/github-flabored-markdown/#example-445)

foo ***

### [Example 446](https://higuma.github.io/github-flabored-markdown/#example-446)

foo *\**

### [Example 447](https://higuma.github.io/github-flabored-markdown/#example-447)

foo *_*

### [Example 448](https://higuma.github.io/github-flabored-markdown/#example-448)

foo *****

### [Example 449](https://higuma.github.io/github-flabored-markdown/#example-449)

foo **\***

### [Example 450](https://higuma.github.io/github-flabored-markdown/#example-450)

foo **_**

### [Example 451](https://higuma.github.io/github-flabored-markdown/#example-451)

**foo*

### [Example 452](https://higuma.github.io/github-flabored-markdown/#example-452)

*foo**

### [Example 453](https://higuma.github.io/github-flabored-markdown/#example-453)

***foo**

### [Example 454](https://higuma.github.io/github-flabored-markdown/#example-454)

****foo*

### [Example 455](https://higuma.github.io/github-flabored-markdown/#example-455)

**foo***

### [Example 456](https://higuma.github.io/github-flabored-markdown/#example-456)

*foo****

### [Example 457](https://higuma.github.io/github-flabored-markdown/#example-457)

foo ___

### [Example 458](https://higuma.github.io/github-flabored-markdown/#example-458)

foo _\__

### [Example 459](https://higuma.github.io/github-flabored-markdown/#example-459)

foo _*_

### [Example 460](https://higuma.github.io/github-flabored-markdown/#example-460)

foo _____

### [Example 461](https://higuma.github.io/github-flabored-markdown/#example-461)

foo __\___

### [Example 462](https://higuma.github.io/github-flabored-markdown/#example-462)

foo __*__

### [Example 463](https://higuma.github.io/github-flabored-markdown/#example-463)

__foo_

### [Example 464](https://higuma.github.io/github-flabored-markdown/#example-464)

_foo__

### [Example 465](https://higuma.github.io/github-flabored-markdown/#example-465)

___foo__

### [Example 466](https://higuma.github.io/github-flabored-markdown/#example-466)

____foo_

### [Example 467](https://higuma.github.io/github-flabored-markdown/#example-467)

__foo___

### [Example 468](https://higuma.github.io/github-flabored-markdown/#example-468)

_foo____

### [Example 469](https://higuma.github.io/github-flabored-markdown/#example-469)

**foo**

### [Example 470](https://higuma.github.io/github-flabored-markdown/#example-470)

*_foo_*

### [Example 471](https://higuma.github.io/github-flabored-markdown/#example-471)

__foo__

### [Example 472](https://higuma.github.io/github-flabored-markdown/#example-472)

_*foo*_

### [Example 473](https://higuma.github.io/github-flabored-markdown/#example-473)

****foo****

### [Example 474](https://higuma.github.io/github-flabored-markdown/#example-474)

____foo____

### [Example 475](https://higuma.github.io/github-flabored-markdown/#example-475)

******foo******

### [Example 476](https://higuma.github.io/github-flabored-markdown/#example-476)

***foo***

### [Example 477](https://higuma.github.io/github-flabored-markdown/#example-477)

_____foo_____

### [Example 478](https://higuma.github.io/github-flabored-markdown/#example-478)

*foo _bar* baz_

### [Example 479](https://higuma.github.io/github-flabored-markdown/#example-479)

*foo __bar *baz bim__ bam*

### [Example 480](https://higuma.github.io/github-flabored-markdown/#example-480)

**foo **bar baz**

### [Example 481](https://higuma.github.io/github-flabored-markdown/#example-481)

*foo *bar baz*

### [Example 482](https://higuma.github.io/github-flabored-markdown/#example-482)

*[bar*](/url)

### [Example 483](https://higuma.github.io/github-flabored-markdown/#example-483)

_foo [bar_](/url)

### [Example 484](https://higuma.github.io/github-flabored-markdown/#example-484)

*<img src="foo" title="*"/>

### [Example 485](https://higuma.github.io/github-flabored-markdown/#example-485)

**<a href="**">

### [Example 486](https://higuma.github.io/github-flabored-markdown/#example-486)

__<a href="__">

### [Example 487](https://higuma.github.io/github-flabored-markdown/#example-487)

*a `*`*

### [Example 488](https://higuma.github.io/github-flabored-markdown/#example-488)

_a `_`_

### [Example 489](https://higuma.github.io/github-flabored-markdown/#example-489)

**a<http://foo.bar/?q=**>

### [Example 490](https://higuma.github.io/github-flabored-markdown/#example-490)

__a<http://foo.bar/?q=__>

## [6.5 Strikethrough (extension)](https://higuma.github.io/github-flabored-markdown/#strikethrough-extension-)

### [Example 491](https://higuma.github.io/github-flabored-markdown/#example-491)

~~Hi~~ Hello, world!

### [Example 492](https://higuma.github.io/github-flabored-markdown/#example-492)

This ~~has a

new paragraph~~.

## [6.6 Links](https://higuma.github.io/github-flabored-markdown/#links)

### [Example 493](https://higuma.github.io/github-flabored-markdown/#example-493)

[link](/uri "title")

### [Example 494](https://higuma.github.io/github-flabored-markdown/#example-494)

[link](/uri)

### [Example 495](https://higuma.github.io/github-flabored-markdown/#example-495)

[link]()

### [Example 496](https://higuma.github.io/github-flabored-markdown/#example-496)

[link](<>)

### [Example 497](https://higuma.github.io/github-flabored-markdown/#example-497)

[link](/my uri)

### [Example 498](https://higuma.github.io/github-flabored-markdown/#example-498)

[link](</my uri>)

### [Example 499](https://higuma.github.io/github-flabored-markdown/#example-499)

[link](foo
bar)

### [Example 500](https://higuma.github.io/github-flabored-markdown/#example-500)

[link](<foo
bar>)

### [Example 501](https://higuma.github.io/github-flabored-markdown/#example-501)

[a](<b)c>)

### [Example 502](https://higuma.github.io/github-flabored-markdown/#example-502)

[link](<foo\>)

### [Example 503](https://higuma.github.io/github-flabored-markdown/#example-503)

[a](<b)c
[a](<b)c>
[a](<b>c)

### [Example 504](https://higuma.github.io/github-flabored-markdown/#example-504)

[link](\(foo\))

### [Example 505](https://higuma.github.io/github-flabored-markdown/#example-505)

[link](foo(and(bar)))

### [Example 506](https://higuma.github.io/github-flabored-markdown/#example-506)

[link](foo\(and\(bar\))

### [Example 507](https://higuma.github.io/github-flabored-markdown/#example-507)

[link](<foo(and(bar)>)

### [Example 508](https://higuma.github.io/github-flabored-markdown/#example-508)

[link](foo\)\:)

### [Example 509](https://higuma.github.io/github-flabored-markdown/#example-509)

[link](#fragment)

[link](http://example.com#fragment)

[link](http://example.com?foo=3#frag)

### [Example 510](https://higuma.github.io/github-flabored-markdown/#example-510)

[link](foo\bar)

### [Example 511](https://higuma.github.io/github-flabored-markdown/#example-511)

[link](foo%20b&auml;)

### [Example 512](https://higuma.github.io/github-flabored-markdown/#example-512)

[link]("title")

### [Example 513](https://higuma.github.io/github-flabored-markdown/#example-513)

[link](/url "title")
[link](/url 'title')
[link](/url (title))

### [Example 514](https://higuma.github.io/github-flabored-markdown/#example-514)

[link](/url "title \"&quot;")

### [Example 515](https://higuma.github.io/github-flabored-markdown/#example-515)

[link](/url "title")

### [Example 516](https://higuma.github.io/github-flabored-markdown/#example-516)

[link](/url "title "and" title")

### [Example 517](https://higuma.github.io/github-flabored-markdown/#example-517)

[link](/url 'title "and" title')

### [Example 518](https://higuma.github.io/github-flabored-markdown/#example-518)

[link](   /uri
  "title"  )

### [Example 519](https://higuma.github.io/github-flabored-markdown/#example-519)

[link] (/uri)

### [Example 520](https://higuma.github.io/github-flabored-markdown/#example-520)

[link [foo [bar]]](/uri)

### [Example 521](https://higuma.github.io/github-flabored-markdown/#example-521)

[link] bar](/uri)

### [Example 522](https://higuma.github.io/github-flabored-markdown/#example-522)

[link [bar](/uri)

### [Example 523](https://higuma.github.io/github-flabored-markdown/#example-523)

[link \[bar](/uri)

### [Example 524](https://higuma.github.io/github-flabored-markdown/#example-524)

[link *foo **bar** `#`*](/uri)

### [Example 525](https://higuma.github.io/github-flabored-markdown/#example-525)

[![moon](moon.jpg)](/uri)

### [Example 526](https://higuma.github.io/github-flabored-markdown/#example-526)

[foo [bar](/uri)](/uri)

### [Example 527](https://higuma.github.io/github-flabored-markdown/#example-527)

[foo *[bar [baz](/uri)](/uri)*](/uri)

### [Example 528](https://higuma.github.io/github-flabored-markdown/#example-528)

![[[foo](uri1)](uri2)](uri3)

### [Example 529](https://higuma.github.io/github-flabored-markdown/#example-529)

*[foo*](/uri)

### [Example 530](https://higuma.github.io/github-flabored-markdown/#example-530)

[foo *bar](baz*)

### [Example 531](https://higuma.github.io/github-flabored-markdown/#example-531)

*foo [bar* baz]

### [Example 532](https://higuma.github.io/github-flabored-markdown/#example-532)

[foo <bar attr="](baz)">

### [Example 533](https://higuma.github.io/github-flabored-markdown/#example-533)

[foo`](/uri)`

### [Example 534](https://higuma.github.io/github-flabored-markdown/#example-534)

[foo<http://example.com/?search=](uri)>

### [Example 535](https://higuma.github.io/github-flabored-markdown/#example-535)

→ [Example 535](examples/535.md)

### [Example 536](https://higuma.github.io/github-flabored-markdown/#example-536)

→ [Example 536](examples/536.md)

### [Example 537](https://higuma.github.io/github-flabored-markdown/#example-537)

→ [Example 537](examples/537.md)

### [Example 538](https://higuma.github.io/github-flabored-markdown/#example-538)

→ [Example 538](examples/538.md)

### [Example 539](https://higuma.github.io/github-flabored-markdown/#example-539)

→ [Example 539](examples/539.md)

### [Example 540](https://higuma.github.io/github-flabored-markdown/#example-540)

→ [Example 540](examples/540.md)

### [Example 541](https://higuma.github.io/github-flabored-markdown/#example-541)

→ [Example 541](examples/541.md)

### [Example 542](https://higuma.github.io/github-flabored-markdown/#example-542)

→ [Example 542](examples/542.md)

### [Example 543](https://higuma.github.io/github-flabored-markdown/#example-543)

→ [Example 543](examples/543.md)

### [Example 544](https://higuma.github.io/github-flabored-markdown/#example-544)

→ [Example 544](examples/544.md)

### [Example 545](https://higuma.github.io/github-flabored-markdown/#example-545)

→ [Example 545](examples/545.md)

### [Example 546](https://higuma.github.io/github-flabored-markdown/#example-546)

→ [Example 546](examples/546.md)

### [Example 547](https://higuma.github.io/github-flabored-markdown/#example-547)

→ [Example 547](examples/547.md)

### [Example 548](https://higuma.github.io/github-flabored-markdown/#example-548)

→ [Example 548](examples/548.md)

### [Example 549](https://higuma.github.io/github-flabored-markdown/#example-549)

→ [Example 549](examples/549.md)

### [Example 550](https://higuma.github.io/github-flabored-markdown/#example-550)

→ [Example 550](examples/550.md)

### [Example 551](https://higuma.github.io/github-flabored-markdown/#example-551)

→ [Example 551](examples/551.md)

### [Example 552](https://higuma.github.io/github-flabored-markdown/#example-552)

→ [Example 552](examples/552.md)

### [Example 553](https://higuma.github.io/github-flabored-markdown/#example-553)

→ [Example 553](examples/553.md)

### [Example 554](https://higuma.github.io/github-flabored-markdown/#example-554)

→ [Example 554](examples/554.md)

### [Example 555](https://higuma.github.io/github-flabored-markdown/#example-555)

→ [Example 555](examples/555.md)

### [Example 556](https://higuma.github.io/github-flabored-markdown/#example-556)

→ [Example 556](examples/556.md)

### [Example 557](https://higuma.github.io/github-flabored-markdown/#example-557)

→ [Example 557](examples/557.md)

### [Example 558](https://higuma.github.io/github-flabored-markdown/#example-558)

→ [Example 558](examples/558.md)

### [Example 559](https://higuma.github.io/github-flabored-markdown/#example-559)

→ [Example 559](examples/559.md)

### [Example 560](https://higuma.github.io/github-flabored-markdown/#example-560)

→ [Example 560](examples/560.md)

### [Example 561](https://higuma.github.io/github-flabored-markdown/#example-561)

→ [Example 561](examples/561.md)

### [Example 562](https://higuma.github.io/github-flabored-markdown/#example-562)

→ [Example 562](examples/562.md)

### [Example 563](https://higuma.github.io/github-flabored-markdown/#example-563)

→ [Example 563](examples/563.md)

### [Example 564](https://higuma.github.io/github-flabored-markdown/#example-564)

→ [Example 564](examples/564.md)

### [Example 565](https://higuma.github.io/github-flabored-markdown/#example-565)

→ [Example 565](examples/565.md)

### [Example 566](https://higuma.github.io/github-flabored-markdown/#example-566)

→ [Example 566](examples/566.md)

### [Example 567](https://higuma.github.io/github-flabored-markdown/#example-567)

→ [Example 567](examples/567.md)

### [Example 568](https://higuma.github.io/github-flabored-markdown/#example-568)

→ [Example 568](examples/568.md)

### [Example 569](https://higuma.github.io/github-flabored-markdown/#example-569)

→ [Example 569](examples/569.md)

### [Example 570](https://higuma.github.io/github-flabored-markdown/#example-570)

→ [Example 570](examples/570.md)

### [Example 571](https://higuma.github.io/github-flabored-markdown/#example-571)

→ [Example 571](examples/571.md)

### [Example 572](https://higuma.github.io/github-flabored-markdown/#example-572)

→ [Example 572](examples/572.md)

### [Example 573](https://higuma.github.io/github-flabored-markdown/#example-573)

→ [Example 573](examples/573.md)

### [Example 574](https://higuma.github.io/github-flabored-markdown/#example-574)

→ [Example 574](examples/574.md)

### [Example 575](https://higuma.github.io/github-flabored-markdown/#example-575)

→ [Example 575](examples/575.md)

### [Example 576](https://higuma.github.io/github-flabored-markdown/#example-576)

→ [Example 576](examples/576.md)

### [Example 577](https://higuma.github.io/github-flabored-markdown/#example-577)

→ [Example 577](examples/577.md)

### [Example 578](https://higuma.github.io/github-flabored-markdown/#example-578)

→ [Example 578](examples/578.md)

### [Example 579](https://higuma.github.io/github-flabored-markdown/#example-579)

→ [Example 579](examples/579.md)

## [6.7 Images](https://higuma.github.io/github-flabored-markdown/#images)

### [Example 580](https://higuma.github.io/github-flabored-markdown/#example-580)

![foo](/url "title")

### [Example 581](https://higuma.github.io/github-flabored-markdown/#example-581)

→ [Example 581](examples/581.md)

### [Example 582](https://higuma.github.io/github-flabored-markdown/#example-582)

![foo ![bar](/url)](/url2)

### [Example 583](https://higuma.github.io/github-flabored-markdown/#example-583)

![foo [bar](/url)](/url2)

### [Example 584](https://higuma.github.io/github-flabored-markdown/#example-584)

→ [Example 584](examples/584.md)

### [Example 585](https://higuma.github.io/github-flabored-markdown/#example-585)

→ [Example 585](examples/585.md)

### [Example 586](https://higuma.github.io/github-flabored-markdown/#example-586)

![foo](train.jpg)

### [Example 587](https://higuma.github.io/github-flabored-markdown/#example-587)

My ![foo bar](/path/to/train.jpg  "title"   )

### [Example 588](https://higuma.github.io/github-flabored-markdown/#example-588)

![foo](<url>)

### [Example 589](https://higuma.github.io/github-flabored-markdown/#example-589)

![](/url)

### [Example 590](https://higuma.github.io/github-flabored-markdown/#example-590)

→ [Example 590](examples/590.md)

### [Example 591](https://higuma.github.io/github-flabored-markdown/#example-591)

→ [Example 591](examples/591.md)

### [Example 592](https://higuma.github.io/github-flabored-markdown/#example-592)

→ [Example 592](examples/592.md)

### [Example 593](https://higuma.github.io/github-flabored-markdown/#example-593)

→ [Example 593](examples/593.md)

### [Example 594](https://higuma.github.io/github-flabored-markdown/#example-594)

→ [Example 594](examples/594.md)

### [Example 595](https://higuma.github.io/github-flabored-markdown/#example-595)

→ [Example 595](examples/595.md)

### [Example 596](https://higuma.github.io/github-flabored-markdown/#example-596)

→ [Example 596](examples/596.md)

### [Example 597](https://higuma.github.io/github-flabored-markdown/#example-597)

→ [Example 597](examples/597.md)

### [Example 598](https://higuma.github.io/github-flabored-markdown/#example-598)

→ [Example 598](examples/598.md)

### [Example 599](https://higuma.github.io/github-flabored-markdown/#example-599)

→ [Example 599](examples/599.md)

### [Example 600](https://higuma.github.io/github-flabored-markdown/#example-600)

→ [Example 600](examples/600.md)

### [Example 601](https://higuma.github.io/github-flabored-markdown/#example-601)

→ [Example 601](examples/601.md)

## [6.8 Autolinks](https://higuma.github.io/github-flabored-markdown/#autolinks)

### [Example 602](https://higuma.github.io/github-flabored-markdown/#example-602)

<http://foo.bar.baz>

### [Example 603](https://higuma.github.io/github-flabored-markdown/#example-603)

<http://foo.bar.baz/test?q=hello&id=22&boolean>

### [Example 604](https://higuma.github.io/github-flabored-markdown/#example-604)

<irc://foo.bar:2233/baz>

### [Example 605](https://higuma.github.io/github-flabored-markdown/#example-605)

<MAILTO:FOO@BAR.BAZ>

### [Example 606](https://higuma.github.io/github-flabored-markdown/#example-606)

<a+b+c:d>

### [Example 607](https://higuma.github.io/github-flabored-markdown/#example-607)

<made-up-scheme://foo,bar>

### [Example 608](https://higuma.github.io/github-flabored-markdown/#example-608)

<http://../>

### [Example 609](https://higuma.github.io/github-flabored-markdown/#example-609)

<localhost:5001/foo>

### [Example 610](https://higuma.github.io/github-flabored-markdown/#example-610)

<http://foo.bar/baz bim>

### [Example 611](https://higuma.github.io/github-flabored-markdown/#example-611)

<http://example.com/\[\>

### [Example 612](https://higuma.github.io/github-flabored-markdown/#example-612)

<foo@bar.example.com>

### [Example 613](https://higuma.github.io/github-flabored-markdown/#example-613)

<foo+special@Bar.baz-bar0.com>

### [Example 614](https://higuma.github.io/github-flabored-markdown/#example-614)

<foo\+@bar.example.com>

### [Example 615](https://higuma.github.io/github-flabored-markdown/#example-615)

<>

### [Example 616](https://higuma.github.io/github-flabored-markdown/#example-616)

< http://foo.bar >

### [Example 617](https://higuma.github.io/github-flabored-markdown/#example-617)

<m:abc>

### [Example 618](https://higuma.github.io/github-flabored-markdown/#example-618)

<foo.bar.baz>

### [Example 619](https://higuma.github.io/github-flabored-markdown/#example-619)

http://example.com

### [Example 620](https://higuma.github.io/github-flabored-markdown/#example-620)

foo@bar.example.com

## [6.9 Autolinks (extension)](https://higuma.github.io/github-flabored-markdown/#autolinks-extension-)

### [Example 621](https://higuma.github.io/github-flabored-markdown/#example-621)

www.commonmark.org

### [Example 622](https://higuma.github.io/github-flabored-markdown/#example-622)

Visit www.commonmark.org/help for more information.

### [Example 623](https://higuma.github.io/github-flabored-markdown/#example-623)

Visit www.commonmark.org.

Visit www.commonmark.org/a.b.

### [Example 624](https://higuma.github.io/github-flabored-markdown/#example-624)

www.google.com/search?q=Markup+(business)

www.google.com/search?q=Markup+(business)))

(www.google.com/search?q=Markup+(business))

(www.google.com/search?q=Markup+(business)

### [Example 625](https://higuma.github.io/github-flabored-markdown/#example-625)

www.google.com/search?q=(business))+ok

### [Example 626](https://higuma.github.io/github-flabored-markdown/#example-626)

www.google.com/search?q=commonmark&hl=en

www.google.com/search?q=commonmark&hl;

### [Example 627](https://higuma.github.io/github-flabored-markdown/#example-627)

www.commonmark.org/he<lp

### [Example 628](https://higuma.github.io/github-flabored-markdown/#example-628)

http://commonmark.org

(Visit https://encrypted.google.com/search?q=Markup+(business))

### [Example 629](https://higuma.github.io/github-flabored-markdown/#example-629)

foo@bar.baz

### [Example 630](https://higuma.github.io/github-flabored-markdown/#example-630)

hello@mail+xyz.example isn't valid, but hello+xyz@mail.example is.

### [Example 631](https://higuma.github.io/github-flabored-markdown/#example-631)

a.b-c_d@a.b

a.b-c_d@a.b.

a.b-c_d@a.b-

a.b-c_d@a.b_

## [6.10 Raw HTML](https://higuma.github.io/github-flabored-markdown/#raw-html)

### [Example 632](https://higuma.github.io/github-flabored-markdown/#example-632)

→ [Example 632](examples/632.md)

### [Example 633](https://higuma.github.io/github-flabored-markdown/#example-633)

→ [Example 633](examples/633.md)

### [Example 634](https://higuma.github.io/github-flabored-markdown/#example-634)

→ [Example 634](examples/634.md)

### [Example 635](https://higuma.github.io/github-flabored-markdown/#example-635)

→ [Example 635](examples/635.md)

### [Example 636](https://higuma.github.io/github-flabored-markdown/#example-636)

→ [Example 636](examples/636.md)

### [Example 637](https://higuma.github.io/github-flabored-markdown/#example-637)

→ [Example 637](examples/637.md)

### [Example 638](https://higuma.github.io/github-flabored-markdown/#example-638)

→ [Example 638](examples/638.md)

### [Example 639](https://higuma.github.io/github-flabored-markdown/#example-639)

→ [Example 639](examples/639.md)

### [Example 640](https://higuma.github.io/github-flabored-markdown/#example-640)

→ [Example 640](examples/640.md)

### [Example 641](https://higuma.github.io/github-flabored-markdown/#example-641)

→ [Example 641](examples/641.md)

### [Example 642](https://higuma.github.io/github-flabored-markdown/#example-642)

→ [Example 642](examples/642.md)

### [Example 643](https://higuma.github.io/github-flabored-markdown/#example-643)

→ [Example 643](examples/643.md)

### [Example 644](https://higuma.github.io/github-flabored-markdown/#example-644)

→ [Example 644](examples/644.md)

### [Example 645](https://higuma.github.io/github-flabored-markdown/#example-645)

→ [Example 645](examples/645.md)

### [Example 646](https://higuma.github.io/github-flabored-markdown/#example-646)

→ [Example 646](examples/646.md)

### [Example 647](https://higuma.github.io/github-flabored-markdown/#example-647)

→ [Example 647](examples/647.md)

### [Example 648](https://higuma.github.io/github-flabored-markdown/#example-648)

→ [Example 648](examples/648.md)

### [Example 649](https://higuma.github.io/github-flabored-markdown/#example-649)

→ [Example 649](examples/649.md)

### [Example 650](https://higuma.github.io/github-flabored-markdown/#example-650)

→ [Example 650](examples/650.md)

### [Example 651](https://higuma.github.io/github-flabored-markdown/#example-651)

→ [Example 651](examples/651.md)

### [Example 652](https://higuma.github.io/github-flabored-markdown/#example-652)

→ [Example 652](examples/652.md)

## [6.11 Disallowed Raw HTML (extension)](https://higuma.github.io/github-flabored-markdown/#disallowed-raw-html-extension-)

### [Example 653](https://higuma.github.io/github-flabored-markdown/#example-653)

→ [Example 653](examples/653.md)

## [6.12 Hard line breaks](https://higuma.github.io/github-flabored-markdown/#hard-line-breaks)

### [Example 654](https://higuma.github.io/github-flabored-markdown/#example-654)

foo  
baz

### [Example 655](https://higuma.github.io/github-flabored-markdown/#example-655)

foo\
baz

### [Example 656](https://higuma.github.io/github-flabored-markdown/#example-656)

foo       
baz

### [Example 657](https://higuma.github.io/github-flabored-markdown/#example-657)

foo  
     bar

### [Example 658](https://higuma.github.io/github-flabored-markdown/#example-658)

foo\
     bar

### [Example 659](https://higuma.github.io/github-flabored-markdown/#example-659)

*foo  
bar*

### [Example 660](https://higuma.github.io/github-flabored-markdown/#example-660)

*foo\
bar*

### [Example 661](https://higuma.github.io/github-flabored-markdown/#example-661)

`code  
span`

### [Example 662](https://higuma.github.io/github-flabored-markdown/#example-662)

`code\
span`

### [Example 663](https://higuma.github.io/github-flabored-markdown/#example-663)

→ [Example 663](examples/663.md)

### [Example 664](https://higuma.github.io/github-flabored-markdown/#example-664)

→ [Example 664](examples/664.md)

### [Example 665](https://higuma.github.io/github-flabored-markdown/#example-665)

foo\

### [Example 666](https://higuma.github.io/github-flabored-markdown/#example-666)

foo  

### [Example 667](https://higuma.github.io/github-flabored-markdown/#example-667)

### foo\

### [Example 668](https://higuma.github.io/github-flabored-markdown/#example-668)

### foo  

## [6.13 Soft line breaks](https://higuma.github.io/github-flabored-markdown/#soft-line-breaks)

### [Example 669](https://higuma.github.io/github-flabored-markdown/#example-669)

foo
baz

### [Example 670](https://higuma.github.io/github-flabored-markdown/#example-670)

foo 
 baz

## [6.14 Textual content](https://higuma.github.io/github-flabored-markdown/#textual-content)

### [Example 671](https://higuma.github.io/github-flabored-markdown/#example-671)

hello $.;'there

### [Example 672](https://higuma.github.io/github-flabored-markdown/#example-672)

Foo χρῆν

### [Example 673](https://higuma.github.io/github-flabored-markdown/#example-673)

Multiple     spaces

------------------------------------------------------------------------

[5 Container blocks](container-blocks.md)
← [Table of Contents](index.md) 	
[Appendix: A parsing strategy](appendix-a-parsing-strategy.md)
