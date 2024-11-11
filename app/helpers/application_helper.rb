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

  def flash_messages
    unless flash.empty?
      flash.map do |type, message|
        next if message.blank?
        content_tag :p, message, class: "flash #{type}"
      end.join.html_safe
    end
  end
end
