california_cities = ["San Diego", "Los Angeles", "San Francisco", "Santa Barbara"]

california_cities.each_with_index do | city, index |
	puts "#{index + 1}: #{city}"
end