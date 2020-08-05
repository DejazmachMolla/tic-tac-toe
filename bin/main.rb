#!/usr/bin/env ruby
# rubocop: disable Metrics/PerceivedComplexity
require_relative './game.rb'
require_relative './player.rb'
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

def receive_player_info
  puts 'Player 1: Enter Your Name'
  player_1_name = gets.chomp
  puts 'Player 2: Enter Your Name'
  player_2_name = gets.chomp
  [player_1_name, player_2_name]
end

def display_board(board)
  puts ' _________________________ '
  puts '|__________BOARD__________|'
  puts '|                         |'
  puts "|      #{board[0][0]}     #{board[0][1]}     #{board[0][2]}      |"
  puts '|                         |'
  puts "|      #{board[1][0]}     #{board[1][1]}     #{board[1][2]}      |"
  puts '|                         |'
  puts "|      #{board[2][0]}     #{board[2][1]}     #{board[2][2]}      |"
  puts '|_________________________|'
end

def start(players)
  continue_game = true
  player1 = Player.new(players[0], 'X')
  player2 = Player.new(players[1], 'O')
  while continue_game
    game = Game.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]], player1, player2)
    play(game)
    puts 'Do you want to play again? Enter Y to continue or any other character to quit.'
    continue_game_char = gets.chomp
    continue_game = %w[y Y].include?(continue_game_char)
  end
end

def play(game)
  entry = nil
  is_won = false
  is_drawn = false
  while !is_won && !is_drawn # check game won or drawn before requesting entry
    game = switch_current_player(game) unless entry.nil? # change current player except from the first move

    display_board(game.board) if entry.nil? # show the board when beginning the game

    puts "#{game.current_player.name}'s turn!" # current players's turn
    entry = receive_number(game)
    game = game.update_board(entry)
    display_board(game.board) # show the board each time the board gets updated
    is_won = game.won
    is_drawn = game.drawn
  end

  if is_won
    puts "Congratulations #{game.current_player.name}. You won the game."
  elsif is_drawn
    puts 'Game Drawn!'
  end
end

def receive_number(game)
  not_valid_entry = true
  while not_valid_entry
    entry = gets.chomp.to_i
    if entry < 1 || entry > 9
      puts 'Invalid Move : The number should be between 1 and 9.'
    else
      # row_index = 0 if entry is between 1 and 3, 1 if entry is b/n 4 and 6, 2 otherwise
      row_index = (entry % 3).zero? ? ((entry / 3) - 1).to_i : (entry / 3).to_i
      # if the number is not found in the row, it must have been replaced with an X or O => TAKEN
      if game.board[row_index].none? { |val| val == entry.to_i }
        puts 'Invalid Move : The number is already taken, try another'
      else
        not_valid_entry = false
      end
    end
  end
  entry
end

def switch_current_player(game)
  game.current_player = game.current_player == game.player1 ? game.player2 : game.player1
  game
end
players = receive_player_info
start(players)

# rubocop: enable Metrics/PerceivedComplexity
