require 'oystercard'

describe Card do

    it 'test the a new card an be created' do
    expect(subject).to be_a_kind_of(Card)

  end

    it 'expects a new card to have a starting balance of 5' do
    expect(subject.balance).to eq Card::STARTING_BALANCE

  end

    it 'expects the be card to be topped up' do
      card_starting_balance = subject.balance
      expect(subject.add_money(5)).to eq (card_starting_balance + 5)
    end

    it 'it tests that a card has a limit of 30' do
      expect(subject.limit).to eq 30
    end

end
