class Card
  attr_reader :face_value
  
  def initialize(face_value)
    @face_value = face_value
    @flip = false
  end

  def hide
    @flip = false
  end

  def reveal
    @flip = true
  end

  def to_s
    face_value = @flip ? @face_value : ""
  end

  def ==(other_card)
    self.face_value == other_card.face_value
  end
end