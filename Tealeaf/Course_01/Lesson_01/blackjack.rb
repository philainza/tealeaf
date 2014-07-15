puts "Welcome to Tealeaf Blackjack!"
puts "Would you like to play a hand? (type 'yes' or 'no')"
play_or_not = gets.chomp

until play_or_not == "no"
	player_cards = Array.new
	player_cards.push(rand(1..11))
	player_cards.push(rand(1..11))
	player_total = player_cards.inject { |sum,x| sum + x }

	while player_total > 21
		player_cards = Array.new
		player_cards.push(rand(1..11))
		player_cards.push(rand(1..11))
		player_total = player_cards.inject { |sum,x| sum + x }
	end

	puts "Here are your cards: #{player_cards}"
	puts "Your total is : #{player_total}. Hit or Stay? (enter any character to hit or 'stay' to stay)"
	player_response = gets.chomp

	until player_response == "stay"
		
		new_card = rand(1..11)
		player_cards.push(new_card)
		player_total = player_cards.inject { |sum,x| sum + x }
		puts "Your new card is #{new_card} for a new total of #{player_total}"

		if player_total == 21
			puts "You got blackjack!"
			break
		elsif player_total > 21
			puts "Sorry, you busted!"
			break
		else
			puts "Hit or Stay? (type 'hit' or 'stay')"
			player_response = gets.chomp
		end

	end

	unless player_total == 21 || player_total > 21

		dealer_cards = Array.new
		dealer_cards.push(rand(1..11))
		dealer_cards.push(rand(1..11))
		dealer_total = dealer_cards.inject { |sum,x| sum + x }

		puts "Dealer gets #{dealer_cards} for a total of #{dealer_total}"


		while dealer_total < 17
			new_dealer_card = rand(1..11)
			dealer_cards.push(new_dealer_card)
			dealer_total = dealer_cards.inject { |sum,x| sum + x }
			puts "Dealer hits and gets #{new_dealer_card} for a total of #{dealer_total}"
		end

		if dealer_total == 21
			puts "Dealer gets blackjack. Sorry, you lose!"
		elsif dealer_total > 21
			puts "Dealer busts. You win!"
		elsif dealer_total > player_total
			puts "Dealer wins"
		else
			puts "You win!"
		end
	end


	puts "Play another game? (type 'yes' or 'no')"
	play_or_not = gets.chomp
end






