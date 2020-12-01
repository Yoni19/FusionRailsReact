class Category < ApplicationRecord
  has_many :formation_categories
  has_many :formations, through: :formation_categories
end
