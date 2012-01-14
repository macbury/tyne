class UsersController < InheritedResources::Base
  actions :edit, :update

  def edit
    @user = current_user

    edit!
  end
end
