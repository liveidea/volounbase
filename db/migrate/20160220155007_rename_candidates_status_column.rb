class RenameCandidatesStatusColumn < ActiveRecord::Migration
  def change
    rename_column :candidates, :is_accepted, :status
  end
end
