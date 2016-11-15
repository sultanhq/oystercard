require 'card.rb'

describe Oystercard do

  subject(:card) { Oystercard.new }

  context "top up card" do

  it "should test that oystercard class responds to top up method" do
    expect(card).to respond_to(:top_up).with(1).argument
  end

  it "should test that balance will change due to amount added" do
    expect(card.top_up(10)).to eq 10
  end
end

  context "raise error" do

  it "should raise error if balance is more than 90" do
    maximum_top_up = Oystercard::Maximum_capacity
    subject.top_up(maximum_top_up)
    expect{card.top_up(100)}.to raise_error("Cannot top up: balance capacity of #{maximum_top_up} has been exceeded")
  end
end

end
