require "test_helper"

class QuestionHashtagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_hashtag = question_hashtags(:one)
  end

  test "should get index" do
    get question_hashtags_url
    assert_response :success
  end

  test "should get new" do
    get new_question_hashtag_url
    assert_response :success
  end

  test "should create question_hashtag" do
    assert_difference("QuestionHashtag.count") do
      post question_hashtags_url, params: { question_hashtag: {  } }
    end

    assert_redirected_to question_hashtag_url(QuestionHashtag.last)
  end

  test "should show question_hashtag" do
    get question_hashtag_url(@question_hashtag)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_hashtag_url(@question_hashtag)
    assert_response :success
  end

  test "should update question_hashtag" do
    patch question_hashtag_url(@question_hashtag), params: { question_hashtag: {  } }
    assert_redirected_to question_hashtag_url(@question_hashtag)
  end

  test "should destroy question_hashtag" do
    assert_difference("QuestionHashtag.count", -1) do
      delete question_hashtag_url(@question_hashtag)
    end

    assert_redirected_to question_hashtags_url
  end
end
