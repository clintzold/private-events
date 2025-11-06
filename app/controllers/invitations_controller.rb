class InvitationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @event_id = params[:event_id]
    puts @event_id
    @users = params[:invitee_ids]
    @users.each do |user|
      next if user == ""  # First entry in array returned by form is always an empty String
      @invitation = Invitation.new(invited_to_id: @event_id, invitee_id: user)
      @invitation.save
    end
    redirect_to my_events_path, notice: "Invitations sent!"
  end

  def new_invite_list
    @event = Event.find(params[:event_id])
    @users = []
    User.all.each do |user|
      if user.attended_events.exists?(@event.id)
        next
      else
        @users << user
      end
    end
    @invitation = Invitation.new
  end

  def destroy
    @user = current_user
    @event_id = params[:event_id]
    @invitation = Invitation.find_by(invitee_id: @user.id, invited_to_id: @event_id)
    @invitation.destroy
    redirect_to my_events_path, notice: "Invitation declined!"
  end

  private
end
