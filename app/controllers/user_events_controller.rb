class UserEventsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])

    user_event = UserEvent.new(event: @event, user: current_user)

    if user_event.save
      redirect_to events_path, notice: "Susbcribed successfully"
    else
      redirect_to events_path, alert: "Error"
    end
  end
end