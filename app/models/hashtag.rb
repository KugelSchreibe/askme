class Hashtag < ApplicationRecord
  has_many :question_hashtags
  has_many :questions, through: :question_hashtags, source: :question

  validates :body, presence: true, uniqueness: true

  before_save :to_downcase

  private

  def to_downcase
    body&.downcase!
  end
end
