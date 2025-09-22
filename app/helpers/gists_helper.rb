module GistsHelper
  def gist_question_text(question)
    "#{question.slice(0, 25)}..."
  end

  def gist_url_text(url)
    url.split("/")[-1]
  end

  def safe_link_to(text, url)
    uri = URI.parse(url)
    return text unless %w[http https].include?(uri.scheme)
    link_to text, url, target: "_blank", rel: "noopener"
  rescue URI::InvalidURIError
    text
  end
end
