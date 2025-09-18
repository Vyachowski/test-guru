class Gist < ApplicationRecord
  belongs_to :user

  validates :question, presence: true
  validates :url, presence: true
end
