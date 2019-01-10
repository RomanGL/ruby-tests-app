class Answer < ApplicationRecord
  belongs_to :question
  has_many :question_answers, dependent: :delete_all

  validates :title, presence: true
  validates :question_id, presence: true
end
