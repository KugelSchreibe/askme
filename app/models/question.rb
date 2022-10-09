class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags, source: :hashtag

  validates :body, presence: true, length: { in: 3..280 }

  after_create_commit :create_all_hashtags

  private

  def create_all_hashtags
    self.hashtags = body.scan(/#[\wА-Яа-яЁё]+/).map { |tag| Hashtag.create_or_find_by(body: tag[1..-1]) }
  end
end
