class Formation < ApplicationRecord
  belongs_to :user
  has_many :sessions
  has_many :formation_categories
  has_many :categories, through: :formation_categories
end
