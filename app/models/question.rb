class Question < ApplicationRecord
  validates :body, presence: true, length: { in: 3..280 }

  belongs_to :user
end
