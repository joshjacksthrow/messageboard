require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
    @answer = answers(:one)
  end

  test "should get new" do
    get new_question_answer_url(@question)
    assert_response :success
  end

  test "should create answer" do
    assert_difference("Answer.count") do
      post question_answers_url(@question), params: { answer: { body: "Lorem ipsum test test some text here that meets requirement of length" } }
    end

    assert_redirected_to question_url(@question)
  end

  test "should destroy answer" do
    assert_difference("Answer.count", -1) do
      delete question_answer_url(@question, @answer)
    end

    assert_redirected_to question_url(@question)
  end
end
