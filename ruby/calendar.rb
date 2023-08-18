# frozen_string_literal: true

require 'optparse'
require 'date'
require 'time'

# マッピング用
WDAY_MAPPING = { 0 => 'Mo', 1 => 'Tu', 2 => 'We', 3 => 'Th', 4 => 'Fr', 5 => 'Sa', 6 => 'Su' }.freeze
MONTH_MAPPING = { 1 => 'January', 2 => 'February', 3 => 'March', 4 => 'April',
                  5 => 'May', 6 => 'June', 7 => 'July', 8 => 'August',
                  9 => 'September', 10 => 'October', 11 => 'November', 12 => 'December' }.freeze

# 引数を取り扱う
m_used = false

opt = OptionParser.new do |opts|
  opts.on('-m', 'Option -m') do
    m_used = true
  end
end

opt.parse(ARGV)

now_month = Time.now.month

# 入力値判定
if ARGV[1].to_i.negative? || ARGV[1].to_i > 12 || (ARGV[1].to_i.zero? && m_used)
  puts "#{ARGV[1]} is neither a month number (1..12) nor a name"
  return
end

month = ARGV[1].to_i.zero? ? now_month : ARGV[1].to_i # 引数なしのときの対応

# カレンダー作成
cal = Array.new(6) { Array.new(7) }
end_of_month = Date.new(Date.today.year, month, -1).day
date = Date.new(Date.today.year, month, 1)
week_num = 0
(0..end_of_month - 1).each do |i| # カレンダーを二次元配列に見立てて値を格納していく方式
  wday = WDAY_MAPPING[((date.wday - 1) + i) % 7]
  cal[week_num][0] = i + 1 if wday == 'Mo'
  cal[week_num][1] = i + 1 if wday == 'Tu'
  cal[week_num][2] = i + 1 if wday == 'We'
  cal[week_num][3] = i + 1 if wday == 'Th'
  cal[week_num][4] = i + 1 if wday == 'Fr'
  cal[week_num][5] = i + 1 if wday == 'Sa'
  if wday == 'Su'
    cal[week_num][6] = i + 1
    week_num += 1
  end
end

# ヘッダー部分出力
month_year = "#{MONTH_MAPPING[month]} #{date.year}"
header = "#{month_year.center(30)}\n  #{WDAY_MAPPING.values.join('  ')}"
puts header

# カレンダー部分出力
cal.each do |week|
  line = week.map { |day| day ? format('% 4d', day) : ' ' * 4 }.join
  puts line
end
