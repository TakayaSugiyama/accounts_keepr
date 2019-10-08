label_names = %w(未分類 食費 日用品費 レジャー費 交際費 車費 医療費 子ども費 美容費 被服費 趣味・娯楽費 交通費)

label_names.each do |name|
  Label.create(name: name)
end