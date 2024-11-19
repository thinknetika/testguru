module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_path(author, repo)
    link_to "Github", "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def school_path
    link_to "Thinknetika", "https://thinknetica.com//", target: "_blank"
  end

  def bootstrap_flash_class(key)
    case key.to_sym
    when :notice
      "alert-success"
    when :alert, :error
      "alert-danger"
    when :warning
      "alert-warning"
    when :info
      "alert-info"
    end
  end
end
