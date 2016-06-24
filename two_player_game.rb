
class TwoPlayerGame
 # binding.pry
  attr_accessor :player1 , :player2 , :passes, :failures ,:lives
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @players = [@player1, @player2]
    @passes = 0
    @failures = 0
    @lives = 3
  end

  def player_info
    @players.each do |player|
      puts "Enter your name"
      player.name, player.lives = gets.chomp, @lives
    end
  end


  def prompt_player_for_answer
    puts "What is your answer?"
    input = gets.chomp
  end

  def generate_question(player)
    [rand(1..20),rand(1..20)]
  end

  def two_game
    until prompt_player_for_answer == "done"
      player_info
    end
  end
end