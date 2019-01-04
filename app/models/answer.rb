class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validates :question_id, presence: true
end
