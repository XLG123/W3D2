require_relative 'board'
require_relative 'card'

class Game
  def initialize
    @board = Board.new
    @guessed_pos = nil
  end

  def get_user_input
    print 'Enter position: '
    gets.chomp.split.map! { |idx| idx.to_i }
  end

  def play
    pos1 = get_user_input
    card_1 = @board[*pos1]
    card_1.reveal

    system("clear")
    @board.render

    pos2 = get_user_input
    card_2 = @board[*pos2]
    card_2.reveal

    system("clear")
    @board.render

    if card_1 != card_2
      card_1.hide
      card_2.hide
      sleep(1.5)
    end

    system("clear")
    @board.render
  end

  def clear
    sleep(5)
    system("clear")
  end

  def game
    @board.populate
    # p @board

    @board.render
    while !@board.won?
      play
    end
  end
end