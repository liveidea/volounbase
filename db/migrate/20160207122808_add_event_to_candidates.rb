class AddEventToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :event_id, :integer
  end
end
