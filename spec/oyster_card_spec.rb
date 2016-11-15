require 'oyster_card'

describe Oystercard do
subject(:oyster) { described_class.new }

  it 'should have a balance' do
    expect(oyster.balance).to eq 0
  end


end
