# Render html-named-character-references.md
#
# Reference: https://html.spec.whatwg.org/multipage/named-characters.html

require 'date'
require 'json'
require 'open-uri'

N_COL = 4
ENTITIES_JSON = 'https://html.spec.whatwg.org/entities.json'
RE_ENDS_WITH_SEMICOLON = /;$/

URI.open ENTITIES_JSON do |f|
  json = JSON[f.read()]
  all_entities = json.keys.filter {|e| RE_ENDS_WITH_SEMICOLON.match e }.sort
  puts '# HTML named character references'
  puts
  puts "(Retrieved: #{Date.today}) (→ [Source](https://gist.github.com/higuma/5f0430d84830aeb514029317faf21f4f))"
  puts
  puts (0...N_COL).inject('|') {|row, _| row + ' Name |' }
  puts (0...N_COL).inject('|') {|row, _| row + ' :-: |' }
  until all_entities.empty?
    entities = all_entities.shift(N_COL)
    puts entities.inject('|') {|row, e| row + sprintf(" `%s`<br>%s |", e, e) }
  end
end

# Result -> https://gist.github.com/higuma/36c7ff658c4b280b1dfbf802bae52356
