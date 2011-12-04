class CommentsController < InheritedResources::Base
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = User.find(session[:user_id])

    create! do |success, failure|
      success.html do
        redirect_to ticket_path(@comment.ticket), :notice => "Your comment has beend saved."
      end
    end
  end
end
