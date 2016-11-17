require "card"

describe Oystercard do
  subject(:oystercard) { described_class.new }
  let(:station) {double(:station)}
  let(:station2) {double(:station)}

  it {is_expected.to respond_to :balance}

  context "when initialized" do

  it "it with a default balance of 0" do
    expect(oystercard.balance).to eq 0
  end

  it "it with an array of journeys" do
    expect(oystercard.all_journeys).to eq([])
  end


end

  context "when using top_up" do
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

  context "when using touch in" do
    it { is_expected.to respond_to(:touch_in).with(1).argument}

    it "should raise an error if balance amount is below minimum journey amount of £1" do
      expect{oystercard.touch_in(station)}.to raise_error "Cannot touch in: minimum required balance is £1, please top up."
    end

    it "should charge a penalty if touched in twice" do
      oystercard.top_up(10)
      oystercard.touch_in(station)
      oystercard.touch_in(station)
      expect(oystercard.balance).to eq 4
    end

    it "should charge a penalty if not touced in" do
      oystercard.top_up(10)
      oystercard.touch_out(station)
      expect(oystercard.balance).to eq 4
    end
  end

  describe "when using touch out" do
    it { is_expected.to respond_to(:touch_out).with(1).argument}

    it "should deduct the minimum journey ammount" do
      oystercard.top_up(2)
      oystercard.touch_in(station)
      expect{oystercard.touch_out(station)}.to change{oystercard.balance}.by(-1)
    end

    it "should store a journey hash" do
      oystercard.top_up(89)
      oystercard.touch_in(station)
      oystercard.touch_out(station2)

    end

    it "should store the journey hash into the all journeys array" do
      oystercard.top_up(67)
      oystercard.touch_in(station)
      oystercard.touch_out(station2)
      expect(oystercard.all_journeys).to eq([{:entry_station => station, :exit_station => station2}])
    end

  end

  describe "when asking if it's in journey" do

    it "it should be true if card has touched in" do
      oystercard.top_up(1)
      oystercard.touch_in(station)
      expect(oystercard.in_journey?).to eq true
    end
    it "should be false if card has touched out" do
      oystercard.touch_out(station)
      expect(oystercard.in_journey?).to be false
    end
  end





end
