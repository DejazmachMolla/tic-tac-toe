class Game
  attr_accessor :board
  attr_accessor :player_1
  attr_accessor :player_2
  attr_accessor :current_player

  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    @current_player = player_1
  end

  
  def won(entry)
    rand(1..10) > 6
  end

  def drawn(entry)
    rand(1..10) > 6
  end

  def update_board(entry)
    game = self
    game.board.each_with_index do |val, index|
      if game.board[index][0] == entry
        game.board[index][0] = game.current_player.sym
      elsif game.board[index][1] == entry
        game.board[index][1] = game.current_player.sym
      elsif game.board[index][2] == entry
        game.board[index][2] = game.current_player.sym
      end
    end
    game
  end
  
end