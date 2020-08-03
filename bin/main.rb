#!/usr/bin/env ruby

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
puts 'Player 1: Enter Your Name'
player_1_name = gets.chomp
puts 'Player 2: Enter Your Name'
player_2_name = gets.chomp

def display_board(*args)
  # This board variable doesn't belong here, it belongs to a Game class
  board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  board[1][1] = 'X' unless args[0].nil?
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

display_board
puts "#{player_1_name}'s turn! Pick a number pick 5 please :D"
entry = gets.chomp
display_board(entry)
puts "#{player_2_name}'s turn!"
gets.chomp
