class AddStatusToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :is_accepted, :string
  end
end
