# -*- coding: utf-8 -*-
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

    # @ctr = controller
    # if @counter < 5 then
    #   if rand(2) == 0 then @ctr.move_left()
    #   else @ctr.move_right()
    #   end
    # elsif @counter == 5 then
    #   @ctr.rotate_cw()
    # elsif @counter == 6
    #   @ctr.fall_down()
    # elsif @counter == 8
    #   @counter = 0
    # end

    @counter += 1
  end
end
