class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 100 }
end
