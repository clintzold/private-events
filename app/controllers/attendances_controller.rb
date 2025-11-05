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
    @event = Event.find(params[:event_id])
    @attendance = Attendance.find(params[:attendance_id])
    @attendance.destroy
    redirect_to @event, notice: "You have been successfully removed from the list!"
  end
end
