# GitHub Flavored Markdown Spec ([Official](https://github.github.com/gfm/)|[Mirror](https://higuma.github.io/github-flabored-markdown/))

Table of Contents →
[1. Introduction](introduction.md)

------------------------------------------------------------------------

学習ノート + 補足解説

## Table of contents

* [1 Introduction](introduction.md)
* [2 Preliminaries](preliminaries.md)
* [3 Blocks and inlines](blocks-and-inlines.md)
* [4 Leaf blocks](leaf-blocks.md)
* [5 Container blocks](container-blocks.md)
* [6 Inlines](inlines.md)
* [Appendix: A parsing strategy](appendix-a-parsing-strategy.md)
* [GFM implementation checker](checker/index.md)

## Full table of contents

* [1 Introduction](introduction.md)
    * [1.1 What is GitHub Flavored Markdown?](introduction.md/#11-what-is-github-flavored-markdown-)
    * [1.2 What is Markdown?](introduction.md/#12-what-is-markdown-)
    * [1.3 Why is a spec needed?](introduction.md/#13-why-is-a-spec-needed-)
    * [1.4 About this document](introduction.md/#14-about-this-document)
* [2 Preliminaries](preliminaries.md)
    * [2.1 Characters and lines](preliminaries.md/#21-characters-and-lines)
    * [2.2 Tabs](preliminaries.md/#22-tabs)
    * [2.3 Insecure characters](preliminaries.md/#23-insecure-characters)
    * [How to read this tutorial](preliminaries.md/#how-to-read-this-tutorial)
* [3 Blocks and inlines](blocks-and-inlines.md)
    * [3.1 Precedence](blocks-and-inlines.md/#31-precedence)
    * [3.2 Container blocks and leaf blocks](blocks-and-inlines.md/#32-container-blocks-and-leaf-blocks)
* [4 Leaf blocks](leaf-blocks.md)
    * [4.1 Thematic breaks](leaf-blocks.md/#41-thematic-breaks)
    * [4.2 ATX headings](leaf-blocks.md/#42-atx-headings)
    * [4.3 Setext headings](leaf-blocks.md/#43-setext-headings)
    * [4.4 Indented code blocks](leaf-blocks.md/#44-indented-code-blocks)
    * [4.5 Fenced code blocks](leaf-blocks.md/#45-fenced-code-blocks)
    * [4.6 HTML blocks](leaf-blocks.md/#46-html-blocks)
    * [4.7 Link reference definitions](leaf-blocks.md/#47-link-reference-definitions)
    * [4.8 Paragraphs](leaf-blocks.md/#48-paragraphs)
    * [4.9 Blank lines](leaf-blocks.md/#49-blank-lines)
    * [4.10 Tables (extension)](leaf-blocks.md/#410-tables-extension-)
* [5 Container blocks](container-blocks.md)
    * [5.1 Block quotes](container-blocks.md/#51-block-quotes)
    * [5.2 List items](container-blocks.md/#52-list-items)
    * [5.3 Task list items (extension)](container-blocks.md/#53-task-list-items-extension-)
    * [5.4 Lists](container-blocks.md/#54-lists)
* [6 Inlines](inlines.md)
    * [6.1 Backslash escapes](inlines.md/#61-backslash-escapes)
    * [6.2 Entity and numeric character references](inlines.md/#62-entity-and-numeric-character-references)
    * [6.3 Code spans](inlines.md/#63-code-spans)
    * [6.4 Emphasis and strong emphasis](inlines.md/#64-emphasis-and-strong-emphasis)
    * [6.5 Strikethrough (extension)](inlines.md/#65-strikethrough-extension-)
    * [6.6 Links](inlines.md/#66-links)
    * [6.7 Images](inlines.md/#67-images)
    * [6.8 Autolinks](inlines.md/#68-autolinks)
    * [6.9 Autolinks (extension)](inlines.md/#69-autolinks-extension-)
    * [6.10 Raw HTML](inlines.md/#610-raw-html)
    * [6.11 Disallowed Raw HTML (extension)](inlines.md/#611-disallowed-raw-html-extension-)
    * [6.12 Hard line breaks](inlines.md/#612-hard-line-breaks)
    * [6.13 Soft line breaks](inlines.md/#613-soft-line-breaks)
    * [6.14 Textual content](inlines.md/#614-textual-content)
* [Appendix: A parsing strategy](appendix-a-parsing-strategy.md)
    * [Overview](appendix-a-parsing-strategy.md/#overview)
    * [Phase 1: block structure](appendix-a-parsing-strategy.md/#phase-1-block-structure)
    * [Phase 2: inline structure](appendix-a-parsing-strategy.md/#phase-2-inline-structure)
* [GFM implementation checker](checker/index.md)

------------------------------------------------------------------------

Table of Contents →
[1. Introduction](introduction.md)
