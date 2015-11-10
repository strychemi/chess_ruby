=begin
  This class contains all of the logic for valid moves and piece movesets.

=end

class Piece
  attr_accessor :pos, :move_history, :move_list, :delta, :unicode
  attr_reader :color

  def initialize(pos, color)
    @pos = pos
    @color = color
    @move_history = []
  end

  #checks if coord array [x,y] is valid space to move on
  def valid_coord?(curr_piece, coord)
    white_pieces = "KQBNRP"
    curr_piece_is_white = white_pieces.include?(curr_piece.piece)
    return false unless coord.all? { |x| x.between?(0, 7) }
    unless @board[coord[0]][coord[1]].nil?
      piece_at_coord = @board[coord[0]][coord[1]].piece
      coord_piece_is_white = white_pieces.include?(piece_at_coord)
      return false if !(curr_piece_is_white ^ curr_piece_is_white)
    end
    return true
  end

end
