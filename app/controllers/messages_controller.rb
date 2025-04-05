class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @group = Group.find(params[:group_id])
    @message = @group.messages.build(message_params)
    @message.user = current_user
    respond_to do |format|
      if @message.save
        ActionCable.server.broadcast("group_chat_#{@group.id}", { content: @message.content, user: @message.user.name })
        format.turbo_stream { head :no_content } # Let Action Cable handle UI update
        format.html { redirect_to group_path(@group), notice: "Message sent!" }
      else
        format.html { redirect_to group_path(@group), alert: "Message failed to send." }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end