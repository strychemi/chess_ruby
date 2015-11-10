=begin
  This class controls the user interaction and runs the chess game.
=end

require "./board.rb"

class Game
  attr_reader :board

  #hash for converting File letter to array column index
  @@file_num = {
    "A" => 0,
    "B" => 1,
    "C" => 2,
    "D" => 3,
    "E" => 4,
    "F" => 5,
    "G" => 6,
    "H" => 7,
    "a" => 0,
    "b" => 1,
    "c" => 2,
    "d" => 3,
    "e" => 4,
    "f" => 5,
    "g" => 6,
    "h" => 7
  }

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
      puts "valid input" if valid_input?(input)
      #@board.process_input(input)
      #@board.clear_moves
    end
  end

  #checks for valid user input
  def valid_input?(user_input)
    #regex for valid input
    proper_format = /^[a-zA-Z][1-8] [a-zA-Z][1-8]$/ #Example: A1 B2 or c3 G4
    if proper_format.match(user_input)
      move = user_input.split(" ")
      if move[0] == move[1] #if start and end position are the same
        puts "Not a valid move! The start and end positions are the same!"
        puts
        return false
      else #if it is a valid user input
        start_pos = [move[0][1].to_i - 1, @@file_num[move[0][0]]]
        end_pos = [move[1][1].to_i - 1, @@file_num[move[1][0]]]
        #puts start_pos.inspect
        #puts end_pos.inspect
        if !@board[start_pos] #if nothing at start position
          puts "There is no piece at #{move[0]}!"
          puts
          return false
        else #check if move is legal and if so, return true
          return true
          #@board[end_pos[0]][end_pos[1]] = @board[start_pos[0]][start_pos[1]]
          #@board[start_pos[0]][start_pos[1]] = nil
        end
        puts
        print_board
      end
    else
      puts "Not a valid input!"
      puts
      return false
    end
  end

end

game = Game.new
game.play
