# GFM implementation checker - [5 Container blocks](https://higuma.github.io/github-flabored-markdown/#container-blocks)

[4 Leaf blocks](leaf-blocks.md)
← [Table of Contents](index.md) →
[6 Inlines](inlines.md)

------------------------------------------------------------------------

## [5.1 Block quotes](https://higuma.github.io/github-flabored-markdown/#block-quotes)

### [Example 206](https://higuma.github.io/github-flabored-markdown/#example-206)

```markdown
> # Foo
> bar
> baz
```

> # Foo
> bar
> baz

### [Example 207](https://higuma.github.io/github-flabored-markdown/#example-207)

```markdown
># Foo
>bar
> baz
```

># Foo
>bar
> baz

### [Example 208](https://higuma.github.io/github-flabored-markdown/#example-208)

```markdown
   > # Foo
   > bar
 > baz
```

   > # Foo
   > bar
 > baz

### [Example 209](https://higuma.github.io/github-flabored-markdown/#example-209)

```markdown
    > # Foo
    > bar
    > baz
```

    > # Foo
    > bar
    > baz

### [Example 210](https://higuma.github.io/github-flabored-markdown/#example-210)

```markdown
> # Foo
> bar
baz
```

> # Foo
> bar
baz

### [Example 211](https://higuma.github.io/github-flabored-markdown/#example-211)

```markdown
> bar
baz
> foo
```

> bar
baz
> foo

### [Example 212](https://higuma.github.io/github-flabored-markdown/#example-212)

```markdown
> foo
---
```

> foo
---

### [Example 213](https://higuma.github.io/github-flabored-markdown/#example-213)

```markdown
> - foo
- bar
```

> - foo
- bar

### [Example 214](https://higuma.github.io/github-flabored-markdown/#example-214)

```markdown
>     foo
    bar
```

>     foo
    bar

### [Example 215](https://higuma.github.io/github-flabored-markdown/#example-215)

``````markdown
> ```
foo
```
``````

→ [Output](examples/215.md)

### [Example 216](https://higuma.github.io/github-flabored-markdown/#example-216)

```markdown
> foo
    - bar
```

> foo
    - bar

### [Example 217](https://higuma.github.io/github-flabored-markdown/#example-217)

```markdown
>
```

>

### [Example 218](https://higuma.github.io/github-flabored-markdown/#example-218)

```markdown
>
>  
> 
```

>
>  
> 

### [Example 219](https://higuma.github.io/github-flabored-markdown/#example-219)

```markdown
>
> foo
>  
```

>
> foo
>  

### [Example 220](https://higuma.github.io/github-flabored-markdown/#example-220)

```markdown
> foo

> bar
```

> foo

> bar

### [Example 221](https://higuma.github.io/github-flabored-markdown/#example-221)

```markdown
> foo
> bar
```

> foo
> bar

### [Example 222](https://higuma.github.io/github-flabored-markdown/#example-222)

```markdown
> foo
>
> bar
```

> foo
>
> bar

### [Example 223](https://higuma.github.io/github-flabored-markdown/#example-223)

```markdown
foo
> bar
```

foo
> bar

### [Example 224](https://higuma.github.io/github-flabored-markdown/#example-224)

```markdown
> aaa
***
> bbb
```

> aaa
***
> bbb

### [Example 225](https://higuma.github.io/github-flabored-markdown/#example-225)

```markdown
> bar
baz
```

> bar
baz

### [Example 226](https://higuma.github.io/github-flabored-markdown/#example-226)

```markdown
> bar

baz
```

> bar

baz

### [Example 227](https://higuma.github.io/github-flabored-markdown/#example-227)

```markdown
> bar
>
baz
```

> bar
>
baz

### [Example 228](https://higuma.github.io/github-flabored-markdown/#example-228)

```markdown
> > > foo
bar
```

> > > foo
bar

### [Example 229](https://higuma.github.io/github-flabored-markdown/#example-229)

```markdown
>>> foo
> bar
>>baz
```

>>> foo
> bar
>>baz

### [Example 230](https://higuma.github.io/github-flabored-markdown/#example-230)

```markdown
>     code

>    not code
```

>     code

>    not code

## [5.2 List items](https://higuma.github.io/github-flabored-markdown/#list-items)

### [Example 231](https://higuma.github.io/github-flabored-markdown/#example-231)

```markdown
A paragraph
with two lines.

    indented code

> A block quote.
```

A paragraph
with two lines.

    indented code

> A block quote.

### [Example 232](https://higuma.github.io/github-flabored-markdown/#example-232)

```markdown
1.  A paragraph
    with two lines.

        indented code

    > A block quote.
```

1.  A paragraph
    with two lines.

        indented code

    > A block quote.

### [Example 233](https://higuma.github.io/github-flabored-markdown/#example-233)

```markdown
- one

 two
```

- one

 two

### [Example 234](https://higuma.github.io/github-flabored-markdown/#example-234)

```markdown
- one

  two
```

- one

  two

### [Example 235](https://higuma.github.io/github-flabored-markdown/#example-235)

```markdown
 -    one

     two
```

 -    one

     two

### [Example 236](https://higuma.github.io/github-flabored-markdown/#example-236)

```markdown
 -    one

      two
```

 -    one

      two

### [Example 237](https://higuma.github.io/github-flabored-markdown/#example-237)

```markdown
   > > 1.  one
>>
>>     two
```

   > > 1.  one
>>
>>     two

### [Example 238](https://higuma.github.io/github-flabored-markdown/#example-238)

```markdown
>>- one
>>
  >  > two
```

>>- one
>>
  >  > two

### [Example 239](https://higuma.github.io/github-flabored-markdown/#example-239)

```markdown
-one

2.two
```

-one

2.two

### [Example 240](https://higuma.github.io/github-flabored-markdown/#example-240)

```markdown
- foo


  bar
```

- foo


  bar

### [Example 241](https://higuma.github.io/github-flabored-markdown/#example-241)

```markdown
1.  foo

    ```
    bar
    ```

    baz

    > bam
```

1.  foo

    ```
    bar
    ```

    baz

    > bam

### [Example 242](https://higuma.github.io/github-flabored-markdown/#example-242)

```markdown
- Foo

      bar


      baz
```

- Foo

      bar


      baz

### [Example 243](https://higuma.github.io/github-flabored-markdown/#example-243)

```markdown
123456789. ok
```

123456789. ok

### [Example 244](https://higuma.github.io/github-flabored-markdown/#example-244)

```markdown
1234567890. not ok
```

1234567890. not ok

### [Example 245](https://higuma.github.io/github-flabored-markdown/#example-245)

```markdown
0. ok
```

0. ok

### [Example 246](https://higuma.github.io/github-flabored-markdown/#example-246)

```markdown
003. ok
```

003. ok

### [Example 247](https://higuma.github.io/github-flabored-markdown/#example-247)

```markdown
-1. not ok
```

-1. not ok

### [Example 248](https://higuma.github.io/github-flabored-markdown/#example-248)

```markdown
- foo

      bar
```

- foo

      bar

### [Example 249](https://higuma.github.io/github-flabored-markdown/#example-249)

```markdown
  10.  foo

           bar
```

  10.  foo

           bar

### [Example 250](https://higuma.github.io/github-flabored-markdown/#example-250)

```markdown
    indented code

paragraph

    more code
```

    indented code

paragraph

    more code

### [Example 251](https://higuma.github.io/github-flabored-markdown/#example-251)

```markdown
1.     indented code

   paragraph

       more code
```

1.     indented code

   paragraph

       more code

### [Example 252](https://higuma.github.io/github-flabored-markdown/#example-252)

```markdown
1.      indented code

   paragraph

       more code
```

1.      indented code

   paragraph

       more code

### [Example 253](https://higuma.github.io/github-flabored-markdown/#example-253)

```markdown
   foo

bar
```

   foo

bar

### [Example 254](https://higuma.github.io/github-flabored-markdown/#example-254)

```markdown
-    foo

  bar
```

-    foo

  bar

### [Example 255](https://higuma.github.io/github-flabored-markdown/#example-255)

```markdown
-  foo

   bar
```

-  foo

   bar

### [Example 256](https://higuma.github.io/github-flabored-markdown/#example-256)

``````markdown
-
  foo
-
  ```
  bar
  ```
-
      baz
``````

-
  foo
-
  ```
  bar
  ```
-
      baz

### [Example 257](https://higuma.github.io/github-flabored-markdown/#example-257)

```markdown
-   
  foo
```

-   
  foo

### [Example 258](https://higuma.github.io/github-flabored-markdown/#example-258)

```markdown
-

  foo
```

-

  foo

### [Example 259](https://higuma.github.io/github-flabored-markdown/#example-259)

```markdown
- foo
-
- bar
```

- foo
-
- bar

### [Example 260](https://higuma.github.io/github-flabored-markdown/#example-260)

```markdown
- foo
-   
- bar
```

- foo
-   
- bar

### [Example 261](https://higuma.github.io/github-flabored-markdown/#example-261)

```markdown
1. foo
2.
3. bar
```

1. foo
2.
3. bar

### [Example 262](https://higuma.github.io/github-flabored-markdown/#example-262)

```markdown
*
```

*

### [Example 263](https://higuma.github.io/github-flabored-markdown/#example-263)

```markdown
foo
*

foo
1.
```

foo
*

foo
1.

### [Example 264](https://higuma.github.io/github-flabored-markdown/#example-264)

```markdown
 1.  A paragraph
     with two lines.

         indented code

     > A block quote.
```

 1.  A paragraph
     with two lines.

         indented code

     > A block quote.

### [Example 265](https://higuma.github.io/github-flabored-markdown/#example-265)

```markdown
  1.  A paragraph
      with two lines.

          indented code

      > A block quote.
```

  1.  A paragraph
      with two lines.

          indented code

      > A block quote.

### [Example 266](https://higuma.github.io/github-flabored-markdown/#example-266)

```markdown
   1.  A paragraph
       with two lines.

           indented code

       > A block quote.
```

   1.  A paragraph
       with two lines.

           indented code

       > A block quote.

### [Example 267](https://higuma.github.io/github-flabored-markdown/#example-267)

```markdown
    1.  A paragraph
        with two lines.

            indented code

        > A block quote.
```

    1.  A paragraph
        with two lines.

            indented code

        > A block quote.

### [Example 268](https://higuma.github.io/github-flabored-markdown/#example-268)

```markdown
  1.  A paragraph
with two lines.

          indented code

      > A block quote.
```

  1.  A paragraph
with two lines.

          indented code

      > A block quote.

### [Example 269](https://higuma.github.io/github-flabored-markdown/#example-269)

```markdown
  1.  A paragraph
    with two lines.
```

  1.  A paragraph
    with two lines.

### [Example 270](https://higuma.github.io/github-flabored-markdown/#example-270)

```markdown
> 1. > Blockquote
continued here.
```

> 1. > Blockquote
continued here.

### [Example 271](https://higuma.github.io/github-flabored-markdown/#example-271)

```markdown
> 1. > Blockquote
> continued here.
```

> 1. > Blockquote
> continued here.

### [Example 272](https://higuma.github.io/github-flabored-markdown/#example-272)

```markdown
- foo
  - bar
    - baz
      - boo
```

- foo
  - bar
    - baz
      - boo

### [Example 273](https://higuma.github.io/github-flabored-markdown/#example-273)

```markdown
- foo
 - bar
  - baz
   - boo
```

- foo
 - bar
  - baz
   - boo

### [Example 274](https://higuma.github.io/github-flabored-markdown/#example-274)

```markdown
10) foo
    - bar
```

10) foo
    - bar

### [Example 275](https://higuma.github.io/github-flabored-markdown/#example-275)

```markdown
10) foo
   - bar
```

10) foo
   - bar

### [Example 276](https://higuma.github.io/github-flabored-markdown/#example-276)

```markdown
- - foo
```

- - foo

### [Example 277](https://higuma.github.io/github-flabored-markdown/#example-277)

```markdown
1. - 2. foo
```

1. - 2. foo

### [Example 278](https://higuma.github.io/github-flabored-markdown/#example-278)

```markdown
- # Foo
- Bar
  ---
  baz
```

- # Foo
- Bar
  ---
  baz

## [5.3 Task list items (extension)](https://higuma.github.io/github-flabored-markdown/#task-list-items-extension-)

### [Example 279](https://higuma.github.io/github-flabored-markdown/#example-279)

```markdown
- [ ] foo
- [x] bar
```

- [ ] foo
- [x] bar

### [Example 280](https://higuma.github.io/github-flabored-markdown/#example-280)

```markdown
- [x] foo
  - [ ] bar
  - [x] baz
- [ ] bim
```

- [x] foo
  - [ ] bar
  - [x] baz
- [ ] bim

## [5.4 Lists](https://higuma.github.io/github-flabored-markdown/#lists)

### [Example 281](https://higuma.github.io/github-flabored-markdown/#example-281)

```markdown
- foo
- bar
+ baz
```

- foo
- bar
+ baz

### [Example 282](https://higuma.github.io/github-flabored-markdown/#example-282)

```markdown
1. foo
2. bar
3) baz
```

1. foo
2. bar
3) baz

### [Example 283](https://higuma.github.io/github-flabored-markdown/#example-283)

```markdown
Foo
- bar
- baz
```

Foo
- bar
- baz

### [Example 284](https://higuma.github.io/github-flabored-markdown/#example-284)

```markdown
The number of windows in my house is
14.  The number of doors is 6.
```

The number of windows in my house is
14.  The number of doors is 6.

### [Example 285](https://higuma.github.io/github-flabored-markdown/#example-285)

```markdown
The number of windows in my house is
1.  The number of doors is 6.
```

The number of windows in my house is
1.  The number of doors is 6.

### [Example 286](https://higuma.github.io/github-flabored-markdown/#example-286)

```markdown
- foo

- bar


- baz
```

- foo

- bar


- baz

### [Example 287](https://higuma.github.io/github-flabored-markdown/#example-287)

```markdown
- foo
  - bar
    - baz


      bim
```

- foo
  - bar
    - baz


      bim

### [Example 288](https://higuma.github.io/github-flabored-markdown/#example-288)

```markdown
- foo
- bar

<!-- -->

- baz
- bim
```

- foo
- bar

<!-- -->

- baz
- bim

### [Example 289](https://higuma.github.io/github-flabored-markdown/#example-289)

```markdown
-   foo

    notcode

-   foo

<!-- -->

    code
```

-   foo

    notcode

-   foo

<!-- -->

    code

### [Example 290](https://higuma.github.io/github-flabored-markdown/#example-290)

```markdown
- a
 - b
  - c
   - d
  - e
 - f
- g
```

- a
 - b
  - c
   - d
  - e
 - f
- g

### [Example 291](https://higuma.github.io/github-flabored-markdown/#example-291)

```markdown
1. a

  2. b

   3. c
```

1. a

  2. b

   3. c

### [Example 292](https://higuma.github.io/github-flabored-markdown/#example-292)

```markdown
- a
 - b
  - c
   - d
    - e
```

- a
 - b
  - c
   - d
    - e

### [Example 293](https://higuma.github.io/github-flabored-markdown/#example-293)

```markdown
1. a

  2. b

    3. c
```

1. a

  2. b

    3. c

### [Example 294](https://higuma.github.io/github-flabored-markdown/#example-294)

```markdown
- a
- b

- c
```

- a
- b

- c

### [Example 295](https://higuma.github.io/github-flabored-markdown/#example-295)

```markdown
* a
*

* c
```

* a
*

* c

### [Example 296](https://higuma.github.io/github-flabored-markdown/#example-296)

```markdown
- a
- b

  c
- d
```

- a
- b

  c
- d

### [Example 297](https://higuma.github.io/github-flabored-markdown/#example-297)

```markdown
- a
- b

  [ref]: /url
- d
```

→ [Output](examples/297.md)

### [Example 298](https://higuma.github.io/github-flabored-markdown/#example-298)

``````markdown
- a
- ```
  b


  ```
- c
``````

- a
- ```
  b


  ```
- c

### [Example 299](https://higuma.github.io/github-flabored-markdown/#example-299)

```markdown
- a
  - b

    c
- d
```

- a
  - b

    c
- d

### [Example 300](https://higuma.github.io/github-flabored-markdown/#example-300)

```markdown
* a
  > b
  >
* c
```

* a
  > b
  >
* c

### [Example 301](https://higuma.github.io/github-flabored-markdown/#example-301)

``````markdown
- a
  > b
  ```
  c
  ```
- d
``````

- a
  > b
  ```
  c
  ```
- d

### [Example 302](https://higuma.github.io/github-flabored-markdown/#example-302)

```markdown
- a
```

- a

### [Example 303](https://higuma.github.io/github-flabored-markdown/#example-303)

```markdown
- a
  - b
```

- a
  - b

### [Example 304](https://higuma.github.io/github-flabored-markdown/#example-304)

``````markdown
1. ```
   foo
   ```

   bar
``````

1. ```
   foo
   ```

   bar

### [Example 305](https://higuma.github.io/github-flabored-markdown/#example-305)

```markdown
* foo
  * bar

  baz
```

* foo
  * bar

  baz

### [Example 306](https://higuma.github.io/github-flabored-markdown/#example-306)

```markdown
- a
  - b
  - c

- d
  - e
  - f
```

- a
  - b
  - c

- d
  - e
  - f

------------------------------------------------------------------------

[4 Leaf blocks](leaf-blocks.md)
← [Table of Contents](index.md) →
[6 Inlines](inlines.md)
