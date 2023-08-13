# frozen_string_literal: true

SCORES = { -4 => 'コンドル', -3 => 'アルバトロス', -2 => 'イーグル',
           -1 => 'バーディ', 0 => 'パー', 1 => 'ボギー' }.freeze

# 入力受取
input = $stdin.readlines
par = input[0].split(',') # 規定打数(X)
shots = input[1].split(',') # プレイヤーの打数(Y)
# 出力結果を格納する配列
results = []
shots.each_with_index do |y, i|
  x = par[i].to_i
  y = y.to_i
  point = y - x
  if y == 1 && x != 5
    results.push('ホールインワン')
    next
  end
  results.push("#{point}ボギー") if point > 1
  results.push(SCORES[point]) if point < 2
end
puts results.join(',')
