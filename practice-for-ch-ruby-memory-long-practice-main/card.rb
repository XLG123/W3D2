class Card
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
    self.
  end

end