class User < ApplicationRecord
  has_many :formations
  has_many :student_sessions
  has_many :sessions, through: :student_sessions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

end
