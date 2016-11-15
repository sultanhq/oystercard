require "card"

describe Oystercard do
  subject(:oystercard) { described_class.new(0) }

  it {is_expected.to respond_to :balance}

  it 'should be initialized with a default balance of 0' do
    expect(oystercard.balance).to eq 0
  end
end
