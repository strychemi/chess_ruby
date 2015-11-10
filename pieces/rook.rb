class Rook < Piece

  def initialize(pos, color)
    @color = color
    @color == "white" ? @unicode = "\u2656" : @unicode = "\u265C"
    @delta = [[1,0], [0,1], [-1,0], [0,-1]]
    @move_history = []
=begin
    @delta.each do |step|
      8.times do |i|
        next if i.zero?
        new_pos = [pos[0] + step[0] * i, pos[1] + step[1] * i]
        if valid_coord?(file, new_pos)
          file.move_list << new_pos
          break if @board[new_pos[0]][new_pos[1]]
        else
          break
        end
      end
    end
=end
  end

end
