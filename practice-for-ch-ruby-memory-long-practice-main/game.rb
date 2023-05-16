require_relative 'board'
require_relative 'card'

class Game
  def initialize
    @board = Board.new
    @guessed_pos = nil
  end

  def get_user_input
    row, col = gets.chomp.split.map! { |idx| idx.to_i }
  end
end