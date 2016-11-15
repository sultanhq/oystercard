require 'oystercard'

describe Card do

    it 'test the a new card an be created' do
    expect(subject).to be_a_kind_of(Card)

  end

    it 'expects a new card to have a starting balance of 5' do
    expect(subject.balance).to eq 5

  end
end
