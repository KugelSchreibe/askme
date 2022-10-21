class HashtagsController < ApplicationController
  def show
    @hashtag = params[:hashtag]
    @questions = Question.joins(:hashtags).where(hashtags: { body: @hashtag}).order(created_at: :desc)
  end
end
