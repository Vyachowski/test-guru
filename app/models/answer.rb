class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_limit, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_limit
    return unless question

    if question.answers.count >= 4
      errors.add(:base, "A question cannot have more than 4 answers")
    end
  end
end
