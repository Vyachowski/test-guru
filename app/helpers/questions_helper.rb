module QuestionsHelper
  def question_header(is_edit_form, test_title)
    is_edit_form ? "Edit #{test_title} Question" : "Create New #{test_title} Question"
  end
end
