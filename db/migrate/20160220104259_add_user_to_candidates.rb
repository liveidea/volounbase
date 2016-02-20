class AddUserToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :user_id, :integer
  end
end
