class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_candidate, only: [:accept_trigger, :decline_trigger]
  before_action :set_event, only: [:show, :create]

  respond_to :html

  def create
    @candidate = Candidate.new
    @candidate.user = current_user
    @candidate.event = @event
    @candidate.save
    redirect_to(:back)
  end

  def accept_trigger
    @candidate.status = "accepted"
    @candidate.save
    redirect_to(:back)
  end

  def decline_trigger
    @candidate.status = "declined"
    @candidate.save
    redirect_to(:back)
  end

  def show
    @candidates = Candidate.where(user_id: current_user).where(event_id: @event).order(created_at: :desc).page(params[:page])
    respond_with(@candidate, @event)
  end

  private

    def set_event
        @event = Event.find(params[:event_id])
    end

    def set_candidate
        @candidate = Candidate.find(params[:id])
    end

end
