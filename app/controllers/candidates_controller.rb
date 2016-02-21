class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_candidate, only: [:accept_trigger]
  before_action :set_event, only: [:show, :create, :accept_trigger]

  respond_to :html

  def create
    @candidate = Candidate.new
    @candidate.user = current_user
    @candidate.event = @event
    @candidate.save
    redirect_to(:back)
  end

  def accept_trigger
    @candidates = Candidate.where(user_id: current_user).where(event_id: @event).order(created_at: :desc).page(params[:page])
    if !get_status.nil?
      @candidate.status = get_status
      @candidate.save
      respond_to do |format|
        format.html { redirect_to(:back) }
        format.js { render :layout => false }
      end
    end
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

    def get_status
      if params[:status] == "accept"
        status = "accepted"
      elsif params[:status] == "decline"
        status = "declined"
      end
      return status
    end 

end
