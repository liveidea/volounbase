class GalleriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :edit, :create, :update, :destroy]

  respond_to :html

  def new
    @gallery = Gallery.new
    respond_with(@project, @gallery)
  end

  def edit
    respond_with(@project, @gallery)
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.project = @project
    if @gallery.save
      redirect_to [:edit, @project, @gallery], notice: 'Gallery was successfully created.'
    else
      render :new
    end
  end

  def update
    @gallery.update(gallery_params)
    render :edit
  end

  def destroy
    @gallery.destroy
    redirect_to(:back)
  end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end    

    def set_project
      @project = Project.find(params[:project_id])
    end

    def gallery_params
      params.require(:gallery).permit(:title, :description)
    end    
end
