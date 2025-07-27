module QuestionsHelper
  def question_header(question_title, is_edit_form)
    is_edit_form ? "Edit #{question_title} Question" : "Create New #{question_title} Question"
  end
end
