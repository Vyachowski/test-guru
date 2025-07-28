module QuestionsHelper
  def question_header(test_title, is_edit_form = false)
    is_edit_form ? "Отредактируйте вопрос к тесту #{@test.title}" : "Добавьте вопрос к тесту #{@test.title}"
  end
end
