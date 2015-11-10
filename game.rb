=begin
  This class controls the user interaction and runs the chess game.
=end

require "./board.rb"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    puts
    puts "Welcome to CLI Chess!"
    puts "---------------------"
    puts "Instructions: Type in moves using coordinates"
    puts "For example: White can type 'b1 c3' to move"
    puts "the knight from its starting location, B1, to"
    puts "its final location, C3. Uppercase and lowercase both"
    puts "work. Bullet points indicate black squares."
    puts
    puts "NOTE: REGARDLESS OF HOW THE PIECE COLORS ARE RENDERED,"
    puts "WHITE STARTS ON BOTTOM, BLACK STARTS ON TOP!"
    puts
    @board.print_board

    while true #win condition
      puts "Move:"
      input = gets.strip
      @board.print_board
      #@board.generate_moves
      #@board.process_input(input)
      #@board.clear_moves
    end
  end

end

game = Game.new
game.play
