require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  VALID_TITLE = 'Answer 1'
  VALID_RIGHT = true
  VALID_QUESTION_ID = 1

  test 'valid answer' do
    answer = Answer.new title: VALID_TITLE,
                        right: VALID_RIGHT,
                        question_id: VALID_QUESTION_ID

    assert answer.valid?, 'answer is invalid'
  end

  test 'invalid without title' do
    answer = Answer.new title: nil,
                        right: VALID_RIGHT,
                        question_id: VALID_QUESTION_ID

    assert_not answer.valid?, 'answer is valid without title'
    assert answer.errors.added?(:title, :blank), 'no validation error for answer title present'
  end

  test 'invalid without question_id' do
    answer = Answer.new title: VALID_TITLE,
                        right: VALID_RIGHT,
                        question_id: nil

    assert_not answer.valid?, 'answer is valid without question_id'
    assert answer.errors.added?(:question_id, :blank), 'no validation error for question_id present'
  end

  test 'invalid with non-existent question' do
    answer = Answer.new title: VALID_TITLE,
                        right: VALID_RIGHT,
                        question_id: 255

    assert_not answer.valid? 'answer is valid with non-existent question'
    assert answer.errors.added?(:question, :blank), 'no validation error for non-existent question'
  end
end
