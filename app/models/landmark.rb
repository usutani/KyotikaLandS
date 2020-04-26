class Landmark < ApplicationRecord
  validates :name, :hiragana, presence: true, uniqueness: true
  validates :hiragana, format: { with: /\A([ぁ-ん]|ー)+\z/,
                                 message: 'は、ひらがなを入力してください。' }
  validates :correct, numericality: { greater_than_or_equal_to: 1,
                                      less_than_or_equal_to: 3 }
end
