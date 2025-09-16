module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo, classNames)
    link_to repo.tr("-", " ").titleize, "https://github.com/#{author}/#{repo}", target: "_blank", rel: "noopener", class: classNames
  end

  def flash_message(type)
    if flash[type].present?
      content_tag :p, flash[type], class: "flash #{type}"
    end
  end

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :notice
      "alert alert-success"
    when :alert
      "alert alert-danger"
    when :error
      "alert alert-danger"
    else
      "alert alert-primary"
    end
  end
end
