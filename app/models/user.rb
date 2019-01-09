class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :omniauthable #:confirmable, :recoverable, :lockable, :timeoutable, :rememberable, :database_authenticatable,
  devise :registerable, :validatable, :rememberable, :trackable, :database_authenticatable

  validates :name, presence: true

  after_create :assign_default_role
  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end

end
