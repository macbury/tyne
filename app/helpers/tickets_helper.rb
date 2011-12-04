module TicketsHelper
  def due_tag(due_date)
    today = due_date.today?
    tags = ["tag"]
    tags << "today" if today

    display_text = due_date.today? ? "today" : due_date

    %(<span class="#{tags.join(" ")}" title="Fixit: #{due_date}">#{display_text}</span>).html_safe
  end
end
