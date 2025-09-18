class Gist < ApplicationRecord
  belongs_to :user

  validates :question, presence: true
  validate :url, presence: true
end
