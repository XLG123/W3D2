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

  def render
    print " "
    (0...4).each { |i| print " #{i}" }
    puts
    @grid.each_with_index do |row, idx|
      print "#{idx} "
      puts row.map { |card| card.to_s }.join(" ")
    end
  end

  def won?
    @grid.all? { |row| row.all? { |card| card.to_s != "" } }
  end

  def reveal(guessed_pos)
    row, col = *guessed_pos
    @grid[row][col].reveal.to_s
  end

  def [](row, col)
    @grid[row][col]
  end
end