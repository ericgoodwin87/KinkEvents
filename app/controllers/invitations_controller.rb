class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:new, :create]

  def new
    @invitation = Membership.new
  end

  def create
    @invitation = Membership.new(invitation_params)
    @invitation.group = @group
    @invitation.accepted = false
    if @invitation.save
      redirect_to @group, notice: "Invitation sent!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @membership = Membership.find(params[:id])
    if @membership.user == current_user && @membership.update(accepted: true)
      redirect_to @membership.group, notice: "Invitation accepted!"
    else
      redirect_to groups_path, alert: "Couldn’t accept invitation."
    end
  end

  private

  def set_group
    @group = Group.find(params[:group_id])
    redirect_to groups_path, alert: "Not authorized." unless @group.creator == current_user
  end

  def invitation_params
    params.require(:membership).permit(:user_id)
  end
end