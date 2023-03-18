# Render img/*.svg files

# Image size
W = 15
H = 22

# 7-segment display coordinates
X0 =  3
X1 =  5
X2 = 10
X3 = 12
Y0 =  2
Y1 =  4
Y2 =  9
Y3 = 11
Y4 = 13
Y5 = 18
Y6 = 20

SEGMENTS = [
  [[X1, Y0], [X2, Y0]], # a
  [[X3, Y1], [X3, Y2]], # b
  [[X3, Y4], [X3, Y5]], # c
  [[X1, Y6], [X2, Y6]], # d
  [[X0, Y4], [X0, Y5]], # e
  [[X0, Y1], [X0, Y2]], # f
  [[X1, Y3], [X2, Y3]], # g
]

# 7 segment display bit-fields
NUMBERS = [
#  a  b  c  d  e  f  g
  [1, 1, 1, 1, 1, 1, 0],  # 0
  [0, 1, 1, 0, 0, 0, 0],  # 1
  [1, 1, 0, 1, 1, 0, 1],  # 2
  [1, 1, 1, 1, 0, 0, 1],  # 3
  [0, 1, 1, 0, 0, 1, 1],  # 4
  [1, 0, 1, 1, 0, 1, 1],  # 5
  [1, 0, 1, 1, 1, 1, 1],  # 6
  [1, 1, 1, 0, 0, 0, 0],  # 7
  [1, 1, 1, 1, 1, 1, 1],  # 8
  [1, 1, 1, 1, 0, 1, 1],  # 9
]

STROKES = { # [off-color, on-color]
  ''  => ['#DDD', '#555'],  # (default)
  'l' => ['#DDD', '#555'],  # Light
  'd' => ['#555', '#DDD'],  # Dark
}

for suffix in ['', 'l', 'd']
  for n in 0..9
    open "../img/#{n}#{suffix}.svg", "w" do |f|
      f.puts %!<svg version="1.1" width="#{W}" height="#{H}" xmlns="http://www.w3.org/2000/svg">!
      f.puts %!  <rect x="0" y="0" width="#{W}" height="#{H}" fill="#FFF" />! if suffix == ''
      for i in 0..6
        p = SEGMENTS[i][0]
        q = SEGMENTS[i][1]
        s = STROKES[suffix][NUMBERS[n][i]]
        f.puts %!  <line x1="#{p[0]}" y1="#{p[1]}" x2="#{q[0]}" y2="#{q[1]}" stroke="#{s}" stroke-width="2" stroke-linecap="round" />!
      end
      f.puts "</svg>"
    end
  end
end

__END__

7セグメントLEDについては次を参照

https://www.marutsu.co.jp/contents/shop/marutsu/mame/50.html
