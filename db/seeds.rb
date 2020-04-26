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

landmark.tags.create!(
  [
    { name: '駅' },
    { name: '公共施設' },
    { name: '観光' }
  ]
)

Tag.create!(
  [
    { name: 'キャラクター' },
    { name: 'グルメ' },
    { name: '出町柳' },
    { name: '動物' },
    { name: '博物館' },
    { name: '商業施設' },
    { name: '国宝' },
    { name: '平家' },
    { name: '橋' },
    { name: '流鏑馬' },
    { name: '漫画' },
    { name: '神社' },
    { name: '祭り' },
    { name: '聖徳太子' },
    { name: '葵祭' },
    { name: '賀茂川' },
    { name: '重要文化財' },
    { name: '音楽' },
    { name: '鴨川' }
  ]
)
