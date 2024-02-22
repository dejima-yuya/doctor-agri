# Category.create([
#   { title: '育苗' },
#   { title: '管理' },
#   { title: '収穫' },
#   { title: '出荷' },
#   { title: '病虫害診断' },
#   { title: '病虫害予防' },
#   { title: 'その他' }
# ])

# Crop.create([
#   { title: 'イチゴ' },
#   { title: 'さつまいも' },
#   { title: 'ぶどう' },
#   { title: '落花生' },
#   { title: 'かぼちゃ' },
#   { title: 'とうもろこし' },
#   { title: 'その他' }
# ])

# Categoryの初期データをロード。データ重複対策コード
['育苗', '管理', '収穫', '出荷', '病虫害診断', '病虫害予防', 'その他'].each do |title|
  Category.find_or_create_by(title: title)
end

# Cropの初期データをロード。データ重複対策コード
['イチゴ', 'さつまいも', 'ぶどう', '落花生', 'かぼちゃ', 'とうもろこし', 'その他'].each do |title|
  Crop.find_or_create_by(title: title)
end
