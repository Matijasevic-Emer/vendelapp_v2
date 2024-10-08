class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true,
            uniqueness: true,
            format: {
              with: URI::MailTo::EMAIL_REGEXP,
              message: :invalid
            }
  validates :username, presence: true,
            uniqueness: true,
            length: { in: 3..15},
            format: {
              with: /\A[a-z0-9A-Z]+\z/,
              message: :invalid
            }
  validates :password,
            length: {minimum: 6}
  before_save :downcase_attributes

  has_many :products, dependent: :destroy
  has_many :favorites, dependent: :destroy


  private
  def downcase_attributes
    self.username = username.downcase
    self.email = email.downcase

  end

end
