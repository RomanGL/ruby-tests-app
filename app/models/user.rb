class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable #:confirmable, :recoverable, :lockable, :timeoutable, :rememberable, :database_authenticatable,
  devise :registerable, :validatable, :rememberable, :trackable, :database_authenticatable

  validates :name, presence: true
end
