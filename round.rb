# This should evaluate the guts of the round.
require './player.rb'
require './mastermind.rb'

class Round

  def initialize(challenger, guesser)
    @challenger = challenger
    @guesser = guesser
    @index_a = [ 0, 1, 2, 3 ]
    @white = 0
    @red = 0
    @code = @challenger.set_code
    @guess = @guesser.guess
    evaluate_guess
  end

  def evaluate_guess
    if @code == @guess
      puts "Congrats! You Win!!!"
    else
      @code_hash = @challenger.make_code_hash
      puts @code_hash
      assign_white_pegs
      assign_red_pegs
      get_another_guess
    end
  end

  def assign_white_pegs
    @white = 0
    @guess.each do |color|
      if @code.include?(color)
        if @code_hash[color] != 0
          @white += 1
          @code_hash[color] -= 1
        end
      end
    end
    @white
  end

  def assign_red_pegs
    @red = 0
    @index_a.each do |i|
      if @guess[i] == @code[i]
        @red += 1
      end
    end
    @red
  end

  def get_another_guess
    puts "You received #{@red} red pegs and #{@white - @red} white pegs"
    puts "Try again"
    @guess = @guesser.guess
    evaluate_guess
  end
end