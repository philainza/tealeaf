# Procedural Blackjack Game

def calculate_total(cards) 
  # [['H', '3'], ['S', 'Q'], ... ]
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for Aces
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

puts "Welcome to Tealeaf Blackjack!"
puts "Would you like to play a hand? (type 'yes' or 'no')"
play_or_not = gets.chomp

until play_or_not == "no"

  # make deck and shuffle cards
  suits = ['H', 'D', 'S', 'C']
  cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  deck = suits.product(cards)
  deck.shuffle!

  # deal cards
  player_cards = Array.new
  dealer_cards = Array.new 
  player_cards.push(deck.pop)
  dealer_cards.push(deck.pop)
  player_cards.push(deck.pop)
  dealer_cards.push(deck.pop)

  # player's turn
  player_total = calculate_total(player_cards)

  puts "Here are your cards: #{player_cards}."
  puts "Dealer is showing #{dealer_cards[1]}"

  if player_total == 21
    puts "You got blackjack! You Win!"
    puts "Play another game? (type 'yes' or 'no')"
    play_or_not = gets.chomp
    next
  end

  puts "Your total is : #{player_total}. "
  puts "Hit or Stay? (enter any character to hit or 'stay' to stay)"
  player_response = gets.chomp

  until player_response == "stay"
    
    new_card = deck.pop
    player_cards.push(new_card)
    player_total = calculate_total(player_cards)
    puts "Your new card is #{new_card} for a new total of #{player_total}"

    if player_total == 21
      puts "You got 21!"
      break
    elsif player_total > 21
      puts "Sorry, you busted!"
      break
    else
      puts "Hit or Stay? (type 'hit' or 'stay')"
      player_response = gets.chomp
    end


  end

  # dealers turn
  unless player_total > 21

    dealer_total = calculate_total(dealer_cards)

    puts "Dealer gets #{dealer_cards} for a total of #{dealer_total}"

    if dealer_total == 21
      puts "Dealer gets Blackjack. Sorry, you lose."
      puts "Play another game? (type 'yes' or 'no')"
      play_or_not = gets.chomp
      next
    end

    while dealer_total < 17
      new_dealer_card = deck.pop
      dealer_cards.push(new_dealer_card)
      dealer_total = calculate_total(dealer_cards)
      puts "Dealer hits and gets #{new_dealer_card} for a total of #{dealer_total}"
    end

    
    if dealer_total > 21
      puts "Dealer busts. You win!"
    elsif dealer_total > player_total
      puts "Dealer wins"
    elsif dealer_total == player_total
      puts "Push"
    else
      puts "You win!"
    end
  end

  player_cards = 0
  dealer_cards = 0
  player_total = 0
  dealer_total = 0

  puts "Play another game? (type 'yes' or 'no')"
  play_or_not = gets.chomp
end


