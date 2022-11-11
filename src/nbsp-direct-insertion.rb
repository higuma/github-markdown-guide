# No break space example: inserting NBSP character codes directly to strings

NBSP = ?\u00A0

puts "Foo" + NBSP * 5 + "bar"
puts
puts "Foo" + NBSP * 10 + "bar"
