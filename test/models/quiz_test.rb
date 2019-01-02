require 'test_helper'
require_relative '../../app/models/quiz'

class QuizTest < ActiveSupport::TestCase
  
  test "should not save quiz without title" do
    quiz = Quiz.new do |q|
      q.title = nil
      q.description = "Description"
    end
    assert_not quiz.save, "Saved the quiz without a title"
  end

  test "should not save quiz with title length less than 5" do
    quiz = Quiz.new do |q|
      q.title = "1234"
      q.description = "Description"
    end
    assert_not quiz.save, "Saved the quiz with title length less than 5"
  end

  test "should not save quiz without description" do
    quiz = Quiz.new do |q|
      q.title = "Title"
      q.description = nil
    end

    assert_not quiz.save, "Saves quiz without description"
  end

  test "should not save quiz with desciption length less than 5" do
    quiz = Quiz.new do |q|
      q.title = "Title"
      q.description = "1234"
    end

    assert_not quiz.save, "Saved quiz with description length less than 5"
  end

  test "should not save quiz with description length greater than 1000" do
    description = "1"
    100.times { description = description + "ten length" }
    # description length is 1 + 100 * 10 = 1001

    quiz = Quiz.new do |q|
      q.title = "Title"
      q.description = description
    end   

    assert_not quiz.save, "Saved quiz with description length greater than 1000"
  end
end
