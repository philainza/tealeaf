puts "Please enter a number between 0 and 100"
user_num = gets.chomp.to_i

if user_num >= 0 && user_num < 50
	puts "Your number is between 0 and 50"
elsif user_num >= 50 && user_num <= 100
	puts "Your number is between 50 and 100"
else
	puts "Your number is over 100"
end
		