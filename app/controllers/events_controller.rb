class EventsController < ApplicationController
  before_action :event_params, only: [ :create ]
  before_action :authenticate_user!, only: [ :show, :new, :create ]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.expect(event: [ :location, :date ])
  end
end
