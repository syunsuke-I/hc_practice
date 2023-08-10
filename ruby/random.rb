# frozen_string_literal: true

# グループ分けを行う
class Divide
  def into_half(members)
    divmemembers_group_former = members[0..2].sort
    divmemembers_group_latter = members[3..5].sort
    [divmemembers_group_former, divmemembers_group_latter]
  end

  def into_two_and_four(members)
    divmemembers_group_two = members[0..1].sort
    divmemembers_group_four = members[2..5].sort
    [divmemembers_group_two, divmemembers_group_four]
  end
end

def generate_members
  numerical_members = (0..5).to_a
  members_mapping = { 0 => 'A', 1 => 'B', 2 => 'C', 3 => 'D', 4 => 'E', 5 => 'F' }
  members_named = []
  # 数字で表されたメンバーを英語に変換する
  numerical_members.shuffle.each do |mem|
    members_named.push(members_mapping[mem])
  end
  members_named
end

# ここからmain処理
devive = Divide.new
# 3人ずつか2人と4人にランダムに分ける
pattern = rand(0..1)
groupping_member = if pattern.zero?
                     devive.into_half(generate_members)
                   else
                     devive.into_two_and_four(generate_members)
                   end
p groupping_member[0], groupping_member[1]
