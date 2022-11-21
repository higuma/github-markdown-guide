# Render html-named-character-references.md
#
# Reference: https://html.spec.whatwg.org/multipage/named-characters.html

require 'date'
require 'json'
require 'open-uri'

SEPARATOR = '-' * 72
NAVIGATION = '[付録 - GitHub Flavored Markdown](github-flavored-markdown.md)
← [目次](index.md) →
[付録 - 区切り文字一覧](punctuation-characters.md)'

N_COL = 3
URL_ENTITIES_JSON = 'https://html.spec.whatwg.org/entities.json'
RE_ENDS_WITH_SEMICOLON = /;$/   # extract entries which end with `;`
                                # (Markdown does not allow entries without ending `;`)

def get_entities_json
  URI.open URL_ENTITIES_JSON do |f|
    JSON[f.read()]
  end
end

def output_markdown(f)
  json = get_entities_json
  characters = json
    .keys
    .filter {|name| RE_ENDS_WITH_SEMICOLON.match name }
    .sort_by {|name| name.upcase }
  f.puts '# 付録 - 名前付き文字参照一覧'
  f.puts
  f.puts NAVIGATION
  f.puts
  f.puts SEPARATOR
  f.puts
  f.puts "<#{URL_ENTITIES_JSON}> より\\\n(末尾に`;`が付かないものはMarkdownでは使えないため除外)"
  f.puts
  f.puts '|' + ' `名前`<br>文字 (コード) |' * N_COL
  f.puts '|' + ' :-: |' * N_COL
  until characters.empty?
    row = characters.shift N_COL
    f.puts '|' +
           row.map {|name|
             " `#{name}`<br>#{name} (#{
               json[name]["codepoints"].map {
                 |code| sprintf "U+%04X", code
               }.join ' '
             }) |"
           }.join('')
  end
  f.puts
  f.puts SEPARATOR
  f.puts
  f.puts NAVIGATION
end

open '../named-character-references.md', 'w' do |f|
  output_markdown f
end
