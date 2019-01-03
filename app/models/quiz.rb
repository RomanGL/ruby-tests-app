class Quiz < ApplicationRecord
  has_many :questions, dependent: :destroy

  validates :title, presence: true,
                    length: { minimum: 5 }
  validates :description, presence: true,
                    length: { in: 5..1000 }
end
