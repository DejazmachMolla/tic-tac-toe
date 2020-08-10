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

  def self.create_winning_game
    game = initialize_game
    game.board[0][0] = 'X'
    game.board[0][1] = 'X'
    game.board[0][2] = 'X'
    game
  end

  def self.create_un_won_game
    game = initialize_game
    game.board[0][0] = 'X'
    game.board[0][1] = 'X'
    game.board[0][2] = 'O'
    game
  end
  
end