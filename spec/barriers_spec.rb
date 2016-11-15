require 'barriers'

describe Barriers do

subject(:barriers) { Barriers.new }
let(:card) { Oystercard.new }

  context "Touch in" do
    it "tests card class response to touch in method" do
      expect(barriers).to respond_to(:touch_in).with(1).argument
    end
  end

    it "should test that card can be touched in the barriers" do
      expect(barriers.touch_in(card)).to include card
  end

  context "Touch out" do
    it "Tests card to response to touch out method" do
      expect(barriers).to respond_to(:touch_out).with(1).argument
    end

    it "Test that card can be touched out of the barriers" do
      barriers.instance_variable_set(:@in_journey, [card])
      barriers.touch_in(card)
      expect(subject.touch_out(card)).to eq card
    end
  end

  context "Cards usage" do

    it "should test if card is in use" do
    expect(barriers.in_use?).to eq true
  end

    it "should test if the card is not in use" do
      expect(barriers.not_in_use?).to eq false
    end
end

end
