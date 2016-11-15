require "card"

describe "User Stories" do

  # In order to use public transport
  # As a customer
  # I want money on my card
  it "card should be able to hold money" do
    card = Oystercard.new(0)
    expect{card.balance}.not_to raise_error
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it "should be able to add money to the card" do
    card = Oystercard.new(0)
    card.top_up(5)
    expect(card.balance).to eq 5
  end

  # In order to protect my money
  # As a customer
  # I don't want to put too much money on my card
  it "doesn't allow to exceed the maximum balance value of £90" do
    card = Oystercard.new
    card.top_up(89)
    expect{card.top_up(2)}.to raise_error "Can't exceed maximum balance of £90."
  end
end
