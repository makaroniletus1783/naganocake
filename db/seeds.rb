# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create(name: "ケーキ")
Genre.create(name: "ドーナツ")
Genre.create(name: "マカロン")

item1 = Item.create(
    name: "イチゴケーキ",
    introduction: "たっぷりの生クリームと旬のイチゴの組み合わせは絶品です",
    price: 450,
    genre_id: 1,
    is_available: true
)

item1.image.attach(io: File.open(Rails.root.join('app/assets/images/cake1.png')),
                  filename: 'cake1.png')

item2 = Item.create(
    name: "カスタードドーナツ",
    introduction: "ドーナツの中に甘いカスタードが入っています",
    price: 500,
    genre_id: 2,
    is_available: true
)

item2.image.attach(io: File.open(Rails.root.join('app/assets/images/donatu.jpg')),
                  filename: 'donatu.jpg')

item3 = Item.create(
    name: "三色マカロン",
    introduction: "それぞれ味が違っていて、いろんな味を楽します",
    price: 870,
    genre_id: 3,
    is_available: true
)
item3.image.attach(io: File.open(Rails.root.join('app/assets/images/makaronn.jpg')),
                  filename: 'makaronn.jpg')

item4 = Item.create(
    name: "エンゼルフレンチ",
    introduction: "冷やしたらさらにおいしさアップ！",
    price: 150,
    genre_id: 2,
    is_available: true
)
item4.image.attach(io: File.open(Rails.root.join('app/assets/images/エンゼルフレンチ.jpg')),
                  filename: 'エンゼルフレンチ.jpg')