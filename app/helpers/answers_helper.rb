module AnswersHelper
  def answer_header(asnwer)
    asnwer.persisted? ? "Отредактируйте ответ к вопросу \"#{asnwer.question.body}\"" : "Добавьте ответ к вопросу \"#{answer.question.body}\""
  end
end
