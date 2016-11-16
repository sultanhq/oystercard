require "card"

describe "User Stories" do

  let(:station) {double(:station)}
  let(:card) {Oystercard.new}

  # In order to use public transport
  # As a customer
  # I want money on my card
  context "when card has to be topped up" do
    before do
      card.top_up(10)
    end

      # In order to keep using public transport
      # As a customer
      # I want to add money to my card
      it "should be able to add money to the card" do
        expect(card.balance).to eq 10
      end

      # In order to protect my money
      # As a customer
      # I don't want to put too much money on my card
      it "doesn't allow to exceed the maximum balance value of £90" do
        expect{card.top_up(89)}.to raise_error "Can't exceed maximum balance of £90."
      end


      # In order to get through the barriers.
      # As a customer
      # I need to touch in and out.
      it "supports touch in and touch out" do
        card.touch_in(station)
        card.touch_out(station)
        expect{card}.to_not raise_error
      end



      # In order to pay for my journey
      # As a customer
      # When my journey is complete, I need the correct amount deducted from my card
      it "so that i pay for a journey the minimum amount has to be deducted at touch out" do
        card.touch_in(station)
        card.touch_out(station)
        expect(card.balance).to eq 9
      end

    # In order to pay for my journey
    # As a customer
    # I need to know where I've travelled from
    it "i need to know where I've travelled from" do
      p card.balance
      card.touch_in("Barbican")
      expect(card.entry_station).to eq "Barbican"
    end

    # In order to know where I have been
    # As a customer
    # I want to see to all my previous trips

    it "I want to see to all my previous trips" do
      card.touch_in("barbican")
      card.touch_out("bermondsey")
      expect(card.all_journeys).to eq [{:entry_station => "barbican", :exit_station => "bermondsey"}]
    end

    # In order to know how far I have travelled
    # As a customer
    # I want to know what zone a station is in
    it "it should know what zone the station is in" do
      station = Station.new("Barbican", "Zone1")
      expect(station.zone).to eq "Zone1"
    end


  end
context "when card doesn't need to be topped up" do
    it "so that I can touch in, the balance amount must not be below the minimum journey amount of £1" do
      expect{card.touch_in(station)}.to raise_error "Cannot touch in: minimum required balance is £1, please top up."
    end

    it "card should be able to hold money" do
      expect{card.balance}.not_to raise_error
    end
  end
end
