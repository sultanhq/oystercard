require "card"

describe "User Stories" do
    let(:station) {double(:station)}

  # In order to use public transport
  # As a customer
  # I want money on my card
  it "card should be able to hold money" do
    card = Oystercard.new
    expect{card.balance}.not_to raise_error
  end

  # In order to keep using public transport
  # As a customer
  # I want to add money to my card
  it "should be able to add money to the card" do
    card = Oystercard.new
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


  # In order to get through the barriers.
  # As a customer
  # I need to touch in and out.
  it "supports touch in and touch out" do
    card = Oystercard.new
    card.top_up(1)
    card.touch_in(station)
    card.touch_out
    expect{card}.to_not raise_error
  end

  #In order to pay for my journey
  #As a customer
  #I need to have the minimum amount (£1) for a single journey.
  it "so that I can touch in, the balance amount must not be below the minimum journey amount of £1" do
    card = Oystercard.new
    expect{card.touch_in(station)}.to raise_error "Cannot touch in: minimum required balance is £1, please top up."
  end

  # In order to pay for my journey
  # As a customer
  # When my journey is complete, I need the correct amount deducted from my card
  it "so that i pay for a journey the minimum amount has to be deducted at touch out" do
    card = Oystercard.new
    card.top_up(2)
    card.touch_in(station)
    card.touch_out
    expect(card.balance).to eq 1
  end

# In order to pay for my journey
# As a customer
# I need to know where I've travelled from
it "i need to know where I've travelled from" do
  card = Oystercard.new
  card.top_up(2)
  p card.balance
  card.touch_in("Barbican")
  expect(card.entry_station).to eq "Barbican"
end

end
