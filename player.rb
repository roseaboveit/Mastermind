# This file will create each player for the mastermind game
class Player
  attr_accessor :name, :guesser
  attr_reader :code, :guess, :color, :code_hash

  def initialize(option = {})
    @empty_code_hash = {"red" => 0, "blue" => 0, "yellow" => 0, "green" => 0, "white" => 0, "orange" => 0}
    @code = []
    @guess = []
    puts "Hello player, what is your name?"
    @name = gets.chomp
    @guesser = true
  end

  def your_turn
    @guesser = false
  end

  def my_turn
    @guesser = true
  end


  def choose_color
    puts "Select a color: red, blue, yellow, green, white, orange"
    @color = gets.chomp.downcase
    unless @color == "red" || @color == "blue" || @color == "yellow" || @color == "green" || @color == "white" || @color == "orange"
      puts "Invalid: Please try again"
      @color = gets.chomp.downcase  
    end
    puts "You chose #{@color}"
    return @color
  end

  def set_code
    puts "#{@name}, it is your turn to set the code."
    puts "Make sure that your opponent is not overlooking."
    @code << choose_color
    puts "Three more"
    @code << choose_color
    puts "Two more"
    @code << choose_color
    puts "Last one"
    @code << choose_color
  end

  def make_code_hash
    @code_hash = {"red" => 0, "blue" => 0, "yellow" => 0, "green" => 0, "white" => 0, "orange" => 0}
    @code.each do |color| 
      @code_hash[color] = @code_hash[color] + 1
    end
    @code_hash
  end

  def guess
    @guess = []
    puts "#{@name}, it is your turn to guess."
    @guess << choose_color
    puts "Three more"
    @guess << choose_color
    puts "Two more"
    @guess << choose_color
    puts "Last one"
    @guess << choose_color
  end

end