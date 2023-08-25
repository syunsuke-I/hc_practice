# frozen_string_literal: true

# ポケモンの抽象クラス
class Pokemon
  attr_accessor :name, :type1, :type2, :hit_point

  def initialize(name, type1, type2, hit_point)
    @name = name
    @type1 = type1
    @type2 = type2
    @hit_point = hit_point
  end

  def attack
    "#{name}のこうげき！"
  end

  def change_name(new_name)
    if new_name == 'うんこ'
      puts '不適切な名前です'
      return
    end
    @name = new_name
  end
end
