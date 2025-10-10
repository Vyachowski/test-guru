class TestPassage < ApplicationRecord
  TEST_THRESHOLD = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create

  def timed?
    test.timer.present?
  end

  def time_left
    return nil unless timed?

    time_passed = Time.current - created_at
    total_time = test.timer.minutes
    remaining = total_time - time_passed
    remaining.positive? ? remaining : 0
  end

  def expired?
    timed? && time_left <= 0
  end

  def expire!
    update!(timed_out: true)
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  def current_question_number
    test.questions.order(:id).pluck(:id).index(current_question.id) + 1
  end

  def successful?
    correct_answer_percentage >= TEST_THRESHOLD.round(1)
  end

  def correct_answer_percentage
    (correct_questions.to_f / test.questions.count) * 100
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where("id > ?", current_question.id).first
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end
end
