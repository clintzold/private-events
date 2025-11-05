class AttendancesController < ApplicationController
  before_action :authenticate_user!
  def join
    @event = Event.find(params[:event_id])
    @attendance = current_user.attendances.new(attended_event_id: @event.id)
    if @attendance.save
      redirect_to @event, notice: "You're on the list. See you at #{@event.location}!"
    else
      render @event, notice: "Sorry, there was an error!"
    end
  end

  def leave
  end
end
