# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@admin.com',
  password: "aaaaaa"
)
Genre.create!(
  name: "ジャンル1",
  valid_flag: "true"
)
Item.create!(
  genre_id: "1",
  name: "商品1",
  price: "100",
  status: "true"
)
EndUser.create!(
  family_name: "新宿",
  first_name: "太郎",
  family_name_kana: "シンジュク",
  first_name_kana: "タロウ",
  phone: "11111111111",
  postal_code: "1111111",
  address: "東京都新宿区新宿",
  email: "a@a",
  password: "aaaaaa"
)