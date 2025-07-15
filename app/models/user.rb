class User < ApplicationRecord
  has_many :created_tests, class_name: "Test", foreign_key: :creator_id, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
end
