class Category < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { maximum: 100 }
end
