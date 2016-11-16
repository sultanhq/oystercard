require 'oystercard'

describe Card do
  subject(:card) { Card.new(5) }
  let(:station)  { double("station") }

  it 'test the a new card an be created' do
    expect(card).to be_a_kind_of(Card)

  end

  it 'expects a new card to have a starting balance of 0' do
    card2 = Card.new
    expect(card2.balance).to eq Card::STARTING_BALANCE
  end

  it 'expects the be card to be topped up' do
    current_card_balance = card.balance
    expect(card.top_up(5)).to eq (current_card_balance + 5)
  end

  it 'expects the user not to be able to top-up over card limit' do
    message = "You cannot top-up over your limit of #{Card::MAXIMUM_BALANCE}"
    expect{card.top_up(100)}.to raise_error message
  end

  it 'checks if a card is not in use' do
    expect(card.in_journey?).to be false
  end

  it 'expect a card to be "in use" once touched in' do
    card.touch_in(station)
    expect(card.in_journey?).to be true
  end

  it 'expect a card not to be "in use" once touched out' do
    card.touch_in(station)
    card.touch_out
    expect(card.in_journey?).to be false
  end

  it 'expect user to not be able to touch in when balance is less than the minimum fare' do
    card2 = Card.new
    expect{ card2.touch_in(station)}.to raise_error ("Insufficient funds")
  end

  it 'expect a "touch_out" to deduct the minimum fare' do
    expect{card.touch_out}.to change(card, :balance).by -Card::MINIMUM_FARE
  end

  it 'expects card to store entry station upon touching in' do
    expect(card.touch_in(station)).to eq (card.entry_station)
  end
end
