puts "Please enter some information. To end the program, enter \"STOP\""
user_input = gets.chomp
while user_input != "STOP" do
	puts "Program is still running."
	user_input = gets.chomp
end

