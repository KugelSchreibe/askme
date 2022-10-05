require "application_system_test_case"

class QuestionHashtagsTest < ApplicationSystemTestCase
  setup do
    @question_hashtag = question_hashtags(:one)
  end

  test "visiting the index" do
    visit question_hashtags_url
    assert_selector "h1", text: "Question hashtags"
  end

  test "should create question hashtag" do
    visit question_hashtags_url
    click_on "New question hashtag"

    click_on "Create Question hashtag"

    assert_text "Question hashtag was successfully created"
    click_on "Back"
  end

  test "should update Question hashtag" do
    visit question_hashtag_url(@question_hashtag)
    click_on "Edit this question hashtag", match: :first

    click_on "Update Question hashtag"

    assert_text "Question hashtag was successfully updated"
    click_on "Back"
  end

  test "should destroy Question hashtag" do
    visit question_hashtag_url(@question_hashtag)
    click_on "Destroy this question hashtag", match: :first

    assert_text "Question hashtag was successfully destroyed"
  end
end
