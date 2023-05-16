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

  def play
    @board.render

    pos = self.get_user_input

    @guessed_pos = pos if !@guessed_pos

    card = @board[*pos]

  

    #...
    if @guessed_pos
      @guessed_pos = nil
    else
      @guessed_pos = pos
    end
  end

  def game
    unless @board.won?
      @board.render

      self.get_user_input
    end
  end
end