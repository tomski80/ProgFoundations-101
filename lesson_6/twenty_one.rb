require 'pry'
# card game
VALUES = { '2' => 2, '3' => 3, '4' => 4,
           '5' => 5, '6' => 6, '7' => 7,
           '8' => 8, '9' => 9, '10' => 10,
           'jack' => 10, 'queen' => 10, 'king' => 10,
           'ace' => 'ace' }

def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  deck = []
  suits = ['hearts', 'diamonds', 'clubs', 'spades']
  values = ['2', '3', '4', '5',
            '6', '7', '8', '9',
            '10', 'jack', 'queen',
            'king', 'ace']

  values.each do |value|
    suits.each do |suit|
      deck << [value, suit]
    end
  end
  deck.shuffle
end

def deal_card(deck, hand)
  hand << deck.pop
end

def deal_2_cards_each(player_hand, dealer_hand, deck)
  deal_card(deck, player_hand)
  deal_card(deck, dealer_hand)
  deal_card(deck, player_hand)
  deal_card(deck, dealer_hand)
end

def remove_suits(hand)
  hand.map do |card|
    card[0]
  end
end

def remove_aces(hand)
  hand.reject { |card| card[0] == 'ace' }
end

def count_aces(hand)
  values_in_hand = remove_suits(hand)
  values_in_hand.count('ace')
end

def aces?(hand)
  count_aces(hand) != 0
end

def convert_values_to_num(hand)
  values_in_hand = remove_suits(hand)
  # convert to true numeric values
  values_in_hand.map do |value|
    VALUES[value]
  end
end

def cards_value_in(hand)
  aces_count = count_aces(hand)
  hand = remove_aces(hand)
  num_values_in_hand = convert_values_to_num(hand)
  sum_in_hand = num_values_in_hand.inject(:+) # sum without aces
  # add aces value
  while aces_count > 0
    sum_in_hand += if (sum_in_hand + 11) < 21
                     11
                   else
                     1
                   end
    aces_count -= 1
  end
  sum_in_hand # return hand value
end

def bust?(hand)
  cards_value_in(hand) > 21
end

def display_winner(player_hand, dealer_hand)
  if cards_value_in(player_hand) > cards_value_in(dealer_hand)
    prompt 'You won the game!'
  elsif cards_value_in(player_hand) < cards_value_in(dealer_hand)
    prompt 'Dealer won the game!'
  else
    prompt "It's a Tie!"
  end
end

def display_all_cards(hand)
  hand.each do |card|
    prompt "#{card[0]} of #{card[1]}"
  end
end

def display_first_card(hand)
  prompt "#{hand[0][0]} of #{hand[0][1]}"
end

def display_cards(player_hand, dealer_hand, end_game = false)
  prompt 'DEALER CARDS'
  if end_game
    display_all_cards(dealer_hand)
  else
    display_first_card(dealer_hand)
    prompt('### hidden ###')
  end
  puts
  prompt 'PLAYER CARDS'
  display_all_cards(player_hand)
  puts
end

# main game
loop do
  player_hand = []
  dealer_hand = []

  deck = initialize_deck
  deal_2_cards_each(player_hand, dealer_hand, deck)

  # player turn
  loop do
    display_cards(player_hand, dealer_hand)

    prompt "What do you want to do? Hit or Stay? (h/s)"
    choice = ''
    loop do
      choice = gets.chomp.downcase
      break if %w[h s].include?(choice[0])
      prompt "That is not a valid choice! Please enter 'h' or 's'"
    end

    if choice[0] == 'h'
      deal_card(deck, player_hand)
    else
      break
    end

    break if bust?(player_hand)
  end

  unless bust?(player_hand)
    # dealer turn
    loop do
      if cards_value_in(dealer_hand) >= 17
        break
      else
        deal_card(deck, dealer_hand)
      end

      break if bust?(dealer_hand)
    end
  end

  display_cards(player_hand, dealer_hand, true)
  if bust?(dealer_hand)
    prompt "Dealer bust! You won the game!"
  elsif bust?(player_hand)
    prompt "Bust! Dealer won the game!"
  else
    display_winner(player_hand, dealer_hand)
  end
  prompt 'Player have ' + cards_value_in(player_hand).to_s + ' in hand!'
  prompt 'Dealer have ' + cards_value_in(dealer_hand).to_s + ' in hand!'
  puts
  prompt 'Do you want to play again? (y/n)'
  play_again = gets.chomp.downcase
  break if play_again[0] == 'n'
end
