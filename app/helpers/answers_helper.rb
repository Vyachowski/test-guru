module AnswersHelper
  def answer_header(answer)
    answer.persisted? ? I18n.t("helpers.answers.header.edit", question: answer.question.body) : I18n.t("helpers.answers.header.new", question: answer.question.body)
  end
end
