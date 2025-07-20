class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_limit

  scope :correct, -> { where(correct: true) }

  private

    def validate_answers_limit
      return unless question

      current_answers = question.answers.reject do |a|
        a.marked_for_destruction? || a == self
      end

      total = current_answers.size + (new_record? ? 1 : 0)

      if total > 4
        errors.add(:base, "A question cannot have more than 4 answers")
      elsif total < 1
        errors.add(:base, "A question must have at least one answer")
      end
    end
end
