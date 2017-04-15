VALUES = { '2' => 2, '3' => 3, '4' => 4,
           '5' => 5, '6' => 6, '7' => 7,
           '8' => 8, '9' => 9, '10' => 10,
           'jack' => 10, 'queen' => 10, 'king' => 10,
           'ace' => 0 }
WIN = 21

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
  2.times do
    deal_card(deck, player_hand)
    deal_card(deck, dealer_hand)
  end
end

def remove_suits(hand)
  hand.map do |card|
    card[0]
  end
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
  num_values_in_hand = convert_values_to_num(hand)
  sum_in_hand = num_values_in_hand.inject(:+) # sum without aces
  # add aces value
  while aces_count > 0
    sum_in_hand += if (sum_in_hand + 11) < WIN
                     11
                   else
                     1
                   end
    aces_count -= 1
  end
  sum_in_hand # return hand value
end

def bust?(hand)
  cards_value_in(hand) > WIN
end

def who_won?(player_hand, dealer_hand)
  player_total = cards_value_in(player_hand)
  dealer_total = cards_value_in(dealer_hand)
  if dealer_total > WIN
    :dealer_bust
  elsif player_total > WIN
    :player_bust
  elsif player_total > dealer_total
    :player
  elsif player_total < dealer_total
    :dealer
  else
    :tie!
  end
end

def show_total(player_hand, dealer_hand, show_dealer = false)
  prompt 'Player have ' + cards_value_in(player_hand).to_s + ' in hand!'
  if show_dealer
    prompt 'Dealer have ' + cards_value_in(dealer_hand).to_s + ' in hand!'
  end
end

def display_winner(player_hand, dealer_hand)
  winner = who_won?(player_hand, dealer_hand)
  display_dealer = winner == :player_bust ? false : true
  display_cards(player_hand, dealer_hand, display_dealer)

  case winner
  when :dealer_bust
    prompt "Dealer bust! You won the game!"
  when :player_bust
    prompt "Bust! Dealer won the game!"
  when :player
    prompt 'You won the game!'
  when :dealer
    prompt 'Dealer won the game!'
  else
    prompt "It's a Tie!"
  end

  show_total(player_hand, dealer_hand, display_dealer)
end

def display_all_cards(hand)
  hand.each do |card|
    prompt "#{card[0]} of #{card[1]}"
  end
end

def display_first_card(hand)
  prompt "#{hand[0][0]} of #{hand[0][1]}"
end

def display_cards(player_hand, dealer_hand, show_dealers = false)
  prompt 'DEALER CARDS'
  if show_dealers
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
      prompt "Sorry! Please enter 'h' or 's'"
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

  display_winner(player_hand, dealer_hand)

  puts
  prompt 'Do you want to play again? (y/n)'
  play_again = gets.chomp.downcase
  break if play_again[0] == 'n'
end
