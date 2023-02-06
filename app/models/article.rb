class Article < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :title, length: { maximum: 100 }
end
