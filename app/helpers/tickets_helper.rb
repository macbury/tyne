module TicketsHelper
  def due_tag(due_date)
    today = due_date.today?
    tags = ["tag"]
    tags << "today" if today

    display_text = due_date.today? ? "today" : due_date

    %(<span class="#{tags.join(" ")}" title="Fixit: #{due_date}">#{display_text}</span>).html_safe
  end

  def type_tag(type)
    tags = ["tag", type.name.downcase.gsub(" ", "_")]
    display_text = type.name

    %(<span class="#{tags.join(" ")}" title="Type: #{display_text}">#{display_text}</span>).html_safe
  end

  def state_tag(ticket)
    tags = ["tag", ticket.state]
    display_text = ticket.state

    %(<span class="#{tags.join(" ")}" title="Type: #{display_text}">#{display_text}</span>).html_safe
  end
end
