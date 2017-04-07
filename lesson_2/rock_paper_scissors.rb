VALID_CHOICES = ['rock', 'paper', 'scissors']

def display_results(player, computer)
  all_results = { 'rock' => { 'scissors' => 'You won!',
                              'paper' => 'Computer won!',
                              'rock' => "It's a tie!" },
                  'paper' => { 'rock' => ' You won!',
                               'scissors' => 'Computer won!',
                               'paper' => "It's a tie!" },
                  'scissors' => { 'paper' => 'You won!',
                                  'rock' => 'Computer won!',
                                  'scissors' => "It's a tie!" } }

  result = all_results.fetch(player)
  prompt(result.fetch(computer))
end

def prompt(message)
  puts("=> #{message}")
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice")
    end
  end

  computer_choice = ['rock', 'paper', 'scissors'].sample
  puts("You chose #{choice}, Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("Do you want to play again?")
  break unless Kernel.gets.chomp.downcase() == 'y'
end
