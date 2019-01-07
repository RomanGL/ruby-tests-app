class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :title, length: { minimum: 5 }
  validates :description, length: { in: 5..1000 }
end
