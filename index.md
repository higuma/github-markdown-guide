# GitHub Flavored Markdown Spec ([Official](https://github.github.com/gfm/)|[Mirror](https://higuma.github.io/github-flabored-markdown/))

Table of Contents →
[1. Introduction](introduction.md)

------------------------------------------------------------------------

## Table of contents

* [1 Introduction](introduction.md)
* [2 Preliminaries](preliminaries.md)
* [3 Blocks and inlines](blocks-and-inlines.md)
* [4 Leaf blocks](leaf-blocks.md)
* [5 Container blocks](container-blocks.md)
* [6 Inlines](inlines.md)
* [Appendix: A parsing strategy](appendix-a-parsing-strategy.md)

## Full table of contents

* [1 Introduction](introduction.md)
    * [1.1 What is GitHub Flavored Markdown?](introduction.md#what-is-github-flavored-markdown-)
    * [1.2 What is Markdown?](introduction.md#what-is-markdown-)
    * [1.3 Why is a spec needed?](introduction.md#why-is-a-spec-needed-)
    * [1.4 About this document](introduction.md#about-this-document)
* [2 Preliminaries](preliminaries.md)
    * [2.1 Characters and lines](preliminaries.md#characters-and-lines)
    * [2.2 Tabs](preliminaries.md#tabs)
    * [2.3 Insecure characters](preliminaries.md#insecure-characters)
* [3 Blocks and inlines](blocks-and-inlines.md)
    * [3.1 Precedence](blocks-and-inlines.md#precedence)
    * [3.2 Container blocks and leaf blocks](blocks-and-inlines.md#container-blocks-and-leaf-blocks)
* [4 Leaf blocks](leaf-blocks.md)
    * [4.1 Thematic breaks](leaf-blocks.md#thematic-breaks)
    * [4.2 ATX headings](leaf-blocks.md#atx-headings)
    * [4.3 Setext headings](leaf-blocks.md#setext-headings)
    * [4.4 Indented code blocks](leaf-blocks.md#indented-code-blocks)
    * [4.5 Fenced code blocks](leaf-blocks.md#fenced-code-blocks)
    * [4.6 HTML blocks](leaf-blocks.md#html-blocks)
    * [4.7 Link reference definitions](leaf-blocks.md#link-reference-definitions)
    * [4.8 Paragraphs](leaf-blocks.md#paragraphs)
    * [4.9 Blank lines](leaf-blocks.md#blank-lines)
    * [4.10 Tables (extension)](leaf-blocks.md#tables-extension-)
* [5 Container blocks](container-blocks.md)
    * [5.1 Block quotes](container-blocks.md#block-quotes)
    * [5.2 List items](container-blocks.md#list-items)
    * [5.3 Task list items (extension)](container-blocks.md#task-list-items-extension-)
    * [5.4 Lists](container-blocks.md#lists)
* [6 Inlines](inlines.md)
    * [6.1 Backslash escapes](inlines.md#backslash-escapes)
    * [6.2 Entity and numeric character references](inlines.md#entity-and-numeric-character-references)
    * [6.3 Code spans](inlines.md#code-spans)
    * [6.4 Emphasis and strong emphasis](inlines.md#emphasis-and-strong-emphasis)
    * [6.5 Strikethrough (extension)](inlines.md#strikethrough-extension-)
    * [6.6 Links](inlines.md#links)
    * [6.7 Images](inlines.md#images)
    * [6.8 Autolinks](inlines.md#autolinks)
    * [6.9 Autolinks (extension)](inlines.md#autolinks-extension-)
    * [6.10 Raw HTML](inlines.md#raw-html)
    * [6.11 Disallowed Raw HTML (extension)](inlines.md#disallowed-raw-html-extension-)
    * [6.12 Hard line breaks](inlines.md#hard-line-breaks)
    * [6.13 Soft line breaks](inlines.md#soft-line-breaks)
    * [6.14 Textual content](inlines.md#textual-content)
* [Appendix: A parsing strategy](appendix-a-parsing-strategy.md)
    * [Overview](appendix-a-parsing-strategy.md#overview)
    * [Phase 1: block structure](appendix-a-parsing-strategy.md#phase-1-block-structure)
    * [Phase 2: inline structure](appendix-a-parsing-strategy.md#phase-2-inline-structure)

------------------------------------------------------------------------

Table of Contents →
[1. Introduction](introduction.md)
