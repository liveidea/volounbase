class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:edit, :update, :destroy]
  before_action :set_project, only: [:new, :edit,:create, :update, :destroy]

  respond_to :html

  def new
    @event = Event.new
    respond_with(@project, @event)
  end

  def edit
    respond_with(@project, @event)
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to [:edit, @project, @event]
  end

  def update
    @event.update(event_params)
    redirect_to [:edit, @project, @event]
  end

  def destroy
    @event.destroy
    redirect_to orders_path
  end

  private
    def set_event
        @event = Event.find(params[:id])
    end

    def set_project
        @project = Project.find(params[:project_id])
    end

    def event_params
      params.require(:event).permit(:note, :start_date, :end_date)
    end

end
