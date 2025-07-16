class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validate :validate_answers_limit

  private

  def validate_answers_limit
    size = answers.reject(&:marked_for_destruction?).size

    if size < 1
      errors.add(:answers, "should have at least one answer")
    elsif size > 4
      errors.add(:answers, "cannot have more than 4 answers")
    end
  end
end
