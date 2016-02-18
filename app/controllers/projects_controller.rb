class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @projects = Project.all.order(:created_at).page(params[:page])
    respond_with(@projects)
  end

  # User owner list
  def list
    @projects = Project.where(user:current_user).order(:created_at).page(params[:page])
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    @project.events.build
    respond_with(@project)
  end

  def edit
    @new_events = Project.new
    @project = Project.find(params[:id])
    @project.events.build
    respond_with(@project)
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:id, :title, :description, :cover,
                                      events_attributes: [:id, :note, :start_date, :end_date, :status, :_destroy])
    end
end