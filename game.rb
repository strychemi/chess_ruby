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
    @board.start_board
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

    turn = 1
    while true #win condition
      if turn % 2 == 1
        print "Move #{turn} [White's move]: "
      else
        print "Move #{turn} [Black's move]: "
      end
      input = gets.strip
      #puts
      move = valid_input?(input)
      if move
        #check if white's move
        if turn % 2 == 1 && @board[move[0]].color == "white"
          if move_piece(move)
            @board.update_board
            @board.print_board
            turn += 1
          end
        #check black's move
        elsif turn % 2 == 0 && @board[move[0]].color == "black"
          if move_piece(move)
            @board.update_board
            @board.print_board
            turn += 1
          end
        else
          puts "Move a correct colored piece!"
          puts
        end
      else
        next
      end
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
      else #else check other cases
        start_pos = [move[0][1].to_i - 1, @@file_num[move[0][0]]]
        end_pos = [move[1][1].to_i - 1, @@file_num[move[1][0]]]
        if !@board[start_pos] #if nothing at start position
          puts "There is no piece at #{move[0]}!"
          puts
          return false
        else #return the move if it passes all other cases
          puts
          return [start_pos, end_pos]
        end
      end
    else
      puts
      puts "Not a valid input!"
      puts
      return false
    end
  end

  #checks if "move" is within set of move_list of that particular piece
  #if so, then move the piece
  #then update its position (pos) and move history (move_history)
  def move_piece(move)
    curr_piece = @board[move[0]]
    #puts curr_piece.move_list.inspect
    #puts move.inspect
    if curr_piece.non_check_moves.include?(move[1])
      @board[move[1]] = curr_piece
      @board[move[0]] = nil
      curr_piece.move_history << move
      curr_piece.pos = move[1]
      return true
    else
      puts "Not a legal move for this #{curr_piece.color} #{curr_piece.class}! Or your King is in check!"
      puts
      return false
    end
  end
end

#create a new game instance and start game!
game = Game.new
game.play
