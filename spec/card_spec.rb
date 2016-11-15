require 'card.rb'

describe Oystercard do

  subject(:card) { Oystercard.new }

  context "top up card" do

  it "should test that balance will change due to amount added" do
    expect(card.top_up(10)).to eq 10
  end
end

  context "deduct money from card" do
  it "tests that money is deducted from card" do
    card.top_up(20)
    expect(card.deduct(10)).to eq 10
  end
end

  context "Touch in" do

    it "should test that card is in journey" do
      card.top_up(10)
      card.touch_in
      expect(card).to be_in_journey
  end
end

  context "Touch out" do

    it "Test that card can be touched out" do
      card.top_up(10)
      card.touch_in
      card.touch_out
      expect(card).not_to be_in_journey
    end
  end

  context "raise error" do

    it "should raise error if balance is more than 90" do
      maximum_top_up = Oystercard::Maximum_balance
      subject.top_up(maximum_top_up)
      expect{card.top_up(100)}.to raise_error("Cannot top up: balance capacity of #{maximum_top_up} has been exceeded")
    end

    it "should raise error if balance is below 1 pound" do
      expect{card.touch_in}.to raise_error("Cannot touch in: not enough funds")
    end
  end

end
