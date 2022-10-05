class Hashtag < ApplicationRecord
  has_many :question_hashtags
  has_many :questions, through: :question_hashtags, source: :question

  validates :body, presence: true, uniqueness: true
end
