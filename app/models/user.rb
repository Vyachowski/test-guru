class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise_modules = [
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable
  ]

  devise_modules << :confirmable unless Rails.env.production?

  devise(*devise_modules)

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :created_tests, class_name: "Test", foreign_key: :creator_id, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX, message: "невалидный формат" }
  validates :password, confirmation: true

  def tests_by_difficulty(difficulty_level)
    tests.where(level: difficulty_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
