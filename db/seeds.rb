label_names = %w(未分類 食費 日用品費 レジャー費 交際費 車費 医療費 養育費 美容費 被服費 趣味・娯楽費 交通費 家賃 水道・光熱費 保険 税・社会保証 自動車関連費  その他)

label_names.each do |name|
  Label.create(name: name)
end

[*1..10].each do |i| 
  User.create(name: "testuser#{i}",email: "sample#{i}@railsseed.org",password: "123456", password_confirmation: "123456")
end