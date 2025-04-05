class GroupChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_chat_#{params[:group_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end