class Feedback
  include ActiveModel::Model
  attr_accessor :name, :email, :body

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :body, presence: true
end
