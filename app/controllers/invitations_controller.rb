class InvitationsController < ApplicationController
  def create
    @event_id = params[:invited_to_id]
    @users = params[:invitee_ids]

    @users.each do |user|
      next if user == ""
      @invitation = Invitation.new(invited_to_id: @event_id, invitee_id: user)
      if @invitation.save
        next
      end
    end
    redirect_to my_events_path
  end

  def new_invite_list
    @events = current_user.events
    @invitation = Invitation.new
  end
end
