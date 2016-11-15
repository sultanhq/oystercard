require_relative 'barriers'

class Oystercard

  attr_reader :balance, :in_journey

    Maximum_capacity = 90

    def initialize
      @balance = 0
      @in_journey = []
    end

    def top_up(amount)
      raise "Cannot top up: balance capacity of #{Maximum_capacity} has been exceeded" if @balance + amount > Maximum_capacity
      @balance += amount
    end

    def deduct(amount)
      @balance -= amount
    end

    def touch_in(card)
      in_journey << card
    end

    def touch_out(card)
      in_journey.delete(card)
    end

  end
