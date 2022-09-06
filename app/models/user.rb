class User < ApplicationRecord
  has_secure_password

  include Gravtastic

  gravtastic(secure: true, filetype: :png, size: 100, default: 'retro')

  @@DEFAULT_HEADER_COLOR = '#0BA5BE'

  has_many :questions, dependent: :delete_all

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { in: 3..40 },
            format: { with: /\A[\w]+\z/ }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  #validates :header_color, format: { with: /\A(#FFF[0-9a-fA-f]{0,3})|(#0edab9)|(#0EDAB9)\z/ }

  def self.DEFAULT_HEADER_COLOR
    @@DEFAULT_HEADER_COLOR
  end

  private

  def downcase_nickname
    nickname.downcase! unless nickname.nil?
  end
end
