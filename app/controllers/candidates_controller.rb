class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_candidate, only: [:update, :destroy, :accept_trigger]
  before_action :set_event, only: [:show, :create]

  respond_to :html

  def create
    @candidate = Candidate.new
    @candidate.user = current_user
    @candidate.event = @event
    @candidate.save
    redirect_to(:back)
  end

  def update
    @candidate.update(candidate_params)
    respond_with(@candidate)
  end

  def accept_trigger
    @candidate.update(candidate_params)
    respond_with(@candidate)
  end

  def destroy
    @candidate.destroy
    redirect_to(:back)
  end

  def show
    @candidates = Candidate.where(user_id: current_user).where(event_id: @event)
    respond_with(@candidate, @event)
  end

  private

    def set_event
        @event = Event.find(params[:event_id])
    end

    def set_candidate
        @candidate = Candidate.find(params[:id])
    end

    def candidate_params
      params.require(:candidate).permit(:id, :event_id, :is_accepted)
    end

end
