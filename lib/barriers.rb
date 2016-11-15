class Barriers

 attr_reader :in_journey


  def initialize
    @in_journey = []
  end

  def touch_in(card)
    in_journey << card
  end

  def touch_out(card)
    in_journey.delete(card)
  end

  def in_use?
    true
  end

  def not_in_use?
    false
  end


end
