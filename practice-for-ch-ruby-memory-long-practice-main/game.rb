require_relative 'board'
require_relative 'card'
require_relative 'human_player'

class Game
  def initialize
    @board = Board.new
    @guessed_pos = nil
  end

  # def get_user_input
  #   gets.chomp.split.map! { |idx| idx.to_i }
  # end



  def play
    pos = HumanPlayer.get_user_input

    card_1 = @board[*pos]
    if card_1.to_s != " "
      return nil
    end
    card_1.reveal

    if !@guessed_pos
      @guessed_pos = pos
      @board.render
    else
      card_2 = @board[*@guessed_pos]
      card_2.reveal
      @board.render
      if card_1 != card_2
        card_1.hide
        card_2.hide
        @board.render
      end
      @guessed_pos = nil
      clear
      @board.render
    end
  end

  def clear
    sleep(2)
    system("clear")
  end

  def game
    @board.populate
    p @board

    @board.render
    while !@board.won?
      play
    end
  end
end