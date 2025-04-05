class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @created_groups = @user.created_groups # Or @user.groups for joined groups
  end
end