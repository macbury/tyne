class TicketsController < InheritedResources::Base

  def index
    index! do
      @tickets = Ticket.not_completed
    end
  end

  def show
    show! do
      @comment = Comment.new({ :ticket => @ticket })
    end
  end

  def update
    update! do |success, failure|
      event = params[:actions][:event]
      @ticket.fire_state_event(event.to_sym) unless event.empty?

      success.html { redirect_to @ticket }

      failure.html { @ticket = params[:ticket] }
    end
  end
end
