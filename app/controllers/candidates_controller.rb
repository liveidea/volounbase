class CandidatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_candidate, only: [:create, :update, :destroy]

  respond_to :html

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user = current_user
    @candidate.save
  end

  def update
    @candidate.update(candidate_params)
  end

  def destroy
    @candidate.destroy
  end

  private

    def set_candidate
        @candidate = Candidate.find(params[:id])
    end

    def candidate_params
      params.require(:candidate).permit(:id, :event_id)
    end

end
