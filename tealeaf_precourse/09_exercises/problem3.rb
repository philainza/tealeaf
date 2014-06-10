arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array2 = arr.select { |number| number%2 != 0 }
puts array2
