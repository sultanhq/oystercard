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
end
