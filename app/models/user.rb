class User < ApplicationRecord
  include Gravtastic

  has_many :questions, dependent: :delete_all

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { in: 3..40 },
            format: { with: /\A[\w]+\z/ }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :header_color, format: { with: /\A#(\h{3}){1,2}\z/ }

  has_secure_password
  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')
  
  private

  def downcase_nickname
    nickname&.downcase!
  end
end
