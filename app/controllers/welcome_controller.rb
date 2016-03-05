class WelcomeController < ApplicationController
  def index
    @projects = Project.limit(3).order(created_at: :desc)

  	@events = Event.order(created_at: :desc).limit(20)

  	# Volounteers !where user have status volounteer or joined to the Project
  	@volounteers = Candidate.where(status:"active").limit(8)
  end
end
