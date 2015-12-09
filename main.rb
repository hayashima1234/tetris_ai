# -*- coding: utf-8 -*-
require './core.rb'
require './disp.rb'

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

# AIクラス（実装対象）
# AI.update(controller) を必ず実装する
class AI
  def initialize()
    @ctr = nil
    @counter = 0
  end

  # 思考開始時に呼び出される
  def update(controller)
    # controllerはテトリス操作に必要なオブジェクト
    # const.rb内のAI_TIMEOUT_LIMIT時間内に処理が戻らなければ
    # 強制的に呼び出し元に戻る

    @ctr = controller
    if @counter < 5 then
      if rand(2) == 0 then @ctr.move_left()
      else @ctr.move_right()
      end
    elsif @counter == 5 then
      @ctr.rotate_cw()
    elsif @counter == 6
      @ctr.fall_down()
    elsif @counter == 8
      @counter = 0
    end

    @counter += 1
  end
end


world = TetrisWorld.new()
ai = AI.new()


display_init()

ex = 2
add_display_window(TetrisAreaWindow.new(2, ex, world.board))
#~ add_display_window(BoardContentsWindow.new(3, ex+24, world.board))
add_display_window(NextWindow.new(2, ex+24, world))
add_display_window(InfoWindow.new(20, ex+24, world))

while true do
  timer = Thread.new{
    ai.update(TetrisWorldController.new(world))
    sleep(AI_TIMEOUT_LIMIT)
  }
  timer.join(AI_TIMEOUT_LIMIT)
  world.update()
  display_update()
end

display_end()
