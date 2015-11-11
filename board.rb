=begin
  This class controls the state of the game.
  board[0][0] represents the bottom left of the board where the white rook stands on a black square.
=end
require "./pieces.rb"

class Board
  attr_accessor :all_pieces
  attr_reader :board

  #initialize the starting chess board
  def initialize
    @board = Array.new(8) { Array.new(8) }
    @all_pieces = []

    #initilize pawns
    (0..7).each do |n|
      @board[6][n] = Pawn.new([6,n], "black")
      @board[1][n] = Pawn.new([1,n], "white")
    end

    #initialize starting black pieces
    @board[7][0] = Rook.new([7,0], "black")
    @board[7][1] = Knight.new([7,1], "black")
    @board[7][2] = Bishop.new([7,2], "black")
    @board[7][3] = Queen.new([7,3], "black")
    @board[7][4] = King.new([7,4], "black")
    @board[7][5] = Bishop.new([7,5], "black")
    @board[7][6] = Knight.new([7,7], "black")
    @board[7][7] = Rook.new([7,7], "black")

    #initialize starting white pieces
    @board[0][0] = Rook.new([0,0], "white")
    @board[0][1] = Knight.new([0,1], "white")
    @board[0][2] = Bishop.new([0,2], "white")
    @board[0][3] = Queen.new([0,3], "white")
    @board[0][4] = King.new([0,4], "white")
    @board[0][5] = Bishop.new([0,5], "white")
    @board[0][6] = Knight.new([0,6], "white")
    @board[0][7] = Rook.new([0, 7], "white")

    #update board
    update_board
    #puts @all_pieces.inspect
    #@board[0][7].board = board
    #puts @board[0][7].board
    #puts @board[1][0].move_list.inspect
  end

  #prints board on command line interface
  def print_board
    @board.reverse.each_with_index do |rank, ri|
      rank_num = rank.length - ri
      print "#{rank_num} "
      rank.each_with_index do |file, fi|
        print "\u2502" #vertical line
        if file.nil?
          print "\u2022" #bullet point
        else
          print file.unicode # prints piece unicode
        end
      end
      puts "\u2502" #vertical line
    end
    puts "   A B C D E F G H"
    puts
  end

  #utility getter method to access the 8x8 array masked by Board class
  def [](pos)
    @board[pos[0]][pos[1]]
  end

  #utility setter method to set any "pos" in 8x8 array to "value"
  def []=(pos, value)
    @board[pos[0]][pos[1]] = value
  end

  #updates the status of the board
  def update_board
    #clear previous move_list from all pieces
    @board.each do |row|
      row.each do |col|
        col.move_list = [] if !col.nil?
      end
    end
    #clear previous state of @all_pieces
    @all_pieces = []
    #adds every piece obj to all_pieces class variable
    @board.each do |row|
      row.each do |col|
        @all_pieces << col if !col.nil?
      end
    end
    #give each piece a copy of the board state
    #then allow generate_moves method to come up with a list of possible moves
    #based on that board state
    @all_pieces.each do |n|
      n.board = self
      n.generate_moves
    end
  end
end
