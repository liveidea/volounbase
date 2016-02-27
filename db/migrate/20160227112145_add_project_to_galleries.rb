class AddProjectToGalleries < ActiveRecord::Migration
  def change
  	add_column :galleries, :project_id, :integer
  end
end
