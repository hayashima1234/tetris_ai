# -*- coding: utf-8 -*-

class TetrisWorldController
  def initialize(world)
    @world = world
    @input_flag = false
  end

  def inputted?() return @input_flag end
  def rotate_cw()
    return if inputted?
    return @input_flag = @world.rot_cmino(:cw)
  end
  def rotate_ccw()
    return if inputted?
    return @input_flag = @world.rot_cmino(:ccw)
  end
  def move_left()
    return if inputted?
    return @input_flag = @world.move_cmino(-1, 0)
  end
  def move_right()
    return if inputted?
    return @input_flag = @world.move_cmino(1, 0)
  end
  def fall_down()
    return if inputted?
    return @input_flag = @world.fastfall_cmino()
  end
  
  def get_board()
    return @world.board
  end
  def get_current_mino()
    return @world.cmino
  end
end
