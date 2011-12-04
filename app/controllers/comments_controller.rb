class CommentsController < InheritedResources::Base
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = User.find(session[:user_id])

    create! do |success, failure|
      success.html do
        redirect_to ticket_path(@comment.ticket), :notice => "Your comment has beend saved."
      end

      failure.html do
        url = tickets_path
        url = ticket_path(@comment.ticket) if @comment.ticket

        flash[:error] = "Could not save your comment, sorry..."

        redirect_to url
      end
    end
  end
end
