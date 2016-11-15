class Oystercard

  attr_reader :balance

    Maximum_capacity = 90

    def initialize
      @balance = 0
      @in_journey = false
    end

    def top_up(amount)
      raise "Cannot top up: balance capacity of #{Maximum_capacity} has been exceeded" if @balance + amount > Maximum_capacity
      @balance += amount
    end

    def deduct(amount)
      @balance -= amount
    end

     def touch_in
       @in_journey = true
     end

     def touch_out
       @in_journey = false
     end

     def in_journey?
       @in_journey
     end

  end
