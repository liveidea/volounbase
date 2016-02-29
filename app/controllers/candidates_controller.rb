class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_candidate, only: [:accept_trigger, :destroy]
  before_action :set_event, only: [:show, :create, :accept_trigger, :destroy]

  respond_to :html

  def create
    @candidate = Candidate.new
    @candidate.user = current_user
    @candidate.event = @event
    @candidate.status = "waiting"
    @candidate.save

    # To organizer
    @organizer = @event.project.user
    UserNotifier.new_user_register_to_event(@organizer, @event.project).deliver_now

    # To volounteer
    UserNotifier.register_to_event(@candidate.user, @event.project).deliver_now
    redirect_to(:back)
  end

  def destroy
    @candidate.destroy
    redirect_to(:back)
  end

  def accept_trigger
    @candidates = Candidate.where(event_id: @event).order(created_at: :desc).page(params[:page])
    if !get_status.nil?
      @candidate.status = get_status
      @candidate.save

      respond_to do |format|
        format.html { redirect_to(:back) }
        format.js { render :layout => false }
      end

      # Send mail # To volounteer
      if get_status == 'accepted'
        UserNotifier.accept_user_register_to_event(@candidate.user, @event.project).deliver_now
      elsif get_status == "declined"
        UserNotifier.decline_user_register_to_event(@candidate.user, @event.project).deliver_now
      end      
    end
  end

  def show
    @candidates = Candidate.where(event_id: @event).order(created_at: :desc).page(params[:page])
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
