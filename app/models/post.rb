class Post < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :tags
  belongs_to :category, class_name: 'Tag'

  def self.basic_search(query)
    Post.where('title LIKE ?', "%#{query}%")
  end

  def self.search(query = '')
    qs = query.split(' ')

    qs.reduce self do |acc, el|
      acc.where('title % ?', "%#{el}%")
    end
  end
end
