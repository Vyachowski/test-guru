module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo.tr("-", " ").titleize, "https://github.com/#{author}/#{repo}", target: "_blank", rel: "noopener"
  end
end
