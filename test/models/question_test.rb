require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  VALID_QUESTION = 'Question title'
  VALID_QUIZ_ID = 1

  test 'valid question' do
    question = Question.new question: VALID_QUESTION, quiz_id: VALID_QUIZ_ID

    assert question.valid?, 'question is invalid'
  end

  test 'invalid with too short question field' do
    question = Question.new question: '1234', quiz_id: VALID_QUIZ_ID

    assert_not question.valid?, 'question is valid with too short question field'

    question.errors.add(:question, :too_long)
    assert question.errors.added?(:question, :too_short), 'no validation error for question field length'
  end

  test 'invalid without quiz_id' do
    question = Question.new question: VALID_QUESTION, quiz_id: nil

    assert_not question.valid?, 'question is valid without a quiz_id'
    assert question.errors.added?(:quiz_id, :blank), 'no validation error for quiz_id present'
  end

  test 'invalid with non-existent quiz' do
    question = Question.new question: VALID_QUESTION, quiz_id: 255

    assert_not question.valid?, 'question is valid with non-existent quiz_id'
    assert question.errors.added?(:quiz, :blank), 'no validation error for non-existent quiz'
  end
end
