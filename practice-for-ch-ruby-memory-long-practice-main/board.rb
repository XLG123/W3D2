require_relative 'card'

class Board
  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

  def populate
    letters = ('A'..'Z').to_a.sample(8)
    letters.concat(letters).shuffle!

    @grid.each do |row|
      row.each_with_index do |cell,i|
        row[i] = Card.new(letters.pop)
      end 
    end
  end
end