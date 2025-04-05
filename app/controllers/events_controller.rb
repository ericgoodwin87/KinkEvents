class EventsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @event = @group.events.build
  end

  def create
    @group = Group.find(params[:group_id])
    @event = @group.events.build(event_params)
    @event.creator = current_user
    if @event.save
      redirect_to group_path(@group), notice: "Event created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end
end
