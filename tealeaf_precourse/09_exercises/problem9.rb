# part 1

h = { a:1, b:2, c:3, d:4}
puts h.fetch(:b) 

# part 2

h[:e] = 5
puts h

# part 3

h.each do |key, value|
	if value < 3.5
		h.delete(key)
	end
end

puts h
