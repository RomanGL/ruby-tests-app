class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :question_answers, dependent: :delete_all
  belongs_to :quiz

  validates :question, length: { minimum: 5 }
  validates :quiz_id, presence: true
end
