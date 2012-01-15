module ApplicationHelper
  def menu_link(body, url, html_options = {})
    current_options = { :class => :current }
    html_options.merge!(current_options) if current_page?(url)

    link_to body, url, html_options
  end

  def title
    I18n.t("page.info.#{params[:controller]}.#{params[:action]}")
  end

  def description
    I18n.t("page.description.#{params[:controller]}.#{params[:action]}")
  end

  def markup_to_html(markup)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true).render(markup).html_safe
  end

  def trim(text, after_lines)
    lines = text.split("\n")

    if lines.count <= after_lines
      lines.join("\n")
    else
      "#{lines[0, after_lines].join("\n")}..."
    end
  end

  def avatar_url(user)
    default_url = "#{root_url}assets/guest.png"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end
end
