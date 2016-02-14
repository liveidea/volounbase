class WelcomeController < ApplicationController
  def index
  	@projects = Project.limit(3)
  end
end
