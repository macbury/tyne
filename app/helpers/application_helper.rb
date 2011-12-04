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

  def textile_to_html(textile)
    RedCloth.new(textile).to_html.html_safe
  end

  def trim(text, after_lines)
    lines = text.split("\n")

    if lines.count <= after_lines
      lines.join("\n")
    else
      "#{lines[0, after_lines].join("\n")}..."
    end
  end
end
