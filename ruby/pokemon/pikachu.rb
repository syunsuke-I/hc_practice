# frozen_string_literal: true

require_relative '../pokemon/pokemon'

# ポケモンの抽象クラス
class Pikachu < Pokemon
  pikachu = Pikachu.new('ピカチュウ', '電気', '', 100)
  puts pikachu.name
  puts pikachu.attack
  puts pikachu.change_name('うんこ')
  puts pikachu.name
  pikachu.change_name('ピチュウの進化系')
  puts pikachu.name
end
