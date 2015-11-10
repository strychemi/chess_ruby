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
    #(0..7).each do |n|
    #  @board[6][n] = Piece.new("p")
    #  @board[1][n] = Piece.new("P")
    #end

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
    #@all_pieces.push(@board[0][7])
    #puts @all_pieces.inspect
    #@board[0][7].board = board
    #puts @board[0][7].board

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
        #print file.piece
      end
    end
    puts "\u2502" #vertical line
  end
  puts "   A B C D E F G H"
  puts
end

end
