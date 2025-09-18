module GistsHelper
  def gist_question_text(question)
    question.slice(0, 25) + "..."
  end

  def gist_url_text(url)
    url.split("/")[-1]
  end
end
