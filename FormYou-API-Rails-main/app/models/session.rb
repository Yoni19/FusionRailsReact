class Session < ApplicationRecord
  belongs_to :room
  belongs_to :formation
  has_many :student_sessions
  has_many :users, through: :student_sessions
end
