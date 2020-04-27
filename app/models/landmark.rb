class Landmark < ApplicationRecord
  validates :name, :hiragana, presence: true, uniqueness: true
  validates :hiragana, format: { with: /\A([ぁ-ん]|ー)+\z/,
                                 message: 'は、ひらがなを入力してください。' }
  validates :correct, numericality: { greater_than_or_equal_to: 1,
                                      less_than_or_equal_to: 3 }

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def tag_names
    tags.map(&:name).join(',')
  end

  def add_tags(tag_names)
    return if tag_names.empty?

    JSON.parse(tag_names).each do |tag_name_hash|
      tag_name = tag_name_hash['value']
      unless tag_name.blank?
        tag = Tag.find_or_create_by(name: tag_name)
        tags << tag
      end
    end
  end
end
