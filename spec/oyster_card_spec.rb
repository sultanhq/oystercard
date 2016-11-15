require 'oyster_card'

describe Oystercard do
subject(:oyster) { described_class.new }

  it 'should have a balance' do
    expect(oyster.balance).to eq 0
  end

  it 'should add money to the card' do
    oyster.top_up(10)
    expect(oyster.balance).to eq 10
  end

end
