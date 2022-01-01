# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

List.create!(
  title: 'railsを学ぼう',
  body: 'seedファイルについて'
)

10.times do |number|
  List.create!(title: 'timesを学習しよう',body: number)
end