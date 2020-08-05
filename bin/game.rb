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
    game = self
    is_won = false
    puts game.current_player.sym
    arrays = [game.board, game.board.transpose]
    arrays.each do |array|
      array.any? do |arr| 
        if arr.all? {|elem| elem == game.current_player.sym }
          is_won = true
        end
      end
    end

    if ( (game.board[0][0] == game.board[1][1] && game.board[0][0] == game.board[2][2]) ||
      ( game.board[0][2] == game.board[1][1] && game.board[0][2] == game.board[2][0]) )
      is_won = true
    end
  
    is_won
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