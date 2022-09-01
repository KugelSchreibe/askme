class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { in: 3..40 },
            format: { with: /\A[\w_]+\z/ }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :header_color, comparison: { other_than: "#ffffff", message: "Выберите более тёмный цвет шапки" }

  def downcase_nickname
    nickname.downcase!
  end
end
