class Pawn < Piece

  def initialize(pos, color)
    @pos = pos
    @color = color
    @color == "white" ? @unicode = "\u2659" : @unicode = "\u265F"
    @delta = [
                [ [1,-1], [1,1], [1,0] ], #white pawn deltas
                [ [-1,-1], [-1,0], [-1,1] ] #black pawn deltas
              ]
    @move_history = []
  end

  #generates possible legal moves for Pawn
  def generate_moves
    pick_delta.each do |step|
      new_pos = [@pos[0] + step[0], @pos[1] + step[1]]
      @move_list << new_pos if valid_coord?(new_pos)
    end
  end

  #returns delta set based on pawn color
  def pick_delta
    @color == "white" ? @delta[0] : @delta[1]
  end
end
