class GalleriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  before_action :set_project, only: [:new, :edit, :create, :update, :destroy]
  attr_accessor :images
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

    respond_to do |format|
      if @gallery.save
       
        if params[:images]
          params[:images].each { |image|
            @gallery.photos.create(image: image)
          }
        end

        format.html { redirect_to [:edit, @project, @gallery], notice: 'Gallery was successfully created.'}
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
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
