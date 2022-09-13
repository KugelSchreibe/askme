class User < ApplicationRecord
  include Gravtastic

  has_many :questions, dependent: :delete_all

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { in: 3..40 },
            format: { with: /\A[\w]+\z/ }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :header_color, format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/ }

  has_secure_password
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')
  
  private

  def downcase_nickname
    nickname.try(:downcase!)
  end
end
