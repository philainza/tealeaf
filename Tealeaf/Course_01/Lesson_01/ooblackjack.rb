class Deck
  attr_accessor :deck 

  def initialize
    suits = ['H', 'D', 'S', 'C']
    cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

    @deck = suits.product(cards)
    @deck.shuffle!
  end

  def deal_card
    @deck.pop
  end
end

class Player
  attr_reader :hand

  def initialize(name)
    @name = name
    @hand = []
  end

  def hit_or_stay
    puts "(h)it or (s)tay?" 
  end

  def show_first_hand
    puts "Here are your cards: #{@hand} for a total of #{total}."
  end

  def twenty_one?
    total == 21 
  end

  def twenty_one_message
    "You got 21!"
  end

  def bust?
    if total > 21
      puts "Sorry, you busted! Dealer wins."
      exit
    end
  end

  def stay?
    gets.chomp.downcase == 's'
  end

  def total
    calculate_total(@hand)
  end

  def display_total
    puts "Your total is : #{total}."
  end

  def blackjack?
    if total == 21
      puts "You got Blackjack! You Win!"
      exit
    end
  end

  def win_message
    puts "You win!"
  end

  def to_s
    "#{@name} has #{@hand} for a total of #{total}."
  end

  def get_card(deck)
    @hand << deck.deal_card
  end

  def new_card_message
    puts "Your new card is #{@hand.last} for a new total of #{total}."
  end

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
end

class Dealer
  attr_reader :hand

  def initialize
    @name = "Dealer"
    @hand = []
  end

  def total
    calculate_total(@hand)
  end

  def show_first_hand
    puts "Dealer is showing #{@hand[1]}."
  end

  def blackjack?
    if total == 21
      puts "#{@name} is checking..."
      puts @hand
      puts "#{@name} got Blackjack. Sorry, you lose."
      exit
    end
  end

  def bust?
    if total > 21
      puts "#{@name} busts."
      puts "You win!"
      exit
    end
  end

  def hit_message
    puts "#{@name} hits and gets #{@hand.last} for a new total of #{total}."
  end

  def win_message
    puts "#{@name} wins."
  end

  def to_s
    "#{@name} has #{@hand} for a total of #{total}"
  end

  def get_card(deck)
    @hand << deck.deal_card
  end

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
end

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @deck1 = Deck.new
    @dealer = Dealer.new
  end

  def player_turn
    @player1.hit_or_stay

    until @player1.stay?
      @player1.get_card(@deck1)
      @player1.new_card_message
      break if @player1.twenty_one?
      @player1.bust?
      @player1.hit_or_stay
    end
  end

  def dealer_turn
    puts @dealer

    while @dealer.total < 17
      @dealer.get_card(@deck1)
      @dealer.hit_message
    end

    @dealer.bust?
  end

  def push_message
    puts "Push"
  end

  def who_won
    if @player1.total > @dealer.total
      @player1.win_message
      exit
    elsif @player1.total < @dealer.total
      @dealer.win_message
      exit
    else
      push_message
      exit
    end
  end

  def deal_cards
    @player1.get_card(@deck1)
    @dealer.get_card(@deck1)
    @player1.get_card(@deck1)
    @dealer.get_card(@deck1)
  end

  def play
    deal_cards
    @player1.show_first_hand
    @dealer.show_first_hand
    @player1.blackjack?
    @dealer.blackjack?
    player_turn
    dealer_turn
    who_won
  end
end

game1 = Game.new
game1.play











































