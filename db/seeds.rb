# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
landmark = Landmark.create!(
  name: 'JR京都駅',
  hiragana: 'じぇーあーるきょうとえき',
  latitude: 34.9855,
  longitude: 135.758,
  url: 'https://ja.wikipedia.org/wiki/京都駅',
  question: '日本一長いホームとして知られるJR京都駅のホームの長さは？',
  answer1: '558m',
  answer2: '672m',
  answer3: '773m',
  correct: 1,
  author: '臼谷泰弘'
)
