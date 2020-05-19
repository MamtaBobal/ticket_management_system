class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Enums
  enum gender: [:male, :female]

  # Validations
  validates :name, :gender, presence: true

  # Associations
  has_many :user_events
  has_many :events, through: :user_events
end
