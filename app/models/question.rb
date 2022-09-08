class Question < ApplicationRecord
  validates :body, presence: true, length: { in: 3..280 }

  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true
end
