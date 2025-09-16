module QuestionsHelper
  def question_header(question)
    question.persisted? ? I18n.t("helpers.questions.header.edit", test: question.test.title) : I18n.t("helpers.questions.header.new", test: question.test.title)
  end
end
