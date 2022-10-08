module QuestionsHelper
  def all_hashtags(text)
    text.scan(/#[\wА-Яа-яЁё]+/).map { |tag| tag[1..-1].downcase }
  end

  def fhashtag(hashtag)
    "##{hashtag}"
  end

  def questions_hashtag_path(hashtag)
    "/hashtags/#{hashtag}"
  end
end
