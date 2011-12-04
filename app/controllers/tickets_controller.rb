class TicketsController < InheritedResources::Base

  def index
    index! do
      @tickets = Ticket.not_completed
    end
  end

  def create
    create! do |success, failure|
      failure.html { render :action => "new" }
      success.html { redirect_to_ticket }
    end
  end

  def update
    update! do |success, failure|
      event = params[:actions][:event]
      @ticket.fire_state_event(event.to_sym) unless event.empty?

      success.html { redirect_to_ticket }

      failure.html { @ticket = params[:ticket] }
    end
  end

  private
  def redirect_to_ticket
    redirect_to edit_ticket_url(@ticket)
  end
end
