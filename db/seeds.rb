label_names = %w(未分類 食費 日用品費 レジャー費 交際費  医療費 養育費 美容費 被服費 趣味・娯楽費 交通費 家賃 水道・光熱費 保険 税・社会保証 自動車関連費  その他)

label_names.each do |name|
  Label.create(name: name)
end


[*1..20].each do |i| 
  user = User.create(name: "testuser#{i}",email: "sample#{i}@railsseed.org",password: "123456", password_confirmation: "123456")
  record = Record.create(store_name: "store#{i}", user_id: i ,purchase_price: 100 * i , label_id: rand(Label.all.count) + 1, purchase_date: Random.rand(Date.new(Date.today.year, Date.today.month)..Date.new(Date.today.year,Date.today.month ,-1)) )
  product = Product.create(name: "product#{i}", price: 100 * i, record_id: record.id )
  Memo.create(content: "memoだお#{i}", record_id: record.id) 
  Review.create(title: "title #{i}", content: "レビューだお#{i}", product_id: product.id , user_id: user.id , rating:  rand(5) + 1 ) 
end