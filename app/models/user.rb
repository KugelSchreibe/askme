class User < ApplicationRecord
  has_secure_password

  after_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { in: 3..40 },
            format: { with: /\A[\w\d_]+\z/ }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def downcase_nickname
    nickname.downcase!
  end
end
