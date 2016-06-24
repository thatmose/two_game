class Player
  attr_accessor :score, :name, :answer, :lives
  def initialize
    @score = 0
    @name = nil
    @answer = nil
    @lives = 3
  end  
end