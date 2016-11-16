require 'oyster_card'

describe Oystercard do
subject(:oyster) { described_class.new }

    context "new card" do
    it 'should have a default balance' do
      expect(oyster.balance).to eq 0
    end
  end

    context "topping up" do
      it 'should add money to the card' do
        oyster.top_up(10)
        expect(oyster.balance).to eq 10
      end
      it 'should have a maximum balance of £90' do
        oyster.top_up(90)
        expect{ oyster.top_up(1) }.to raise_error "Card cannot be loaded over £#{Oystercard::MAXIMUM_BALANCE}."
      end
      it 'should not be able to top up over £90' do
        expect{ oyster.top_up(100) }.to raise_error "Card cannot be loaded over £#{Oystercard::MAXIMUM_BALANCE}."
      end
    end

    context "Minimum balance" do
      it 'should not allow touching in when balance is less than minimum balance' do
        expect{oyster.touch_in}.to raise_error("Not enough funds to travel")
      end
    end

    context 'in_journey?' do
      it 'should show the current journey status' do
        oyster.top_up(5)
        oyster.touch_in
        expect(oyster.in_journey?).to be true
      end
    end
      context "touching out" do
      it 'should set in_journey to false' do
        oyster.top_up(5)
        oyster.touch_in
        oyster.touch_out
        expect(oyster.in_journey?).to be false
      end

      it 'should deduct a fare from the card' do
        oyster.top_up(10)
        oyster.touch_in
        expect{ oyster.touch_out }.to change{ oyster.balance }.by(-Oystercard::MINIMUM_BALANCE)
      end
    end
  end
