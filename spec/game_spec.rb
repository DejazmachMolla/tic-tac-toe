require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require_relative './factory_bot.rb'
#spec/game_spec.rb
describe Game do

  let (:won_game) { FactoryBot.create_winning_game }
  let (:un_won_game) { FactoryBot.create_un_won_game }

  describe "#won" do
    it "returns true because game is won" do
      expect(won_game.won).to eql(true)
    end

    it "returns false because game is not won" do
      expect(un_won_game.won).to eql(false)
    end
  end
end