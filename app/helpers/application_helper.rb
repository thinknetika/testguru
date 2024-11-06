module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_path
    link_to "Github", "https://github.com/thinknetika/", target: "_blank"
  end

  def school_path
    link_to "Thinknetika", "https://thinknetica.com//", target: "_blank"
  end
end
