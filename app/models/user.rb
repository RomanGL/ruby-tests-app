class User < ApplicationRecord
  has_many :quiz_performs, dependent: :delete_all
  after_create :assign_default_role

  rolify
  devise :registerable, :validatable, :rememberable, :trackable, :database_authenticatable

  validates :name, presence: true

  def assign_default_role
    self.add_role(:student) if self.roles.blank?
  end
end
