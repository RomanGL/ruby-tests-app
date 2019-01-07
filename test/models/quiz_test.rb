require 'test_helper'

class QuizTest < ActiveSupport::TestCase

  VALID_TITLE = 'Quiz title'
  VALID_DESCRIPTION = 'Quiz description'

  test 'valid quiz' do
    quiz = Quiz.new title: VALID_TITLE, description: VALID_DESCRIPTION
    assert quiz.valid?, 'quiz is invalid'
  end

  test 'invalid with too short title' do
    quiz = Quiz.new title: '1234', description: VALID_DESCRIPTION

    assert_not quiz.valid?, 'quiz is valid with too short title'
    assert quiz.errors.added?(:title, :too_short), 'no validation error for too short title'
  end

  test 'invalid with too short description' do
    quiz = Quiz.new title: VALID_TITLE, description: '1234'

    assert_not quiz.valid?, 'quiz is valid with too short description'
    assert quiz.errors.added?(:description, :too_short), 'no validation error for too short description'
  end

  test 'invalid with too long description' do
    # generating too large description
    too_long_description = '1'
    100.times { too_long_description = too_long_description + 'ten length' }
    # description length is 1 + 100 * 10 = 1001

    quiz = Quiz.new title: VALID_TITLE, description: too_long_description

    assert_not quiz.valid?, 'quiz is valid with too long description'
    assert quiz.errors.added?(:description, :too_long), 'no validation error for too long description'
  end
end
