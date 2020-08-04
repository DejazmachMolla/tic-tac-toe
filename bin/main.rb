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
puts '==================================NOTE========================================'
puts 'PLEASE TRY REPEATEDLY TO SEE THE WHOLE PICTURE AS THE GAME IS NOT COMPLETE YET'
puts '=============================================================================='
puts

def receive_player_info
  puts 'Player 1: Enter Your Name'
  player_1_name = gets.chomp
  puts 'Player 2: Enter Your Name'
  player_2_name = gets.chomp
  return [player_1_name, player_2_name]
  # $board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
end


def display_board(board)
  #$board[1][1] = 'X' unless args[0].nil?
  #board = game.board
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
  player_1 = Player.new(players[0], 'X')
  player_2 = Player.new(players[1], 'O')
  while continue_game
    game = Game.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]], player_1, player_2)
    play_game(game)
    puts 'Do you want to play again? Enter Y to continue or any other character to quit.'
    continue_game_char = gets.chomp
    continue_game = %w[y Y].include?(continue_game_char)
  end
end

def play_game(game) # receive game as argument
  entry = nil
  is_game_won = false
  is_game_drawn = false
  while !is_game_won || !is_game_drawn # check game won or drawn before requesting entry
    if entry
      game = switch_current_player(game) # change current player except from the first move
    end
    display_board(game.board)
    puts
    
    puts "#{game.current_player.name}'s turn!" # current players's turn
    entry = receive_number(game) # pass the game to the receive number
    is_game_won = game.won(entry)
    is_game_drawn = game.drawn(entry)
  end

  if is_game_won
    puts "Congratulations #{game.current_player.name}. You won the game." #congratulations current player
  elsif is_game_drawn
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
      index = (entry % 3).zero? ? ((entry / 3) - 1).to_i : (entry / 3).to_i
      if game.board[index].none? { |val| val == entry.to_i }
        puts 'Invalid Move : The number is already taken, try another'
      else
        not_valid_entry = false
      end
    end
  end
  entry
end

def switch_current_player(game)
  if game.current_player == game.player_1
    game.current_player = game.player_2
  else
    game.current_player = game.player_1
  end
  return game
end
players = receive_player_info
start(players)

# rubocop: enable Metrics/PerceivedComplexity
