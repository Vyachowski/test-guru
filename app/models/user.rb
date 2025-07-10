class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: :creator_id
  has_many :tests, through: :tests_passages

  def tests_by_difficulty(difficulty_level)
    tests.where(level: difficulty_level)
  end
end
