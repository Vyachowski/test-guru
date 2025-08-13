class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: :creator_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, presence: true
  validates :password, confirmation: true

  has_secure_password

  def tests_by_difficulty(difficulty_level)
    tests.where(level: difficulty_level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
