class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :quiz

  validates :question, presence: true,
                       length: { minimum: 5 }
  validates :quiz_id, presence: true
end
