class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_group, only: [:show]

  def index
    @groups = current_user.groups
  end

  def show
    @group = Group.find(params[:id])
    @events = @group.events.order(date: :asc)
    @messages = @group.messages.order(created_at: :asc)
    @message = Message.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.creator = current_user
    if @group.save
      Membership.create(user: current_user, group: @group, accepted: true) # Auto-join creator
      redirect_to @group, notice: "Group created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def authorize_group
    @group = Group.find(params[:id])
    unless @group.members.include?(current_user) || @group.creator == current_user
      redirect_to groups_path, alert: "You’re not a member of this group."
    end
  end
end