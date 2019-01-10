class QuizPerform < ApplicationRecord
  belongs_to :user
  has_many :question_answers, dependent: :delete_all
end
