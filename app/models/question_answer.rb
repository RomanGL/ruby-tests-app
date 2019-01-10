class QuestionAnswer < ApplicationRecord
  belongs_to :quiz_perform
  belongs_to :question
  belongs_to :answer
end
