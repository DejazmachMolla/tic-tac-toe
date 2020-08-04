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

  def won

  end

  def drawn

  end
  
end