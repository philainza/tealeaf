hash1 = { california: 'San Diego', arizona: 'Tucson', washington: 'Seattle', oregon: 'Portland'}

hash1.each_key { |state| puts state.capitalize }
hash1.each_value { |city| puts city }
hash1.each { |state, city| puts "#{city}, #{state.capitalize}" }

