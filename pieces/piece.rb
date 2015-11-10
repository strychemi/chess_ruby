=begin
  This class contains all of the logic for valid moves and piece movesets.

=end

class Piece
  attr_accessor :pos, :move_history, :move_list, :board
  attr_reader :color, :delta, :unicode

  def initialize(pos, color)
    @pos = pos
    @color = color
    @move_history = []
  end

  #checks if coord array [x,y] is valid space to move on
  #i.e. checks for "coord" for empty square or piece of opposing color
  def valid_coord?(coord)
    return false unless coord.all? { |x| x.between?(0, 7) }
    unless @board[coord[0]][coord[1]].nil? #if square at coord not empty
      piece_at_coord = @board[coord[0]][coord[1]]
      return false if self.color == piece_at_coord.color
    end
    true
  end

end
