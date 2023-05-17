class HumanPlayer
  def self.get_user_input
    print 'Enter position: '
    gets.chomp.split.map! { |idx| idx.to_i }
  end
end