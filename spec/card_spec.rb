require "card"

describe Oystercard do
  subject(:oystercard) { described_class.new(0) }

  it {is_expected.to respond_to :balance}

  it 'should be initialized with a default balance of 0' do
    expect(oystercard.balance).to eq 0
  end

  describe 'when using top_up' do
    it {is_expected.to respond_to :top_up}

    it {is_expected.to respond_to(:top_up).with(1).argument}

    it 'it increases the balance' do
      oystercard.top_up(5)
      expect(oystercard.balance).to eq 5
    end

    it "it raises error if trying to exceed maximum balance of £90" do
      oystercard.top_up(90)
      expect{oystercard.top_up(1)}.to raise_error "Can't exceed maximum balance of £90."
    end
  end
end
