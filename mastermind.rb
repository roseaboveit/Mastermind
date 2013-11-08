#This should be the file that is called to run the core of the game.
#require './player.rb'
#require './round.rb'
class Game

  def initialize
    puts "Welcome to Mastermind Player 1"
    @aplayer = Player.new
    puts "Welcome to Mastermind Player 2"
    @bplayer = Player.new
    @players = [@aplayer, @bplayer]
    @bplayer.your_turn
    match_flow
    results
  end

  def match_flow
    #Play round where player A sets the code
    first_round = Round.new(@aplayer, @bplayer)
    @bplayer.my_turn
    @aplayer.your_turn

    #Play round where player B sets the code
    puts "Time to switch roles in round two"
    second_round = Round.new(@bplayer, @aplayer)
  end

  def results
    puts "Everyone Wins!!!"
  end

end