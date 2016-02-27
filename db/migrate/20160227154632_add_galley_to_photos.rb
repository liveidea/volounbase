class AddGalleyToPhotos < ActiveRecord::Migration
  def change
  	add_column :photos, :galley_id, :integer
  end
end
