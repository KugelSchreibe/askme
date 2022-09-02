class User < ApplicationRecord
  has_secure_password

  has_many :questions, dependent: :destroy

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { in: 3..40 },
            format: { with: /\A[\w]+\z/ }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :header_color, comparison: { other_than: "#ffffff" }

  @@DEFAULT_HEADER_COLOR = '#0BA5BE'

  def self.DEFAULT_HEADER_COLOR
    @@DEFAULT_HEADER_COLOR
  end

  def downcase_nickname
    nickname.downcase!
  end
end
