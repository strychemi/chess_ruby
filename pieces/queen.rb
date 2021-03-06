class Queen < Piece

  def initialize(pos, color)
    @pos = pos
    @color = color
    @color == "white" ? @unicode = "\u2655" : @unicode = "\u265B"
    @delta = [[1,-1], [1,0], [1,1], [0,1], [-1,1], [-1,0], [-1,-1], [0,-1]]
    @move_history = []
    @move_list = []
  end

  #generates possible legal moves for queen
  def generate_moves
    @delta.each do |step|
      (1..7).each do |i|
        new_pos = [@pos[0] + step[0] * i, @pos[1] + step[1] * i]
        if valid_coord?(new_pos)
          @move_list << new_pos
          break if @board[new_pos]
        else
          break
        end
      end
    end
  end
end
