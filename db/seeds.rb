['育苗', '管理', '収穫', '出荷', '病虫害診断', '病虫害予防', 'その他'].each do |title|
  Category.find_or_create_by(title: title)
end

['イチゴ', 'さつまいも', 'ぶどう', '落花生', 'かぼちゃ', 'とうもろこし', 'その他'].each do |title|
  Crop.find_or_create_by(title: title)
end
