def multiply(num1, num2)
	num1 * num2
end

puts "Please enter a number"
input_num1 = gets.chomp.to_f
puts "Please enter another number"
input_num2 = gets.chomp.to_f

puts "The product is #{multiply(input_num1, input_num2)}"