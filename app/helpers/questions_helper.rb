module QuestionsHelper
  def question_header(question)
    question.persisted? ? "Отредактируйте вопрос к тесту #{question.test.title}" : "Добавьте вопрос к тесту #{question.test.title}"
  end
end
