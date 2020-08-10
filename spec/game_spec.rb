require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative './factory_bot.rb'
#spec/game_spec.rb
describe Game do
  describe "#won" do
    context 'when the game is won' do
      it "returns true" do
        won_game = FactoryBot.create_game('won')
        expect(won_game.won).to eql(true)
      end
    end
    context 'when the game is not won' do
      it "returns false" do
        un_won_game = FactoryBot.create_game('un_won')
        expect(un_won_game.won).to eql(false)
      end
    end

    context 'when the game is diagonally won' do
      it "returns true" do
        un_won_game = FactoryBot.create_game('diagonally_won')
        expect(un_won_game.won).to eql(false)
      end
    end

  end
end