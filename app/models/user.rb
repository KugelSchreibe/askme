class User < ApplicationRecord
  include Gravtastic

  has_many :questions, dependent: :delete_all

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :nickname, presence: true, uniqueness: true, length: { in: 3..40 },
            format: { with: /\A[\w]+\z/ }
  validates :header_color, format: { with: /\A#\h{3}{1,2}\z/ }
  validates :name, presence: true, length: { in: 2..15 }

  has_secure_password
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')
  
  private

  def downcase_nickname
    nickname&.downcase!
  end
end
