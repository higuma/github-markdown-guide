# Render unicode-whitespace-characters.md

require_relative 'unicode-emoji/unicode'

NAVIGATION = '[付録 - 句読文字一覧](punctuation-characters.md)
← [目次](index.md)'
SEPARATOR = '-' * 72

def resolve_name(info)
  if info.category == 'Cc' && info.unicode_1_name != ''
    info.unicode_1_name
  else
    info.name
  end
end

CONTROL_NAME = Proc.new {
  x00_1F = %w(NUL SOH STX ETX EOT ENQ ACK BEL BS HT LF VT FF CR SO SI DLE DC1 DC2 DC3 DC4 NAK SYN ETB CAN EM SUB ESC FS GS RS US)
  x7F_9F = %w(DEL PAD HOP BPH NBH IND NEL SSA ESA HTS HTJ VTS PLD PLU RI SS2 SS3 DCS PU1 PU2 STS CCH MW SPA EPA SOS SGCI SCI CSI ST OSC PM APC)
  name_map = {}
  for c in 0x00..0x1f
    name_map[c] = x00_1F[c]
  end
  for c in 0x7F..0x9F
    name_map[c] = x7F_9F[c - 0x7F]
  end
  name_map
}.call

def format_char(info)
  if info.category == 'Cc'
    "`#{CONTROL_NAME[info.code]}`<br><br>"
  else
    case info.chr
    when ' '
      "` `<br> <br>"
    when '\\'
      "`\\`<br>\\\\"
    when '`'
      "`` ` ``<br>\`"
    when '|'
      "`\\|`<br>\\|"
    else
      "`#{info.chr}`<br>#{info.chr}"
    end
  end
end

def each_unicode_whitespace_characters
  return self.to_enum(:each_unicode_whitespace_characters) unless block_given?
  for range in Unicode::Data::Map::new.each_range
    if range.last < 0x20
      # collect ASCII punctuation characters
      for code in range
        case code
        when 0x09, 0x0A, 0x0D
          yield code
        end
      end
    else
      # collect for characters which category Zs
      case Unicode::Data::Info.new(range.first).category
      when 'Zs'
        for code in range
          yield code
        end
      end
    end
  end
end

def output_line(f, base, items)
  return if items.empty?
  f.print "| #{sprintf "%03X\\*", base / 16} |"
  for i in 0..15
    code = base + i
    hex = sprintf "%04X", code
    chr = code.chr Encoding::UTF_8
    info = Unicode::Data::Info.new code
    if items[code]
      f.print " <span id=\"#{hex}\" title=\"U+#{hex} #{resolve_name(info)}, #{info.category}\">#{
        format_char info
      }</span> |"
    else
      f.print " <span id=\"#{hex}\" title=\"U+#{hex} (対象外)\">-</span> |"
    end
  end
  f.puts
end

def output_markdown(f)
  f.puts '# 付録 - Unicode空白文字一覧'
  f.puts
  f.puts NAVIGATION
  f.puts
  f.puts SEPARATOR
  f.puts
  f.puts '[斜体]及び[太字]の検出判定に用いられる[Unicode空白文字]の一覧。具体的には次のどちらかの条件に当てはまる文字が該当する。'
  f.puts
  f.puts '- Unicodeカテゴリ`Zs`に該当する文字(スペースなどを含む)'
  f.puts '- タブ(U+0009), キャリッジリターン(U+000D), 改行(U+000A)'
  f.puts
  f.puts '| U+ |' + (0..0x0F).map {|c| sprintf " %X |", c }.join('')
  f.puts '| - |' + ' :-: |' * 16

  base = 0
  items = {}
  for code in each_unicode_whitespace_characters
    if code >= base + 16
      output_line f, base, items
      base = code & 0xFFFFF0
      items = {}
    end
    items[code] = true
  end
  output_line f, base, items

  f.puts
  f.puts "> <#{Unicode::Data::URL}> より生成 (#{Date.today})"
  f.puts
  f.puts SEPARATOR
  f.puts
  f.puts NAVIGATION
  f.puts
  f.puts '[Unicode空白文字]: characters.md#unicode空白文字'
  f.puts '[斜体]: bold-italic-strikethrough.md#斜体'
  f.puts '[太字]: bold-italic-strikethrough.md#太字'
end

# main
open('../unicode-whitespace-characters.md', 'w') do |f|
  output_markdown f
end
