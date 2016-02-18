class WelcomeController < ApplicationController
  def index
  	@projects = Project.limit(3).order(:created_at)

  	# Volounteers !where user have status volounteer or joined to the Project
  	@volounteers = User.limit(8)
  end
end
