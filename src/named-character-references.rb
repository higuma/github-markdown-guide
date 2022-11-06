# Render html-named-character-references.md
#
# Reference: https://html.spec.whatwg.org/multipage/named-characters.html

require 'date'
require 'json'
require 'open-uri'

N_COL = 3
URL_ENTITIES_JSON = 'https://html.spec.whatwg.org/entities.json'
RE_ENDS_WITH_SEMICOLON = /;$/   # 名前の末尾に`;`がないものは除外(Markdownでは無効)

def get_entities_json
  URI.open URL_ENTITIES_JSON do |f|
    JSON[f.read()]
  end
end

def output_separator(f)
  f.puts
  f.puts '-' * 40
  f.puts
end

def output_navigation(f)
  f.puts '[付録 - GitHub Flavored Markdown](github-flavored-markdown.md)'
  f.puts '← [目次](index.md)'
end

def output_markdown(f)
  json = get_entities_json
  characters = json
    .keys
    .filter {|name| RE_ENDS_WITH_SEMICOLON.match name }
    .sort_by {|name| name.upcase }
  f.puts '# 付録 - Markdownで使える名前付き文字参照一覧'
  f.puts
  output_navigation f
  output_separator f
  f.puts "<#{URL_ENTITIES_JSON}>より(末尾に`;`が付かないものはMarkdownでは使えないため除外)"
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
  output_separator f
  output_navigation f
end

open '../named-character-references.md', 'w' do |f|
  output_markdown f
end
