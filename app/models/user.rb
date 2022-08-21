class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { in: 3..40 },
            format: { with: /\A[a-zA-Z_0-9]+\z/ }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def downcase_nickname
    nickname.downcase!
  end
end
