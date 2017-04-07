VALID_CHOICES = { 'R' => 'Rock', 'P' => 'Paper',
                  'S' => 'Scissors', 'SP' => 'Spock',
                  'L' => 'Lizard' }
WINNING_CONDITIONS = { 'Rock' => ['Scissors', 'Lizard'],
                       'Paper' => ['Rock', 'Spock'],
                       'Spock' => ['Scissors', 'Rock'],
                       'Lizard' => ['Paper', 'Spock'],
                       'Scissors' => ['Paper', 'Lizard'] }

def win?(player1, player2)
  WINNING_CONDITIONS.fetch(player1).include?(player2)
end

def prompt(message)
  puts("=> #{message}")
end

def print_points(plr_score, cmp_score)
  if plr_score == 1
    prompt("You have #{plr_score} point!")
  else
    prompt("You have #{plr_score} points!")
  end
  if cmp_score == 1
    prompt("Computer have #{cmp_score} point!")
  else
    prompt("Computer have #{cmp_score} points!")
  end
end

def print_winner(plr_score, cmp_score)
  if plr_score == 5
    prompt("******************")
    prompt("You won this game!")
    prompt("******************")
  end
  if cmp_score == 5
    prompt("***********************")
    prompt("Computer won this game!")
    prompt("***********************")
  end
end

loop do
  prompt('*****************************************')
  prompt('Rock, Paper, Scissors, Spock, Lizard GAME')
  prompt('      Win 5 times to win the Game        ')
  prompt('*****************************************')
  player_score = 0
  computer_score = 0
  loop do
    choice = ''
    loop do
      text = []
      VALID_CHOICES.each do |k, v|
        text << "(#{k})#{v}"
      end
      prompt("Choose one: #{text.join(', ')}")
      choice = gets.chomp.upcase

      if VALID_CHOICES.key?(choice)
        choice = VALID_CHOICES[choice]
        break
      else
        prompt("That's not a valid choice! Please enter only first letter(s)!")
      end
    end

    computer_choice = VALID_CHOICES.values.sample
    prompt("You chose #{choice}, Computer chose: #{computer_choice}")

    if win?(choice, computer_choice)
      prompt("You won this turn!")
      player_score += 1
    elsif win?(computer_choice, choice)
      prompt("Computer won this turn!")
      computer_score += 1
    else
      prompt("It's a tie in this turn!")
    end

    print_points(player_score, computer_score)
    break if player_score == 5 || computer_score == 5

    prompt("Do you want to play next round? (y/n)")
    break unless gets.chomp.downcase.start_with?('y')
  end
  print_winner(player_score, computer_score)

  prompt("Do you want to play again? (y/n)")
  break unless gets.chomp.downcase.start_with?('y')
end
