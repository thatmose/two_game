
class TwoPlayerGame
  attr_accessor :player1 , :player2 , :passes, :failures ,:lives
  def initialize
    @status = true
    @player1 = Player.new
    @player2 = Player.new
    @players = [@player1, @player2]
    @passes = 0
    @failures = 0
    @question = nil
  end

  #
  # Collects player names before first run of the game
  #
  # @return # => nil
  #
  def player_info
    @players.each do |player|
      puts "Introduce yourselves:"
      player.name = gets.chomp
    end
  end

  #
  # Keeps track of overall game statistics
  #
  # @return # => String
  #
  def game_stats
    puts "\nNumber of passes: #{@passes}"
    puts "Number of failures: #{@failures}"

    puts "Party Time!" if @passes >= 8
  end

  #
  # Collects player response to question
  #
  # @return # => Boolean (through validate_answer method)
  #
  def prompt_player_for_answer
    puts "What is your answer?"
    answer = gets.chomp.to_i
    validate_answer(answer)
  end

  #
  # Check whether the answer is correct
  #
  # @param # => Fixnum
  # @return # => Boolean (through validate_answer method)
  #
  def validate_answer(answer)
    answer == @question.reduce(:+) 
  end

  #
  # Keeps track of player scores and confirms if any of the player has died
  #
  # @return # => String
  # @return # => Boolean (When and_game is reached)
  #
  def score
    puts "\n#{@player1.name}:#{@player1.score} points | #{@player2.name}:#{@player2.score} points"
    if [@player1.lives, @player2.lives].include?(0)
      end_game
    end
  end

  #
  # Activates end of game 
  #
  # @return # => Boolean
  #
  def end_game
    if @player1.score > @player2.score
      puts "#{@player1.name} has won with #{@player1.score} points and #{@player1.lives} live(s) remaining"
    else
      puts "#{@player2.name} has won with #{@player2.score} points and #{@player2.lives} live(s) remaining"
    end
    @status = false
  end

  #
  # Generates questions for the players
  #
  # @return # => Fixnum
  #
  def generate_question
    @players.each do |player|
      @question = [rand(1..20), rand(1..20)]
      puts "\n#{player.name}: What does #{@question[0]} plus #{@question[1]} equal?"
      if prompt_player_for_answer
        player.score += 1
        @passes += 1 
      else 
        player.lives -= 1
        @failures += 1
      end  
    end
  end

  #
  # Main function that runs the game
  #
  # @return # => String
  # @return # => Boolean (at end of game situation)
  #
  def two_game
    player_info
    loop do
      generate_question
      score
      game_stats
      break if @status == false
    end
  end
end
