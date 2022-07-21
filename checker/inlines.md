# GFM implementation checker - [6 Inlines](https://higuma.github.io/github-flabored-markdown/#inlines)

[5 Container blocks](container-blocks.md)
← [Table of Contents](index.md) →
[Appendix: A parsing strategy](appendix-a-parsing-strategy.md)

------------------------------------------------------------------------

### [Example 307](https://higuma.github.io/github-flabored-markdown/#example-307)

```markdown
`hi`lo`
```

`hi`lo`

## [6.1 Backslash escapes](https://higuma.github.io/github-flabored-markdown/#backslash-escapes)

### [Example 308](https://higuma.github.io/github-flabored-markdown/#example-308)

```markdown
\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~
```

\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\`\{\|\}\~

### [Example 309](https://higuma.github.io/github-flabored-markdown/#example-309)

```markdown
\	\A\a\ \3\φ\«
```

\	\A\a\ \3\φ\«

### [Example 310](https://higuma.github.io/github-flabored-markdown/#example-310)

```markdown
\*not emphasized*
\<br/> not a tag
\[not a link](/foo)
\`not code`
1\. not a list
\* not a list
\# not a heading
\[foo]: /url "not a reference"
\&ouml; not a character entity
```

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

```markdown
\\*emphasis*
```

\\*emphasis*

### [Example 312](https://higuma.github.io/github-flabored-markdown/#example-312)

```markdown
foo\
bar
```

foo\
bar

### [Example 313](https://higuma.github.io/github-flabored-markdown/#example-313)

``````markdown
`` \[\` ``
``````

`` \[\` ``

### [Example 314](https://higuma.github.io/github-flabored-markdown/#example-314)

```markdown
    \[\]
```

    \[\]

### [Example 315](https://higuma.github.io/github-flabored-markdown/#example-315)

```markdown
~~~
\[\]
~~~
```

~~~
\[\]
~~~

### [Example 316](https://higuma.github.io/github-flabored-markdown/#example-316)

```markdown
<http://example.com?find=\*>
```

<http://example.com?find=\*>

### [Example 317](https://higuma.github.io/github-flabored-markdown/#example-317)

```markdown
<a href="/bar\/)">
```

→ [Output](examples/317.md)

### [Example 318](https://higuma.github.io/github-flabored-markdown/#example-318)

```markdown
[foo](/bar\* "ti\*tle")
```

[foo](/bar\* "ti\*tle")

### [Example 319](https://higuma.github.io/github-flabored-markdown/#example-319)

```markdown
[foo]

[foo]: /bar\* "ti\*tle"
```

→ [Output](examples/319.md)

### [Example 320](https://higuma.github.io/github-flabored-markdown/#example-320)

``````markdown
``` foo\+bar
foo
```
``````

``` foo\+bar
foo
```

## [6.2 Entity and numeric character references](https://higuma.github.io/github-flabored-markdown/#entity-and-numeric-character-references)

### [Example 321](https://higuma.github.io/github-flabored-markdown/#example-321)

```markdown
&nbsp; &amp; &copy; &AElig; &Dcaron;
&frac34; &HilbertSpace; &DifferentialD;
&ClockwiseContourIntegral; &ngE;
```

&nbsp; &amp; &copy; &AElig; &Dcaron;
&frac34; &HilbertSpace; &DifferentialD;
&ClockwiseContourIntegral; &ngE;

### [Example 322](https://higuma.github.io/github-flabored-markdown/#example-322)

```markdown
&#35; &#1234; &#992; &#0;
```

&#35; &#1234; &#992; &#0;

### [Example 323](https://higuma.github.io/github-flabored-markdown/#example-323)

```markdown
&#X22; &#XD06; &#xcab;
```

&#X22; &#XD06; &#xcab;

### [Example 324](https://higuma.github.io/github-flabored-markdown/#example-324)

```markdown
&nbsp &x; &#; &#x;
&#87654321;
&#abcdef0;
&ThisIsNotDefined; &hi?;
```

&nbsp &x; &#; &#x;
&#87654321;
&#abcdef0;
&ThisIsNotDefined; &hi?;

### [Example 325](https://higuma.github.io/github-flabored-markdown/#example-325)

```markdown
&copy
```

&copy

### [Example 326](https://higuma.github.io/github-flabored-markdown/#example-326)

```markdown
&MadeUpEntity;
```

&MadeUpEntity;

### [Example 327](https://higuma.github.io/github-flabored-markdown/#example-327)

```markdown
<a href="&ouml;&ouml;.html">
```

→ [Output](examples/327.md)

### [Example 328](https://higuma.github.io/github-flabored-markdown/#example-328)

```markdown
[foo](/f&ouml;&ouml; "f&ouml;&ouml;")
```

[foo](/f&ouml;&ouml; "f&ouml;&ouml;")

### [Example 329](https://higuma.github.io/github-flabored-markdown/#example-329)

```markdown
[foo]

[foo]: /f&ouml;&ouml; "f&ouml;&ouml;"
```

→ [Output](examples/329.md)

### [Example 330](https://higuma.github.io/github-flabored-markdown/#example-330)

``````markdown
``` f&ouml;&ouml;
foo
```
``````

``` f&ouml;&ouml;
foo
```

### [Example 331](https://higuma.github.io/github-flabored-markdown/#example-331)

```markdown
`f&ouml;&ouml;`
```

`f&ouml;&ouml;`

### [Example 332](https://higuma.github.io/github-flabored-markdown/#example-332)

```markdown
    f&ouml;f&ouml;
```

    f&ouml;f&ouml;

### [Example 333](https://higuma.github.io/github-flabored-markdown/#example-333)

```markdown
&#42;foo&#42;
*foo*
```

&#42;foo&#42;
*foo*

### [Example 334](https://higuma.github.io/github-flabored-markdown/#example-334)

```markdown
&#42; foo

* foo
```

&#42; foo

* foo

### [Example 335](https://higuma.github.io/github-flabored-markdown/#example-335)

```markdown
foo&#10;&#10;bar
```

foo&#10;&#10;bar

### [Example 336](https://higuma.github.io/github-flabored-markdown/#example-336)

```markdown
&#9;foo
```

&#9;foo

### [Example 337](https://higuma.github.io/github-flabored-markdown/#example-337)

```markdown
[a](url &quot;tit&quot;)
```

[a](url &quot;tit&quot;)

## [6.3 Code spans](https://higuma.github.io/github-flabored-markdown/#code-spans)

### [Example 338](https://higuma.github.io/github-flabored-markdown/#example-338)

```markdown
`foo`
```

`foo`

### [Example 339](https://higuma.github.io/github-flabored-markdown/#example-339)

```markdown
`` foo ` bar ``
```

`` foo ` bar ``

### [Example 340](https://higuma.github.io/github-flabored-markdown/#example-340)

```markdown
` `` `
```

` `` `

### [Example 341](https://higuma.github.io/github-flabored-markdown/#example-341)

```markdown
`  ``  `
```

`  ``  `

### [Example 342](https://higuma.github.io/github-flabored-markdown/#example-342)

```markdown
` a`
```

` a`

### [Example 343](https://higuma.github.io/github-flabored-markdown/#example-343)

```markdown
` b `
```

` b `

### [Example 344](https://higuma.github.io/github-flabored-markdown/#example-344)

```markdown
` `
`  `
```

` `
`  `

### [Example 345](https://higuma.github.io/github-flabored-markdown/#example-345)

``````markdown
``
foo
bar  
baz
``
``````

``
foo
bar  
baz
``

### [Example 346](https://higuma.github.io/github-flabored-markdown/#example-346)

``````markdown
``
foo 
``
``````

``
foo 
``

### [Example 347](https://higuma.github.io/github-flabored-markdown/#example-347)

```markdown
`foo   bar 
baz`
```

`foo   bar 

### [Example 348](https://higuma.github.io/github-flabored-markdown/#example-348)

```markdown
`foo\`bar`
```

`foo\`bar`

### [Example 349](https://higuma.github.io/github-flabored-markdown/#example-349)

```markdown
``foo`bar``
```

``foo`bar``

### [Example 350](https://higuma.github.io/github-flabored-markdown/#example-350)

```markdown
` foo `` bar `
```

` foo `` bar `

### [Example 351](https://higuma.github.io/github-flabored-markdown/#example-351)

```markdown
*foo`*`
```

*foo`*`

### [Example 352](https://higuma.github.io/github-flabored-markdown/#example-352)

```markdown
[not a `link](/foo`)
```

[not a `link](/foo`)

### [Example 353](https://higuma.github.io/github-flabored-markdown/#example-353)

```markdown
`<a href="`">`
```

`<a href="`">`

### [Example 354](https://higuma.github.io/github-flabored-markdown/#example-354)

```markdown
<a href="`">`
```

→ [Output](examples/354.md)

### [Example 355](https://higuma.github.io/github-flabored-markdown/#example-355)

```markdown
`<http://foo.bar.`baz>`
```

`<http://foo.bar.`baz>`

### [Example 356](https://higuma.github.io/github-flabored-markdown/#example-356)

```markdown
<http://foo.bar.`baz>`
```

<http://foo.bar.`baz>`

### [Example 357](https://higuma.github.io/github-flabored-markdown/#example-357)

``````markdown
```foo``
``````

```foo``

### [Example 358](https://higuma.github.io/github-flabored-markdown/#example-358)

```markdown
`foo
```

`foo

### [Example 359](https://higuma.github.io/github-flabored-markdown/#example-359)

```markdown
`foo``bar``
```

`foo``bar``

## [6.4 Emphasis and strong emphasis](https://higuma.github.io/github-flabored-markdown/#emphasis-and-strong-emphasis)

### [Example 360](https://higuma.github.io/github-flabored-markdown/#example-360)

```markdown
*foo bar*
```

*foo bar*

### [Example 361](https://higuma.github.io/github-flabored-markdown/#example-361)

```markdown
a * foo bar*
```

a * foo bar*

### [Example 362](https://higuma.github.io/github-flabored-markdown/#example-362)

```markdown
a*"foo"*
```

a*"foo"*

### [Example 363](https://higuma.github.io/github-flabored-markdown/#example-363)

```markdown
* a *
```

* a *

### [Example 364](https://higuma.github.io/github-flabored-markdown/#example-364)

```markdown
foo*bar*
```

foo*bar*

### [Example 365](https://higuma.github.io/github-flabored-markdown/#example-365)

```markdown
5*6*78
```

5*6*78

### [Example 366](https://higuma.github.io/github-flabored-markdown/#example-366)

```markdown
_foo bar_
```

_foo bar_

### [Example 367](https://higuma.github.io/github-flabored-markdown/#example-367)

```markdown
_ foo bar_
```

_ foo bar_

### [Example 368](https://higuma.github.io/github-flabored-markdown/#example-368)

```markdown
a_"foo"_
```

a_"foo"_

### [Example 369](https://higuma.github.io/github-flabored-markdown/#example-369)

```markdown
foo_bar_
```

foo_bar_

### [Example 370](https://higuma.github.io/github-flabored-markdown/#example-370)

```markdown
5_6_78
```

5_6_78

### [Example 371](https://higuma.github.io/github-flabored-markdown/#example-371)

```markdown
пристаням_стремятся_
```

пристаням_стремятся_

### [Example 372](https://higuma.github.io/github-flabored-markdown/#example-372)

```markdown
aa_"bb"_cc
```

aa_"bb"_cc

### [Example 373](https://higuma.github.io/github-flabored-markdown/#example-373)

```markdown
foo-_(bar)_
```

foo-_(bar)_

### [Example 374](https://higuma.github.io/github-flabored-markdown/#example-374)

```markdown
_foo*
```

_foo*

### [Example 375](https://higuma.github.io/github-flabored-markdown/#example-375)

```markdown
*foo bar *
```

*foo bar *

### [Example 376](https://higuma.github.io/github-flabored-markdown/#example-376)

```markdown
*foo bar
*
```

*foo bar
*

### [Example 377](https://higuma.github.io/github-flabored-markdown/#example-377)

```markdown
*(*foo)
```

*(*foo)

### [Example 378](https://higuma.github.io/github-flabored-markdown/#example-378)

```markdown
*(*foo*)*
```

*(*foo*)*

### [Example 379](https://higuma.github.io/github-flabored-markdown/#example-379)

```markdown
*foo*bar
```

*foo*bar

### [Example 380](https://higuma.github.io/github-flabored-markdown/#example-380)

```markdown
_foo bar _
```

_foo bar _

### [Example 381](https://higuma.github.io/github-flabored-markdown/#example-381)

```markdown
_(_foo)
```

_(_foo)

### [Example 382](https://higuma.github.io/github-flabored-markdown/#example-382)

```markdown
_(_foo_)_
```

_(_foo_)_

### [Example 383](https://higuma.github.io/github-flabored-markdown/#example-383)

```markdown
_foo_bar
```

_foo_bar

### [Example 384](https://higuma.github.io/github-flabored-markdown/#example-384)

```markdown
_пристаням_стремятся
```

_пристаням_стремятся

### [Example 385](https://higuma.github.io/github-flabored-markdown/#example-385)

```markdown
_foo_bar_baz_
```

_foo_bar_baz_

### [Example 386](https://higuma.github.io/github-flabored-markdown/#example-386)

```markdown
_(bar)_.
```

_(bar)_.

### [Example 387](https://higuma.github.io/github-flabored-markdown/#example-387)

```markdown
**foo bar**
```

**foo bar**

### [Example 388](https://higuma.github.io/github-flabored-markdown/#example-388)

```markdown
** foo bar**
```

** foo bar**

### [Example 389](https://higuma.github.io/github-flabored-markdown/#example-389)

```markdown
a**"foo"**
```

a**"foo"**

### [Example 390](https://higuma.github.io/github-flabored-markdown/#example-390)

```markdown
foo**bar**
```

foo**bar**

### [Example 391](https://higuma.github.io/github-flabored-markdown/#example-391)

```markdown
__foo bar__
```

__foo bar__

### [Example 392](https://higuma.github.io/github-flabored-markdown/#example-392)

```markdown
__ foo bar__
```

__ foo bar__

### [Example 393](https://higuma.github.io/github-flabored-markdown/#example-393)

```markdown
__
foo bar__
```

__
foo bar__

### [Example 394](https://higuma.github.io/github-flabored-markdown/#example-394)

```markdown
a__"foo"__
```

a__"foo"__

### [Example 395](https://higuma.github.io/github-flabored-markdown/#example-395)

```markdown
foo__bar__
```

foo__bar__

### [Example 396](https://higuma.github.io/github-flabored-markdown/#example-396)

```markdown
5__6__78
```

5__6__78

### [Example 397](https://higuma.github.io/github-flabored-markdown/#example-397)

```markdown
пристаням__стремятся__
```

пристаням__стремятся__

### [Example 398](https://higuma.github.io/github-flabored-markdown/#example-398)

```markdown
__foo, __bar__, baz__
```

__foo, __bar__, baz__

### [Example 399](https://higuma.github.io/github-flabored-markdown/#example-399)

```markdown
foo-__(bar)__
```

foo-__(bar)__

### [Example 400](https://higuma.github.io/github-flabored-markdown/#example-400)

```markdown
**foo bar **
```

**foo bar **

### [Example 401](https://higuma.github.io/github-flabored-markdown/#example-401)

```markdown
**(**foo)
```

**(**foo)

### [Example 402](https://higuma.github.io/github-flabored-markdown/#example-402)

```markdown
*(**foo**)*
```

*(**foo**)*

### [Example 403](https://higuma.github.io/github-flabored-markdown/#example-403)

```markdown
**Gomphocarpus (*Gomphocarpus physocarpus*, syn.
*Asclepias physocarpa*)**
```

**Gomphocarpus (*Gomphocarpus physocarpus*, syn.
*Asclepias physocarpa*)**

### [Example 404](https://higuma.github.io/github-flabored-markdown/#example-404)

```markdown
**foo "*bar*" foo**
```

**foo "*bar*" foo**

### [Example 405](https://higuma.github.io/github-flabored-markdown/#example-405)

```markdown
**foo**bar
```

**foo**bar

### [Example 406](https://higuma.github.io/github-flabored-markdown/#example-406)

```markdown
__foo bar __
```

__foo bar __

### [Example 407](https://higuma.github.io/github-flabored-markdown/#example-407)

```markdown
__(__foo)
```

__(__foo)

### [Example 408](https://higuma.github.io/github-flabored-markdown/#example-408)

```markdown
_(__foo__)_
```

_(__foo__)_

### [Example 409](https://higuma.github.io/github-flabored-markdown/#example-409)

```markdown
__foo__bar
```

__foo__bar

### [Example 410](https://higuma.github.io/github-flabored-markdown/#example-410)

```markdown
__пристаням__стремятся
```

__пристаням__стремятся

### [Example 411](https://higuma.github.io/github-flabored-markdown/#example-411)

```markdown
__foo__bar__baz__
```

__foo__bar__baz__

### [Example 412](https://higuma.github.io/github-flabored-markdown/#example-412)

```markdown
__(bar)__.
```

__(bar)__.

### [Example 413](https://higuma.github.io/github-flabored-markdown/#example-413)

```markdown
*foo [bar](/url)*
```

*foo [bar](/url)*

### [Example 414](https://higuma.github.io/github-flabored-markdown/#example-414)

```markdown
*foo
bar*
```

*foo
bar*

### [Example 415](https://higuma.github.io/github-flabored-markdown/#example-415)

```markdown
_foo __bar__ baz_
```

_foo __bar__ baz_

### [Example 416](https://higuma.github.io/github-flabored-markdown/#example-416)

```markdown
_foo _bar_ baz_
```

_foo _bar_ baz_

### [Example 417](https://higuma.github.io/github-flabored-markdown/#example-417)

```markdown
__foo_ bar_
```

__foo_ bar_

### [Example 418](https://higuma.github.io/github-flabored-markdown/#example-418)

```markdown
*foo *bar**
```

*foo *bar**

### [Example 419](https://higuma.github.io/github-flabored-markdown/#example-419)

```markdown
*foo **bar** baz*
```

*foo **bar** baz*

### [Example 420](https://higuma.github.io/github-flabored-markdown/#example-420)

```markdown
*foo**bar**baz*
```

*foo**bar**baz*

### [Example 421](https://higuma.github.io/github-flabored-markdown/#example-421)

```markdown
*foo**bar*
```

*foo**bar*

### [Example 422](https://higuma.github.io/github-flabored-markdown/#example-422)

```markdown
***foo** bar*
```

***foo** bar*

### [Example 423](https://higuma.github.io/github-flabored-markdown/#example-423)

```markdown
*foo **bar***
```

*foo **bar***

### [Example 424](https://higuma.github.io/github-flabored-markdown/#example-424)

```markdown
*foo**bar***
```

*foo**bar***

### [Example 425](https://higuma.github.io/github-flabored-markdown/#example-425)

```markdown
foo***bar***baz
```

foo***bar***baz

### [Example 426](https://higuma.github.io/github-flabored-markdown/#example-426)

```markdown
foo******bar*********baz
```

foo******bar*********baz

### [Example 427](https://higuma.github.io/github-flabored-markdown/#example-427)

```markdown
*foo **bar *baz* bim** bop*
```

*foo **bar *baz* bim** bop*

### [Example 428](https://higuma.github.io/github-flabored-markdown/#example-428)

```markdown
*foo [*bar*](/url)*
```

*foo [*bar*](/url)*

### [Example 429](https://higuma.github.io/github-flabored-markdown/#example-429)

```markdown
** is not an empty emphasis
```

** is not an empty emphasis

### [Example 430](https://higuma.github.io/github-flabored-markdown/#example-430)

```markdown
**** is not an empty strong emphasis
```

**** is not an empty strong emphasis

### [Example 431](https://higuma.github.io/github-flabored-markdown/#example-431)

```markdown
**foo [bar](/url)**
```

**foo [bar](/url)**

### [Example 432](https://higuma.github.io/github-flabored-markdown/#example-432)

```markdown
**foo
bar**
```

**foo

### [Example 433](https://higuma.github.io/github-flabored-markdown/#example-433)

```markdown
__foo _bar_ baz__
```

__foo _bar_ baz__

### [Example 434](https://higuma.github.io/github-flabored-markdown/#example-434)

```markdown
__foo __bar__ baz__
```

__foo __bar__ baz__

### [Example 435](https://higuma.github.io/github-flabored-markdown/#example-435)

```markdown
____foo__ bar__
```

____foo__ bar__

### [Example 436](https://higuma.github.io/github-flabored-markdown/#example-436)

```markdown
**foo **bar****
```

**foo **bar****

### [Example 437](https://higuma.github.io/github-flabored-markdown/#example-437)

```markdown
**foo *bar* baz**
```

**foo *bar* baz**

### [Example 438](https://higuma.github.io/github-flabored-markdown/#example-438)

```markdown
**foo*bar*baz**
```

**foo*bar*baz**

### [Example 439](https://higuma.github.io/github-flabored-markdown/#example-439)

```markdown
***foo* bar**
```

***foo* bar**

### [Example 440](https://higuma.github.io/github-flabored-markdown/#example-440)

```markdown
**foo *bar***
```

**foo *bar***

### [Example 441](https://higuma.github.io/github-flabored-markdown/#example-441)

```markdown
**foo *bar **baz**
bim* bop**
```

**foo *bar **baz**
bim* bop**

### [Example 442](https://higuma.github.io/github-flabored-markdown/#example-442)

```markdown
**foo [*bar*](/url)**
```

**foo [*bar*](/url)**

### [Example 443](https://higuma.github.io/github-flabored-markdown/#example-443)

```markdown
__ is not an empty emphasis
```

__ is not an empty emphasis

### [Example 444](https://higuma.github.io/github-flabored-markdown/#example-444)

```markdown
____ is not an empty strong emphasis
```

____ is not an empty strong emphasis

### [Example 445](https://higuma.github.io/github-flabored-markdown/#example-445)

```markdown
foo ***
```

foo ***

### [Example 446](https://higuma.github.io/github-flabored-markdown/#example-446)

```markdown
foo *\**
```

foo *\**

### [Example 447](https://higuma.github.io/github-flabored-markdown/#example-447)

```markdown
foo *_*
```

foo *_*

### [Example 448](https://higuma.github.io/github-flabored-markdown/#example-448)

```markdown
foo *****
```

foo *****

### [Example 449](https://higuma.github.io/github-flabored-markdown/#example-449)

```markdown
foo **\***
```

foo **\***

### [Example 450](https://higuma.github.io/github-flabored-markdown/#example-450)

```markdown
foo **_**
```

foo **_**

### [Example 451](https://higuma.github.io/github-flabored-markdown/#example-451)

```markdown
**foo*
```

**foo*

### [Example 452](https://higuma.github.io/github-flabored-markdown/#example-452)

```markdown
*foo**
```

*foo**

### [Example 453](https://higuma.github.io/github-flabored-markdown/#example-453)

```markdown
***foo**
```

***foo**

### [Example 454](https://higuma.github.io/github-flabored-markdown/#example-454)

```markdown
****foo*
```

****foo*

### [Example 455](https://higuma.github.io/github-flabored-markdown/#example-455)

```markdown
**foo***
```

**foo***

### [Example 456](https://higuma.github.io/github-flabored-markdown/#example-456)

```markdown
*foo****
```

*foo****

### [Example 457](https://higuma.github.io/github-flabored-markdown/#example-457)

```markdown
foo ___
```

foo ___

### [Example 458](https://higuma.github.io/github-flabored-markdown/#example-458)

```markdown
foo _\__
```

foo _\__

### [Example 459](https://higuma.github.io/github-flabored-markdown/#example-459)

```markdown
foo _*_
```

foo _*_

### [Example 460](https://higuma.github.io/github-flabored-markdown/#example-460)

```markdown
foo _____
```

foo _____

### [Example 461](https://higuma.github.io/github-flabored-markdown/#example-461)

```markdown
foo __\___
```

foo __\___

### [Example 462](https://higuma.github.io/github-flabored-markdown/#example-462)

```markdown
foo __*__
```

foo __*__

### [Example 463](https://higuma.github.io/github-flabored-markdown/#example-463)

```markdown
__foo_
```

__foo_

### [Example 464](https://higuma.github.io/github-flabored-markdown/#example-464)

```markdown
_foo__
```

_foo__

### [Example 465](https://higuma.github.io/github-flabored-markdown/#example-465)

```markdown
___foo__
```

___foo__

### [Example 466](https://higuma.github.io/github-flabored-markdown/#example-466)

```markdown
____foo_
```

____foo_

### [Example 467](https://higuma.github.io/github-flabored-markdown/#example-467)

```markdown
__foo___
```

__foo___

### [Example 468](https://higuma.github.io/github-flabored-markdown/#example-468)

```markdown
_foo____
```

_foo____

### [Example 469](https://higuma.github.io/github-flabored-markdown/#example-469)

```markdown
**foo**
```

**foo**

### [Example 470](https://higuma.github.io/github-flabored-markdown/#example-470)

```markdown
*_foo_*
```

*_foo_*

### [Example 471](https://higuma.github.io/github-flabored-markdown/#example-471)

```markdown
__foo__
```

__foo__

### [Example 472](https://higuma.github.io/github-flabored-markdown/#example-472)

```markdown
_*foo*_
```

_*foo*_

### [Example 473](https://higuma.github.io/github-flabored-markdown/#example-473)

```markdown
****foo****
```

****foo****

### [Example 474](https://higuma.github.io/github-flabored-markdown/#example-474)

```markdown
____foo____
```

____foo____

### [Example 475](https://higuma.github.io/github-flabored-markdown/#example-475)

```markdown
******foo******
```

******foo******

### [Example 476](https://higuma.github.io/github-flabored-markdown/#example-476)

```markdown
***foo***
```

***foo***

### [Example 477](https://higuma.github.io/github-flabored-markdown/#example-477)

```markdown
_____foo_____
```

_____foo_____

### [Example 478](https://higuma.github.io/github-flabored-markdown/#example-478)

```markdown
*foo _bar* baz_
```

*foo _bar* baz_

### [Example 479](https://higuma.github.io/github-flabored-markdown/#example-479)

```markdown
*foo __bar *baz bim__ bam*
```

*foo __bar *baz bim__ bam*

### [Example 480](https://higuma.github.io/github-flabored-markdown/#example-480)

```markdown
**foo **bar baz**
```

**foo **bar baz**

### [Example 481](https://higuma.github.io/github-flabored-markdown/#example-481)

```markdown
*foo *bar baz*
```

*foo *bar baz*

### [Example 482](https://higuma.github.io/github-flabored-markdown/#example-482)

```markdown
*[bar*](/url)
```

*[bar*](/url)

### [Example 483](https://higuma.github.io/github-flabored-markdown/#example-483)

```markdown
_foo [bar_](/url)
```

_foo [bar_](/url)

### [Example 484](https://higuma.github.io/github-flabored-markdown/#example-484)

```markdown
*<img src="foo" title="*"/>
```

*<img src="foo" title="*"/>

### [Example 485](https://higuma.github.io/github-flabored-markdown/#example-485)

```markdown
**<a href="**">
```

**<a href="**">

### [Example 486](https://higuma.github.io/github-flabored-markdown/#example-486)

```markdown
__<a href="__">
```

__<a href="__">

### [Example 487](https://higuma.github.io/github-flabored-markdown/#example-487)

```markdown
*a `*`*
```

*a `*`*

### [Example 488](https://higuma.github.io/github-flabored-markdown/#example-488)

```markdown
_a `_`_
```

_a `_`_

### [Example 489](https://higuma.github.io/github-flabored-markdown/#example-489)

```markdown
**a<http://foo.bar/?q=**>
```

**a<http://foo.bar/?q=**>

### [Example 490](https://higuma.github.io/github-flabored-markdown/#example-490)

```markdown
__a<http://foo.bar/?q=__>
```

__a<http://foo.bar/?q=__>

## [6.5 Strikethrough (extension)](https://higuma.github.io/github-flabored-markdown/#strikethrough-extension-)

### [Example 491](https://higuma.github.io/github-flabored-markdown/#example-491)

```markdown
~~Hi~~ Hello, world!
```

~~Hi~~ Hello, world!

### [Example 492](https://higuma.github.io/github-flabored-markdown/#example-492)

```markdown
This ~~has a

new paragraph~~.
```

This ~~has a

new paragraph~~.

## [6.6 Links](https://higuma.github.io/github-flabored-markdown/#links)

### [Example 493](https://higuma.github.io/github-flabored-markdown/#example-493)

```markdown
[link](/uri "title")
```

[link](/uri "title")

### [Example 494](https://higuma.github.io/github-flabored-markdown/#example-494)

```markdown
[link](/uri)
```

[link](/uri)

### [Example 495](https://higuma.github.io/github-flabored-markdown/#example-495)

```markdown
[link]()
```

[link]()

### [Example 496](https://higuma.github.io/github-flabored-markdown/#example-496)

```markdown
[link](<>)
```

[link](<>)

### [Example 497](https://higuma.github.io/github-flabored-markdown/#example-497)

```markdown
[link](/my uri)
```

[link](/my uri)

### [Example 498](https://higuma.github.io/github-flabored-markdown/#example-498)

```markdown
[link](</my uri>)
```

[link](</my uri>)

### [Example 499](https://higuma.github.io/github-flabored-markdown/#example-499)

```markdown
[link](foo
bar)
```

[link](foo
bar)

### [Example 500](https://higuma.github.io/github-flabored-markdown/#example-500)

```markdown
[link](<foo
bar>)
```

[link](<foo
bar>)

### [Example 501](https://higuma.github.io/github-flabored-markdown/#example-501)

```markdown
[a](<b)c>)
```

[a](<b)c>)

### [Example 502](https://higuma.github.io/github-flabored-markdown/#example-502)

```markdown
[link](<foo\>)
```

[link](<foo\>)

### [Example 503](https://higuma.github.io/github-flabored-markdown/#example-503)

```markdown
[a](<b)c
[a](<b)c>
[a](<b>c)
```

[a](<b)c
[a](<b)c>
[a](<b>c)

### [Example 504](https://higuma.github.io/github-flabored-markdown/#example-504)

```markdown
[link](\(foo\))
```

[link](\(foo\))

### [Example 505](https://higuma.github.io/github-flabored-markdown/#example-505)

```markdown
[link](foo(and(bar)))
```

[link](foo(and(bar)))

### [Example 506](https://higuma.github.io/github-flabored-markdown/#example-506)

```markdown
[link](foo\(and\(bar\))
```

[link](foo\(and\(bar\))

### [Example 507](https://higuma.github.io/github-flabored-markdown/#example-507)

```markdown
[link](<foo(and(bar)>)
```

[link](<foo(and(bar)>)

### [Example 508](https://higuma.github.io/github-flabored-markdown/#example-508)

```markdown
[link](foo\)\:)
```

[link](foo\)\:)

### [Example 509](https://higuma.github.io/github-flabored-markdown/#example-509)

```markdown
[link](#fragment)

[link](http://example.com#fragment)

[link](http://example.com?foo=3#frag)
```

[link](#fragment)

[link](http://example.com#fragment)

[link](http://example.com?foo=3#frag)

### [Example 510](https://higuma.github.io/github-flabored-markdown/#example-510)

```markdown
[link](foo\bar)
```

[link](foo\bar)

### [Example 511](https://higuma.github.io/github-flabored-markdown/#example-511)

```markdown
[link](foo%20b&auml;)
```

[link](foo%20b&auml;)

### [Example 512](https://higuma.github.io/github-flabored-markdown/#example-512)

```markdown
[link]("title")
```

[link]("title")

### [Example 513](https://higuma.github.io/github-flabored-markdown/#example-513)

```markdown
[link](/url "title")
[link](/url 'title')
[link](/url (title))
```

[link](/url "title")
[link](/url 'title')
[link](/url (title))

### [Example 514](https://higuma.github.io/github-flabored-markdown/#example-514)

```markdown
[link](/url "title \"&quot;")
```

[link](/url "title \"&quot;")

### [Example 515](https://higuma.github.io/github-flabored-markdown/#example-515)

```markdown
[link](/url "title")
```

[link](/url "title")

### [Example 516](https://higuma.github.io/github-flabored-markdown/#example-516)

```markdown
[link](/url "title "and" title")
```

[link](/url "title "and" title")

### [Example 517](https://higuma.github.io/github-flabored-markdown/#example-517)

```markdown
[link](/url 'title "and" title')
```

[link](/url 'title "and" title')

### [Example 518](https://higuma.github.io/github-flabored-markdown/#example-518)

```markdown
[link](   /uri
  "title"  )
```

[link](   /uri
  "title"  )

### [Example 519](https://higuma.github.io/github-flabored-markdown/#example-519)

```markdown
[link] (/uri)
```

[link] (/uri)

### [Example 520](https://higuma.github.io/github-flabored-markdown/#example-520)

```markdown
[link [foo [bar]]](/uri)
```

[link [foo [bar]]](/uri)

### [Example 521](https://higuma.github.io/github-flabored-markdown/#example-521)

```markdown
[link] bar](/uri)
```

[link] bar](/uri)

### [Example 522](https://higuma.github.io/github-flabored-markdown/#example-522)

```markdown
[link [bar](/uri)
```

[link [bar](/uri)

### [Example 523](https://higuma.github.io/github-flabored-markdown/#example-523)

```markdown
[link \[bar](/uri)
```

[link \[bar](/uri)

### [Example 524](https://higuma.github.io/github-flabored-markdown/#example-524)

```markdown
[link *foo **bar** `#`*](/uri)
```

[link *foo **bar** `#`*](/uri)

### [Example 525](https://higuma.github.io/github-flabored-markdown/#example-525)

```markdown
[![moon](moon.jpg)](/uri)
```

[![moon](moon.jpg)](/uri)

### [Example 526](https://higuma.github.io/github-flabored-markdown/#example-526)

```markdown
[foo [bar](/uri)](/uri)
```

[foo [bar](/uri)](/uri)

### [Example 527](https://higuma.github.io/github-flabored-markdown/#example-527)

```markdown
[foo *[bar [baz](/uri)](/uri)*](/uri)
```

[foo *[bar [baz](/uri)](/uri)*](/uri)

### [Example 528](https://higuma.github.io/github-flabored-markdown/#example-528)

```markdown
![[[foo](uri1)](uri2)](uri3)
```

![[[foo](uri1)](uri2)](uri3)

### [Example 529](https://higuma.github.io/github-flabored-markdown/#example-529)

```markdown
*[foo*](/uri)
```

*[foo*](/uri)

### [Example 530](https://higuma.github.io/github-flabored-markdown/#example-530)

```markdown
[foo *bar](baz*)
```

[foo *bar](baz*)

### [Example 531](https://higuma.github.io/github-flabored-markdown/#example-531)

```markdown
*foo [bar* baz]
```

*foo [bar* baz]

### [Example 532](https://higuma.github.io/github-flabored-markdown/#example-532)

```markdown
[foo <bar attr="](baz)">
```

[foo <bar attr="](baz)">

### [Example 533](https://higuma.github.io/github-flabored-markdown/#example-533)

```markdown
[foo`](/uri)`
```

[foo`](/uri)`

### [Example 534](https://higuma.github.io/github-flabored-markdown/#example-534)

```markdown
[foo<http://example.com/?search=](uri)>
```

[foo<http://example.com/?search=](uri)>

### [Example 535](https://higuma.github.io/github-flabored-markdown/#example-535)

```markdown
[foo][bar]

[bar]: /url "title"
```

→ [Output](examples/535.md)

### [Example 536](https://higuma.github.io/github-flabored-markdown/#example-536)

```markdown
[link [foo [bar]]][ref]

[ref]: /uri
```

→ [Output](examples/536.md)

### [Example 537](https://higuma.github.io/github-flabored-markdown/#example-537)

```markdown
[link \[bar][ref]

[ref]: /uri
```

→ [Output](examples/537.md)

### [Example 538](https://higuma.github.io/github-flabored-markdown/#example-538)

```markdown
[link *foo **bar** `#`*][ref]

[ref]: /uri
```

→ [Output](examples/538.md)

### [Example 539](https://higuma.github.io/github-flabored-markdown/#example-539)

```markdown
[![moon](moon.jpg)][ref]

[ref]: /uri
```

→ [Output](examples/539.md)

### [Example 540](https://higuma.github.io/github-flabored-markdown/#example-540)

```markdown
[foo [bar](/uri)][ref]

[ref]: /uri
```

→ [Output](examples/540.md)

### [Example 541](https://higuma.github.io/github-flabored-markdown/#example-541)

```markdown
[foo *bar [baz][ref]*][ref]

[ref]: /uri
```

→ [Output](examples/541.md)

### [Example 542](https://higuma.github.io/github-flabored-markdown/#example-542)

```markdown
*[foo*][ref]

[ref]: /uri
```

→ [Output](examples/542.md)

### [Example 543](https://higuma.github.io/github-flabored-markdown/#example-543)

```markdown
[foo *bar][ref]*

[ref]: /uri
```

→ [Output](examples/543.md)

### [Example 544](https://higuma.github.io/github-flabored-markdown/#example-544)

```markdown
[foo <bar attr="][ref]">

[ref]: /uri
```

→ [Output](examples/544.md)

### [Example 545](https://higuma.github.io/github-flabored-markdown/#example-545)

```markdown
[foo`][ref]`

[ref]: /uri
```

→ [Output](examples/545.md)

### [Example 546](https://higuma.github.io/github-flabored-markdown/#example-546)

```markdown
[foo<http://example.com/?search=][ref]>

[ref]: /uri
```

→ [Output](examples/546.md)

### [Example 547](https://higuma.github.io/github-flabored-markdown/#example-547)

```markdown
[foo][BaR]

[bar]: /url "title"
```

→ [Output](examples/547.md)

### [Example 548](https://higuma.github.io/github-flabored-markdown/#example-548)

```markdown
[ẞ]

[SS]: /url
```

→ [Output](examples/548.md)

### [Example 549](https://higuma.github.io/github-flabored-markdown/#example-549)

```markdown
[Foo
  bar]: /url

[Baz][Foo bar]
```

→ [Output](examples/549.md)

### [Example 550](https://higuma.github.io/github-flabored-markdown/#example-550)

```markdown
[foo] [bar]

[bar]: /url "title"
```

→ [Output](examples/550.md)

### [Example 551](https://higuma.github.io/github-flabored-markdown/#example-551)

```markdown
[foo]
[bar]

[bar]: /url "title"
```

→ [Output](examples/551.md)

### [Example 552](https://higuma.github.io/github-flabored-markdown/#example-552)

```markdown
[foo]: /url1

[foo]: /url2

[bar][foo]
```

→ [Output](examples/552.md)

### [Example 553](https://higuma.github.io/github-flabored-markdown/#example-553)

```markdown
[bar][foo\!]

[foo!]: /url
```

→ [Output](examples/553.md)

### [Example 554](https://higuma.github.io/github-flabored-markdown/#example-554)

```markdown
[foo][ref[]

[ref[]: /uri
```

→ [Output](examples/554.md)

### [Example 555](https://higuma.github.io/github-flabored-markdown/#example-555)

```markdown
[foo][ref[bar]]

[ref[bar]]: /uri
```

→ [Output](examples/555.md)

### [Example 556](https://higuma.github.io/github-flabored-markdown/#example-556)

```markdown
[[[foo]]]

[[[foo]]]: /url
```

→ [Output](examples/556.md)

### [Example 557](https://higuma.github.io/github-flabored-markdown/#example-557)

```markdown
[foo][ref\[]

[ref\[]: /uri
```

→ [Output](examples/557.md)

### [Example 558](https://higuma.github.io/github-flabored-markdown/#example-558)

```markdown
[bar\\]: /uri

[bar\\]
```

→ [Output](examples/558.md)

### [Example 559](https://higuma.github.io/github-flabored-markdown/#example-559)

```markdown
[]

[]: /uri
```

→ [Output](examples/559.md)

### [Example 560](https://higuma.github.io/github-flabored-markdown/#example-560)

```markdown
[
 ]

[
 ]: /uri
```

→ [Output](examples/560.md)

### [Example 561](https://higuma.github.io/github-flabored-markdown/#example-561)

```markdown
[foo][]

[foo]: /url "title"
```

→ [Output](examples/561.md)

### [Example 562](https://higuma.github.io/github-flabored-markdown/#example-562)

```markdown
[*foo* bar][]

[*foo* bar]: /url "title"
```

→ [Output](examples/562.md)

### [Example 563](https://higuma.github.io/github-flabored-markdown/#example-563)

```markdown
[Foo][]

[foo]: /url "title"
```

→ [Output](examples/563.md)

### [Example 564](https://higuma.github.io/github-flabored-markdown/#example-564)

```markdown
[foo] 
[]

[foo]: /url "title"
```

→ [Output](examples/564.md)

### [Example 565](https://higuma.github.io/github-flabored-markdown/#example-565)

```markdown
[foo]

[foo]: /url "title"
```

→ [Output](examples/565.md)

### [Example 566](https://higuma.github.io/github-flabored-markdown/#example-566)

```markdown
[*foo* bar]

[*foo* bar]: /url "title"
```

→ [Output](examples/566.md)

### [Example 567](https://higuma.github.io/github-flabored-markdown/#example-567)

```markdown
[[*foo* bar]]

[*foo* bar]: /url "title"
```

→ [Output](examples/567.md)

### [Example 568](https://higuma.github.io/github-flabored-markdown/#example-568)

```markdown
[[bar [foo]

[foo]: /url
```

→ [Output](examples/568.md)

### [Example 569](https://higuma.github.io/github-flabored-markdown/#example-569)

```markdown
[Foo]

[foo]: /url "title"
```

→ [Output](examples/569.md)

### [Example 570](https://higuma.github.io/github-flabored-markdown/#example-570)

```markdown
[foo] bar

[foo]: /url
```

→ [Output](examples/570.md)

### [Example 571](https://higuma.github.io/github-flabored-markdown/#example-571)

```markdown
\[foo]

[foo]: /url "title"
```

→ [Output](examples/571.md)

### [Example 572](https://higuma.github.io/github-flabored-markdown/#example-572)

```markdown
[foo*]: /url

*[foo*]
```

→ [Output](examples/572.md)

### [Example 573](https://higuma.github.io/github-flabored-markdown/#example-573)

```markdown
[foo][bar]

[foo]: /url1
[bar]: /url2
```

→ [Output](examples/573.md)

### [Example 574](https://higuma.github.io/github-flabored-markdown/#example-574)

```markdown
[foo][]

[foo]: /url1
```

→ [Output](examples/574.md)

### [Example 575](https://higuma.github.io/github-flabored-markdown/#example-575)

```markdown
[foo]()

[foo]: /url1
```

→ [Output](examples/575.md)

### [Example 576](https://higuma.github.io/github-flabored-markdown/#example-576)

```markdown
[foo](not a link)

[foo]: /url1
```

→ [Output](examples/576.md)

### [Example 577](https://higuma.github.io/github-flabored-markdown/#example-577)

```markdown
[foo][bar][baz]

[baz]: /url
```

→ [Output](examples/577.md)

### [Example 578](https://higuma.github.io/github-flabored-markdown/#example-578)

```markdown
[foo][bar][baz]

[baz]: /url1
[bar]: /url2
```

→ [Output](examples/578.md)

### [Example 579](https://higuma.github.io/github-flabored-markdown/#example-579)

```markdown
[foo][bar][baz]

[baz]: /url1
[foo]: /url2
```

→ [Output](examples/579.md)

## [6.7 Images](https://higuma.github.io/github-flabored-markdown/#images)

### [Example 580](https://higuma.github.io/github-flabored-markdown/#example-580)

```markdown
![foo](/url "title")
```

![foo](/url "title")

### [Example 581](https://higuma.github.io/github-flabored-markdown/#example-581)

```markdown
![foo *bar*]

[foo *bar*]: train.jpg "train & tracks"
```

→ [Output](examples/581.md)

### [Example 582](https://higuma.github.io/github-flabored-markdown/#example-582)

```markdown
![foo ![bar](/url)](/url2)
```

![foo ![bar](/url)](/url2)

### [Example 583](https://higuma.github.io/github-flabored-markdown/#example-583)

```markdown
![foo [bar](/url)](/url2)
```

![foo [bar](/url)](/url2)

### [Example 584](https://higuma.github.io/github-flabored-markdown/#example-584)

```markdown
![foo *bar*][]

[foo *bar*]: train.jpg "train & tracks"
```

→ [Output](examples/584.md)

### [Example 585](https://higuma.github.io/github-flabored-markdown/#example-585)

```markdown
![foo *bar*][foobar]

[FOOBAR]: train.jpg "train & tracks"
```

→ [Output](examples/585.md)

### [Example 586](https://higuma.github.io/github-flabored-markdown/#example-586)

```markdown
![foo](train.jpg)
```

![foo](train.jpg)

### [Example 587](https://higuma.github.io/github-flabored-markdown/#example-587)

```markdown
My ![foo bar](/path/to/train.jpg  "title"   )
```

My ![foo bar](/path/to/train.jpg  "title"   )

### [Example 588](https://higuma.github.io/github-flabored-markdown/#example-588)

```markdown
![foo](<url>)
```

![foo](<url>)

### [Example 589](https://higuma.github.io/github-flabored-markdown/#example-589)

```markdown
![](/url)
```

![](/url)

### [Example 590](https://higuma.github.io/github-flabored-markdown/#example-590)

```markdown
![foo][bar]

[bar]: /url
```

→ [Output](examples/590.md)

### [Example 591](https://higuma.github.io/github-flabored-markdown/#example-591)

```markdown
![foo][bar]

[BAR]: /url
```

→ [Output](examples/591.md)

### [Example 592](https://higuma.github.io/github-flabored-markdown/#example-592)

```markdown
![foo][]

[foo]: /url "title"
```

→ [Output](examples/592.md)

### [Example 593](https://higuma.github.io/github-flabored-markdown/#example-593)

```markdown
![*foo* bar][]

[*foo* bar]: /url "title"
```

→ [Output](examples/593.md)

### [Example 594](https://higuma.github.io/github-flabored-markdown/#example-594)

```markdown
![Foo][]

[foo]: /url "title"
```

→ [Output](examples/594.md)

### [Example 595](https://higuma.github.io/github-flabored-markdown/#example-595)

```markdown
![foo] 
[]

[foo]: /url "title"
```

→ [Output](examples/595.md)

### [Example 596](https://higuma.github.io/github-flabored-markdown/#example-596)

```markdown
![foo]

[foo]: /url "title"
```

→ [Output](examples/596.md)

### [Example 597](https://higuma.github.io/github-flabored-markdown/#example-597)

```markdown
![*foo* bar]

[*foo* bar]: /url "title"
```

→ [Output](examples/597.md)

### [Example 598](https://higuma.github.io/github-flabored-markdown/#example-598)

```markdown
![[foo]]

[[foo]]: /url "title"
```

→ [Output](examples/598.md)

### [Example 599](https://higuma.github.io/github-flabored-markdown/#example-599)

```markdown
![Foo]

[foo]: /url "title"
```

→ [Output](examples/599.md)

### [Example 600](https://higuma.github.io/github-flabored-markdown/#example-600)

```markdown
!\[foo]

[foo]: /url "title"
```

→ [Output](examples/600.md)

### [Example 601](https://higuma.github.io/github-flabored-markdown/#example-601)

```markdown
\![foo]

[foo]: /url "title"
```

→ [Output](examples/601.md)

## [6.8 Autolinks](https://higuma.github.io/github-flabored-markdown/#autolinks)

### [Example 602](https://higuma.github.io/github-flabored-markdown/#example-602)

```markdown
<http://foo.bar.baz>
```

<http://foo.bar.baz>

### [Example 603](https://higuma.github.io/github-flabored-markdown/#example-603)

```markdown
<http://foo.bar.baz/test?q=hello&id=22&boolean>
```

<http://foo.bar.baz/test?q=hello&id=22&boolean>

### [Example 604](https://higuma.github.io/github-flabored-markdown/#example-604)

```markdown
<irc://foo.bar:2233/baz>
```

<irc://foo.bar:2233/baz>

### [Example 605](https://higuma.github.io/github-flabored-markdown/#example-605)

```markdown
<MAILTO:FOO@BAR.BAZ>
```

<MAILTO:FOO@BAR.BAZ>

### [Example 606](https://higuma.github.io/github-flabored-markdown/#example-606)

```markdown
<a+b+c:d>
```

<a+b+c:d>

### [Example 607](https://higuma.github.io/github-flabored-markdown/#example-607)

```markdown
<made-up-scheme://foo,bar>
```

<made-up-scheme://foo,bar>

### [Example 608](https://higuma.github.io/github-flabored-markdown/#example-608)

```markdown
<http://../>
```

<http://../>

### [Example 609](https://higuma.github.io/github-flabored-markdown/#example-609)

```markdown
<localhost:5001/foo>
```

<localhost:5001/foo>

### [Example 610](https://higuma.github.io/github-flabored-markdown/#example-610)

```markdown
<http://foo.bar/baz bim>
```

<http://foo.bar/baz bim>

### [Example 611](https://higuma.github.io/github-flabored-markdown/#example-611)

```markdown
<http://example.com/\[\>
```

<http://example.com/\[\>

### [Example 612](https://higuma.github.io/github-flabored-markdown/#example-612)

```markdown
<foo@bar.example.com>
```

<foo@bar.example.com>

### [Example 613](https://higuma.github.io/github-flabored-markdown/#example-613)

```markdown
<foo+special@Bar.baz-bar0.com>
```

<foo+special@Bar.baz-bar0.com>

### [Example 614](https://higuma.github.io/github-flabored-markdown/#example-614)

```markdown
<foo\+@bar.example.com>
```

<foo\+@bar.example.com>

### [Example 615](https://higuma.github.io/github-flabored-markdown/#example-615)

```markdown
<>
```

<>

### [Example 616](https://higuma.github.io/github-flabored-markdown/#example-616)

```markdown
< http://foo.bar >
```

< http://foo.bar >

### [Example 617](https://higuma.github.io/github-flabored-markdown/#example-617)

```markdown
<m:abc>
```

<m:abc>

### [Example 618](https://higuma.github.io/github-flabored-markdown/#example-618)

```markdown
<foo.bar.baz>
```

<foo.bar.baz>

### [Example 619](https://higuma.github.io/github-flabored-markdown/#example-619)

```markdown
http://example.com
```

http://example.com

### [Example 620](https://higuma.github.io/github-flabored-markdown/#example-620)

```markdown
foo@bar.example.com
```

foo@bar.example.com

## [6.9 Autolinks (extension)](https://higuma.github.io/github-flabored-markdown/#autolinks-extension-)

### [Example 621](https://higuma.github.io/github-flabored-markdown/#example-621)

```markdown
www.commonmark.org
```

www.commonmark.org

### [Example 622](https://higuma.github.io/github-flabored-markdown/#example-622)

```markdown
Visit www.commonmark.org/help for more information.
```

Visit www.commonmark.org/help for more information.

### [Example 623](https://higuma.github.io/github-flabored-markdown/#example-623)

```markdown
Visit www.commonmark.org.

Visit www.commonmark.org/a.b.
```

Visit www.commonmark.org.

Visit www.commonmark.org/a.b.

### [Example 624](https://higuma.github.io/github-flabored-markdown/#example-624)

```markdown
www.google.com/search?q=Markup+(business)

www.google.com/search?q=Markup+(business)))

(www.google.com/search?q=Markup+(business))

(www.google.com/search?q=Markup+(business)
```

www.google.com/search?q=Markup+(business)

www.google.com/search?q=Markup+(business)))

(www.google.com/search?q=Markup+(business))

(www.google.com/search?q=Markup+(business)

### [Example 625](https://higuma.github.io/github-flabored-markdown/#example-625)

```markdown
www.google.com/search?q=(business))+ok
```

www.google.com/search?q=(business))+ok

### [Example 626](https://higuma.github.io/github-flabored-markdown/#example-626)

```markdown
www.google.com/search?q=commonmark&hl=en

www.google.com/search?q=commonmark&hl;
```

www.google.com/search?q=commonmark&hl=en

www.google.com/search?q=commonmark&hl;

### [Example 627](https://higuma.github.io/github-flabored-markdown/#example-627)

```markdown
www.commonmark.org/he<lp
```

www.commonmark.org/he<lp

### [Example 628](https://higuma.github.io/github-flabored-markdown/#example-628)

```markdown
http://commonmark.org

(Visit https://encrypted.google.com/search?q=Markup+(business))
```

http://commonmark.org

(Visit https://encrypted.google.com/search?q=Markup+(business))

### [Example 629](https://higuma.github.io/github-flabored-markdown/#example-629)

```markdown
foo@bar.baz
```

foo@bar.baz

### [Example 630](https://higuma.github.io/github-flabored-markdown/#example-630)

```markdown
hello@mail+xyz.example isn't valid, but hello+xyz@mail.example is.
```

hello@mail+xyz.example isn't valid, but hello+xyz@mail.example is.

### [Example 631](https://higuma.github.io/github-flabored-markdown/#example-631)

```markdown
a.b-c_d@a.b

a.b-c_d@a.b.

a.b-c_d@a.b-

a.b-c_d@a.b_
```

a.b-c_d@a.b

a.b-c_d@a.b.

a.b-c_d@a.b-

a.b-c_d@a.b_

## [6.10 Raw HTML](https://higuma.github.io/github-flabored-markdown/#raw-html)

### [Example 632](https://higuma.github.io/github-flabored-markdown/#example-632)

```markdown
<a><bab><c2c>
```

→ [Output](examples/632.md)

### [Example 633](https://higuma.github.io/github-flabored-markdown/#example-633)

```markdown
<a/><b2/>
```

→ [Output](examples/633.md)

### [Example 634](https://higuma.github.io/github-flabored-markdown/#example-634)

```markdown
<a  /><b2
data="foo" >
```

→ [Output](examples/634.md)

### [Example 635](https://higuma.github.io/github-flabored-markdown/#example-635)

```markdown
<a foo="bar" bam = 'baz <em>"</em>'
_boolean zoop:33=zoop:33 />
```

→ [Output](examples/635.md)

### [Example 636](https://higuma.github.io/github-flabored-markdown/#example-636)

```markdown
Foo <responsive-image src="foo.jpg" />
```

→ [Output](examples/636.md)

### [Example 637](https://higuma.github.io/github-flabored-markdown/#example-637)

```markdown
<33> <__>
```

→ [Output](examples/637.md)

### [Example 638](https://higuma.github.io/github-flabored-markdown/#example-638)

```markdown
<a h*#ref="hi">
```

→ [Output](examples/638.md)

### [Example 639](https://higuma.github.io/github-flabored-markdown/#example-639)

```markdown
<a href="hi'> <a href=hi'>
```

→ [Output](examples/639.md)

### [Example 640](https://higuma.github.io/github-flabored-markdown/#example-640)

```markdown
< a><
foo><bar/ >
<foo bar=baz
bim!bop />
```

→ [Output](examples/640.md)

### [Example 641](https://higuma.github.io/github-flabored-markdown/#example-641)

```markdown
<a href='bar'title=title>
```

→ [Output](examples/641.md)

### [Example 642](https://higuma.github.io/github-flabored-markdown/#example-642)

```markdown
</a></foo >
```

→ [Output](examples/642.md)

### [Example 643](https://higuma.github.io/github-flabored-markdown/#example-643)

```markdown
</a href="foo">
```

→ [Output](examples/643.md)

### [Example 644](https://higuma.github.io/github-flabored-markdown/#example-644)

```markdown
foo <!-- this is a
comment - with hyphen -->
```

→ [Output](examples/644.md)

### [Example 645](https://higuma.github.io/github-flabored-markdown/#example-645)

```markdown
foo <!-- not a comment -- two hyphens -->
```

→ [Output](examples/645.md)

### [Example 646](https://higuma.github.io/github-flabored-markdown/#example-646)

```markdown
foo <!--> foo -->

foo <!-- foo--->
```

→ [Output](examples/646.md)

### [Example 647](https://higuma.github.io/github-flabored-markdown/#example-647)

```markdown
foo <?php echo $a; ?>
```

→ [Output](examples/647.md)

### [Example 648](https://higuma.github.io/github-flabored-markdown/#example-648)

```markdown
foo <!ELEMENT br EMPTY>
```

→ [Output](examples/648.md)

### [Example 649](https://higuma.github.io/github-flabored-markdown/#example-649)

```markdown
foo <![CDATA[>&<]]>
```

→ [Output](examples/649.md)

### [Example 650](https://higuma.github.io/github-flabored-markdown/#example-650)

```markdown
foo <a href="&ouml;">
```

→ [Output](examples/650.md)

### [Example 651](https://higuma.github.io/github-flabored-markdown/#example-651)

```markdown
foo <a href="\*">
```

→ [Output](examples/651.md)

### [Example 652](https://higuma.github.io/github-flabored-markdown/#example-652)

```markdown
<a href="\"">
```

→ [Output](examples/652.md)

## [6.11 Disallowed Raw HTML (extension)](https://higuma.github.io/github-flabored-markdown/#disallowed-raw-html-extension-)

### [Example 653](https://higuma.github.io/github-flabored-markdown/#example-653)

```markdown
<strong> <title> <style> <em>

<blockquote>
  <xmp> is disallowed.  <XMP> is also disallowed.
</blockquote>
```

→ [Output](examples/653.md)

## [6.12 Hard line breaks](https://higuma.github.io/github-flabored-markdown/#hard-line-breaks)

### [Example 654](https://higuma.github.io/github-flabored-markdown/#example-654)

```markdown
foo  
baz
```

foo  

### [Example 655](https://higuma.github.io/github-flabored-markdown/#example-655)

```markdown
foo\
baz
```

foo\
baz

### [Example 656](https://higuma.github.io/github-flabored-markdown/#example-656)

```markdown
foo       
baz
```

foo       
baz

### [Example 657](https://higuma.github.io/github-flabored-markdown/#example-657)

```markdown
foo  
     bar
```

foo  
     bar

### [Example 658](https://higuma.github.io/github-flabored-markdown/#example-658)

```markdown
foo\
     bar
```

foo\
     bar

### [Example 659](https://higuma.github.io/github-flabored-markdown/#example-659)

```markdown
*foo  
bar*
```


### [Example 660](https://higuma.github.io/github-flabored-markdown/#example-660)

```markdown
*foo\
bar*
```

*foo  
bar*

### [Example 661](https://higuma.github.io/github-flabored-markdown/#example-661)

```markdown
`code  
span`
```

`code  
span`

### [Example 662](https://higuma.github.io/github-flabored-markdown/#example-662)

```markdown
`code\
span`
```

`code\
span`

### [Example 663](https://higuma.github.io/github-flabored-markdown/#example-663)

```markdown
<a href="foo  
bar">
```

→ [Output](examples/663.md)

### [Example 664](https://higuma.github.io/github-flabored-markdown/#example-664)

```markdown
<a href="foo\
bar">
```

→ [Output](examples/664.md)

### [Example 665](https://higuma.github.io/github-flabored-markdown/#example-665)

```markdown
foo\
```

foo\

### [Example 666](https://higuma.github.io/github-flabored-markdown/#example-666)

```markdown
foo  
```

foo  

### [Example 667](https://higuma.github.io/github-flabored-markdown/#example-667)

```markdown
### foo\
```

### foo\

### [Example 668](https://higuma.github.io/github-flabored-markdown/#example-668)

```markdown
### foo  
```

### foo  

## [6.13 Soft line breaks](https://higuma.github.io/github-flabored-markdown/#soft-line-breaks)

### [Example 669](https://higuma.github.io/github-flabored-markdown/#example-669)

```markdown
foo
baz
```

foo
baz

### [Example 670](https://higuma.github.io/github-flabored-markdown/#example-670)

```markdown
foo 
 baz
```

foo 
 baz

## [6.14 Textual content](https://higuma.github.io/github-flabored-markdown/#textual-content)

### [Example 671](https://higuma.github.io/github-flabored-markdown/#example-671)

```markdown
hello $.;'there
```

hello $.;'there

### [Example 672](https://higuma.github.io/github-flabored-markdown/#example-672)

```markdown
Foo χρῆν
```

Foo χρῆν

### [Example 673](https://higuma.github.io/github-flabored-markdown/#example-673)

```markdown
Multiple     spaces
```

Multiple     spaces

------------------------------------------------------------------------

[5 Container blocks](container-blocks.md)
← [Table of Contents](index.md) →
[Appendix: A parsing strategy](appendix-a-parsing-strategy.md)
