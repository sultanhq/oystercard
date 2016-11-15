require "card"

describe "User Stories" do

  # In order to use public transport
  # As a customer
  # I want money on my card
  it "card should be able to hold money" do
    card = Oystercard.new(0)
    expect{card.balance}.not_to raise_error
  end

  it "should be initialized with a default balance of 0" do
    card = Oystercard.new(0)
    expect(card.balance).to eq 0
  end

end
