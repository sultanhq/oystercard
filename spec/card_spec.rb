require "card"

describe Oystercard do
  subject(:oystercard) { described_class.new(0) }

  it {is_expected.to respond_to :balance}

  it "should be initialized with a default balance of 0" do
    expect(oystercard.balance).to eq 0
  end

  describe "when using top_up" do
    it {is_expected.to respond_to :top_up}

    it {is_expected.to respond_to(:top_up).with(1).argument}

    it "increases the balance" do
      oystercard.top_up(5)
      expect(oystercard.balance).to eq 5
    end

    it "it raises error if trying to exceed maximum balance of £90" do
      oystercard.top_up(90)
      expect{oystercard.top_up(1)}.to raise_error "Can't exceed maximum balance of £90."
    end
  end

  describe "when using deduct" do
    it {is_expected.to respond_to :deduct}

    it {is_expected.to respond_to(:deduct).with(1).argument}

    it "deducts the fare from the balance" do
      oystercard.top_up(10)
      oystercard.deduct(1)
      expect(oystercard.balance).to eq 9
    end
  end

  describe "when using touch in" do
    it { is_expected.to respond_to :touch_in}
    it "should return with true" do
      expect(oystercard.touch_in).to eq true
    end
  end

  describe "when using touch out" do
    it { is_expected.to respond_to :touch_out}
    it "should return false" do
      expect(oystercard.touch_out).to eq false
    end
  end

  describe "when asking if it's in journey" do
    it {is_expected.to respond_to :in_journey?}
    it "it should be true if card has touched in" do
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq true
    end
    it "should be false if card has touched out" do
      oystercard.touch_out
      expect(oystercard.in_journey?).to be false
    end

  end




end
