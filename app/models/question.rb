class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags, source: :hashtag

  validates :body, presence: true, length: { in: 3..280 }

  after_save :create_all_hashtags

  private

  def create_all_hashtags
    hashtags_body = body.scan(/#[\wА-Яа-яЁё]+/).map { |tag| tag[1..-1].downcase }

    hashtags_body.each do |tag|
      if Hashtag.find_by(body: tag).nil?
        hashtag = Hashtag.create(body: tag)
        QuestionHashtag.create(question_id: id, hashtag_id: hashtag.id)
      else
        QuestionHashtag.create(question_id: id, hashtag_id: Hashtag.find_by(body: tag).id)
      end
    end
  end
end
