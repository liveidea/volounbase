class WelcomeController < ApplicationController
  def index
  	@projects = Project.limit(3)

  	# Volounteers !where user have status volounteer
  	@volounteers = User.limit(8)
  end
end
