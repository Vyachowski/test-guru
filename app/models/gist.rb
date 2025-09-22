class Gist < ApplicationRecord
  belongs_to :user

  validates :question, presence: true
  validates :url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
end
