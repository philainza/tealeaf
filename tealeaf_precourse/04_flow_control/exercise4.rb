
puts "Please enter a number between 0 and 100"
user_num = gets.chomp.to_i


def num_range(user_num)
	if user_num >= 0 && user_num < 50
		puts "Your number is between 0 and 50"
	elsif user_num >= 50 && user_num <= 100
		puts "Your number is between 51 and 100"
	elsif user_num < 0
		puts "Please enter a positive number"
	else
		puts "Your number is over 100"
	end
end

def num_range_case(user_num)
	case
	when user_num < 0
		puts "Please read the directions"
	when user_num <= 50
		puts "Your number is between 0 and 50"
	when user_num <= 100
		puts "Your number is between 51 and 100"
	else 
		puts "Your number is greater than 100"
	
	end
end

num_range(user_num)
num_range_case(user_num)

		