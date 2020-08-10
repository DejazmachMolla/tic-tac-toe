require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
class FactoryBot
  def self.initialize_game
    players = ['d', 'j']
    player1 = Player.new(players[0], 'X')
    player2 = Player.new(players[1], 'O')
    game = Game.new([[1, 2, 3], [4, 5, 6], [7, 8, 9]], player1, player2)
    game
  end

  def self.create_game(type)
    game = initialize_game
    if (type == 'won')
      game.board[0][0] = 'X'
      game.board[0][1] = 'X'
      game.board[0][2] = 'X'
    elsif (type == 'un_won')
      game.board[0][0] = 'X'
      game.board[0][1] = 'X'
      game.board[0][2] = 'O'
    elsif (type == 'diagonally_won')
      game.board[0][0] = 'X'
      game.board[1][1] = 'X'
      game.board[2][2] = 'X'
    elsif (type == 'drawn')
      game.board = [['X', 'O', 'X'], ['X', 'O', 'X'], ['O', 'X', 'O']]
    elsif (type == 'not_drawn')
      game.board = [[1, 'X', 'X'], ['X', 'O', 'O'], ['O', 'X', 'O']]
    end
    game
  end
end