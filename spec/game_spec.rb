require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

#spec/game_spec.rb
describe Game do
  describe "#won" do
    let (:players) { ['d', 'j'] }
    let (:player1) { Player.new(players[0], 'X') }
    let (:player2) { Player.new(players[1], 'O') }
    let (:game1) { Game.new([['X', 'X', 'X'], [4, 5, 6], [7, 8, 9]], player1, player2) }
    let (:game2) { Game.new([['X', 'X', 'O'], [4, 5, 6], [7, 8, 9]], player1, player2) }

    it "returns true because game is won" do
      expect(game1.won).to eql(true)
    end

    it "returns false because game is not won" do
      expect(game2.won).to eql(false)
    end
  end
end