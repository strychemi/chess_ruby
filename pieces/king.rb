class King < Piece

  def initialize(pos, color)
    @pos = pos
    @color = color
    @color == "white" ? @unicode = "\u2654" : @unicode = "\u265A"
    @delta = [[1,-1], [1,0], [1,1], [0,1], [-1,1], [-1,0], [-1,-1], [0,-1]]
    @move_history = []
  end

  #generates possible legal moves for King
  def generate_moves
    @delta.each do |step|
      new_pos = [@pos[0] + step[0], @pos[1] + step[1]]
      @move_list << new_pos if valid_coord?(new_pos)
    end
  end
end
