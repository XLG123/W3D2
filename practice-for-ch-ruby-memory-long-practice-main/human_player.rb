class HumanPlayer
  def self.get_user_input
    gets.chomp.split.map! { |idx| idx.to_i }
  end
end