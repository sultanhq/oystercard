require "card"

describe "User Stories" do

  # In order to use public transport
  # As a customer
  # I want money on my card
  it "should have money" do
    card = Card.new
    expect{card.money}.not_to raise_error
  end

end
