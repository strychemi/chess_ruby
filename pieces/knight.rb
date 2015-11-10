class Knight < Piece

  def initialize(pos, color)
    @pos = pos
    @color = color
    @color == "white" ? @unicode = "\u2657" : @unicode = "\u265D"
    @delta = [[1,-1], [1,1], [-1,1], [-1,-1]]
    @move_history = []
  end

  def generate_moves
    @delta.each do |step|
      new_pos = [ri + step[0], fi + step[1]]
      @move_list << new_pos if valid_coord?(new_pos)
    end
  end

end
