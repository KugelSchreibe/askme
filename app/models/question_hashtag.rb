class QuestionHashtag < ApplicationRecord
  belongs_to :question, optional: true
  belongs_to :hashtag
end
