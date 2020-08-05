# rubocop: disable Metrics/CyclomaticComplexity
class Game
  attr_accessor :board
  attr_reader :player1
  attr_reader :player2
  attr_accessor :current_player

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def won
    game = self
    is_won = false
    diagonals = game.create_diagonals
    arrays = [game.board, game.board.transpose, diagonals]
    # arrays initially will look like the following
    # arrays = [
    #   [                  [                 [
    #     [1, 2, 3],         [1, 4, 7],        [1, 5, 9]
    #     [4, 5, 6],         [2, 5, 8],        [3, 5, 7]
    #     [7, 8, 9]          [3, 6, 9],      ]
    #   ],                 ],
    # ]
    #
    arrays.each do |array|
      array.any? do |arr|
        is_won = true if arr.all? { |elem| elem == game.current_player.sym }
      end
    end

    is_won
  end

  def drawn
    game = self
    is_drawn = true
    diagonals = game.create_diagonals
    arrays = [game.board, game.board.transpose, diagonals]
    arrays.each do |array|
      array.any? do |arr|
        # if two cells are symbols and the third one is numeric
        if (arr.count { |elem| elem == 'X' } == 2 && arr.any? { |elem| elem.is_a?(Numeric) }) ||
           (arr.count { |elem| elem == 'O' } == 2 && arr.any? { |elem| elem.is_a?(Numeric) }) ||
           # if there are more than 1 numeric values in the 3 element array
           (arr.count { |elem| elem.is_a?(Numeric) } > 1)
          is_drawn = false
        end
      end
    end
    is_drawn
  end

  def update_board(entry)
    game = self
    game.board.each_with_index do |_val, index|
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

  def create_diagonals
    game = self
    diagonal1 = [game.board[0][0], game.board[1][1], game.board[2][2]]
    diagonal2 = [game.board[0][2], game.board[1][1], game.board[2][0]]
    diagonals = [diagonal1, diagonal2]
    diagonals
  end
end
# rubocop: enable Metrics/CyclomaticComplexity
