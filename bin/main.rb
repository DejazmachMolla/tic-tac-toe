#!/usr/bin/env ruby
# rubocop: disable Metrics/PerceivedComplexity

puts '  ________  ______   ______       ________  ______    ______       ________  ______   ________ '
puts ' /        |/      | /      \     /        |/      \  /      \     /        |/      \ /        |'
puts ' $$$$$$$$/ $$$$$$/ /$$$$$$  |    $$$$$$$$//$$$$$$  |/$$$$$$  |    $$$$$$$$//$$$$$$  |$$$$$$$$/ '
puts '    $$ |     $$ |  $$ |  $$/ ______ $$ |  $$ |__$$ |$$ |  $$/ ______ $$ |  $$ |  $$ |$$ |__    '
puts '    $$ |     $$ |  $$ |     /      |$$ |  $$    $$ |$$ |     /      |$$ |  $$ |  $$ |$$    |   '
puts '    $$ |     $$ |  $$ |   __$$$$$$/ $$ |  $$$$$$$$ |$$ |   __$$$$$$/ $$ |  $$ |  $$ |$$$$$/    '
puts '    $$ |    _$$ |_ $$ \__/  |       $$ |  $$ |  $$ |$$ \__/  |       $$ |  $$ \__$$ |$$ |_____ '
puts '    $$ |   / $$   |$$    $$/        $$ |  $$ |  $$ |$$    $$/        $$ |  $$    $$/ $$       |'
puts '    $$/    $$$$$$/  $$$$$$/         $$/   $$/   $$/  $$$$$$/         $$/    $$$$$$/  $$$$$$$$/ '

puts
puts '==================================NOTE========================================'
puts 'PLEASE TRY REPEATEDLY TO SEE THE WHOLE PICTURE AS THE GAME IS NOT COMPLETE YET'
puts '=============================================================================='
puts
puts 'Player 1: Enter Your Name'
$player_1_name = gets.chomp
puts 'Player 2: Enter Your Name'
$player_2_name = gets.chomp
$board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

def display_board(*args)
  $board[1][1] = 'X' unless args[0].nil?
  puts ' _________________________ '
  puts '|__________BOARD__________|'
  puts '|                         |'
  puts "|      #{$board[0][0]}     #{$board[0][1]}     #{$board[0][2]}      |"
  puts '|                         |'
  puts "|      #{$board[1][0]}     #{$board[1][1]}     #{$board[1][2]}      |"
  puts '|                         |'
  puts "|      #{$board[2][0]}     #{$board[2][1]}     #{$board[2][2]}      |"
  puts '|_________________________|'
end

def reset_board
  $board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
end

def start
  continue_game = true
  while continue_game
    # Create players
    reset_board # Create game with the users and board
    play_game # Pass game to the play game method
    puts 'Do you want to play again? Enter Y to continue or any other character to quit.'
    continue_game_char = gets.chomp
    continue_game = %w[y Y].include?(continue_game_char)
  end
end

def play_game(game) # receive game as argument
  entry = nil
  while !game_won(entry) || !game_drawn(entry) # check game won or drawn from the game class
    switch_current_player(game) if !entry.nil? # switch current player except from the first move
    display_board
    puts
    
    puts "#{$player_1_name}'s turn!" # current players's turn
    entry = receive_number(game) # pass the game to the receive number

  end

  if game_won
    puts "Congratulations #{$player_1_name}. You won the game." #congratulations current player
  elsif game_drawn
    puts 'Game Drawn!'
  end
end

def receive_number
  not_valid_entry = true
  while not_valid_entry
    entry = gets.chomp.to_i
    if entry < 1 || entry > 9
      puts 'Invalid Move : The number should be between 1 and 9.'
    else
      index = (entry % 3).zero? ? ((entry / 3) - 1).to_i : (entry / 3).to_i
      if $board[index].none? { |val| val == entry.to_i }
        puts 'Invalid Move : The number is already taken, try another' # Try this with 5 after first move
      else
        not_valid_entry = false
      end
    end
  end
  entry
end

def switch_current_player(game)
  
end

def game_won
  rand(1..10) > 6
end

def game_drawn
  rand(1..10) > 6
end

start

# rubocop: enable Metrics/PerceivedComplexity
