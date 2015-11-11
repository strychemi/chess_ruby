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
    @move_list = []
  end

  #generates possible legal moves for Pawn
  def generate_moves
    pick_delta.each do |step|
      #regular move opening for pawn
      if step == [1,0] || step == [-1,0]
        new_pos = [@pos[0] + step[0], @pos[1] + step[1]]
        if @board[new_pos].nil?
          @move_list << new_pos if valid_coord?(new_pos)
        end
      end
      #opening move for pawn (double step)
      if step == [1,0] && @move_history.empty? || step == [-1,0] && @move_history.empty?
        new_pos1 = [@pos[0] + step[0], @pos[1] + step[1]]
        new_pos2 = [@pos[0] + step[0] * 2, @pos[1] + step[1] * 2]
        #@move_list << new_pos if valid_coord?(new_pos)
        if @board[new_pos1].nil? && @board[new_pos2].nil?
          @move_list << new_pos2 if valid_coord?(new_pos2)
        end
      end
      #capture move for pawn
      if [[1,1],[1,-1], [-1,1],[-1,-1]].include?(step)
        new_pos = [@pos[0] + step[0], @pos[1] + step[1]]
        unless @board[new_pos].nil?
          other_piece = @board[new_pos]
          @move_list << new_pos if @color != other_piece.color && valid_coord?(new_pos)
        end
      end
      #en passant goes here
    end

  end

  #returns delta set based on pawn color
  def pick_delta
    @color == "white" ? @delta[0] : @delta[1]
  end
end
