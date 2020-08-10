require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative './factory_bot.rb'
# spec/game_spec.rb
describe Game do
  describe '#won' do
    it 'returns true if the game is won' do
      won_game = FactoryBot.create_game('won')
      expect(won_game.won).to eql(true)
    end

    it 'returns false if the game is not won' do
      un_won_game = FactoryBot.create_game('un_won')
      expect(un_won_game.won).to eql(false)
    end

    it 'returns true if the game is won diagonally' do
      diagonally_won_game = FactoryBot.create_game('diagonally_won')
      expect(diagonally_won_game.won).to eql(true)
    end
  end

  describe '#drawn' do
    it 'returns true if the game is drawn' do
      drawn_game = FactoryBot.create_game('drawn')
      expect(drawn_game.drawn).to eql(true)
    end

    it 'returns false if the game is not drawn' do
      not_drawn_game = FactoryBot.create_game('not_drawn')
      expect(not_drawn_game.drawn).to eql(false)
    end
  end

  describe '#update_board' do
    it 'board will be updated correctly' do
      initial_game = FactoryBot.initialize_game
      expect(initial_game.update_board(5).board[1][1]).to eql('X')
    end
  end

  describe '#create_diagonals' do
    it 'diagonals will be created correctly' do
      initial_game = FactoryBot.initialize_game
      diagonals = [[1, 5, 9], [3, 5, 7]]
      expect(initial_game.create_diagonals).to eql(diagonals)
    end
  end
end
