class User < ApplicationRecord
  has_secure_password

  has_many :questions, dependent: :delete_all

  before_validation :downcase_nickname

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true, length: { in: 3..40 },
            format: { with: /\A[\w]+\z/ }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :header_color, inclusion: { in: ['#0BA5BE', '#F57900', '#CC0000'] }

  @@DEFAULT_HEADER_COLOR = '#0BA5BE'

  @@AVAILABLE_COLORS = [
    ['По умолчанию', @@DEFAULT_HEADER_COLOR],
    ['Оранжевый', '#F57900'],
    ['Красный', '#CC0000'],
  ]

  def self.AVAILABLE_COLORS
    @@AVAILABLE_COLORS
  end

  def self.DEFAULT_HEADER_COLOR
    @@DEFAULT_HEADER_COLOR
  end

  def downcase_nickname
    nickname.downcase!
  end
end
