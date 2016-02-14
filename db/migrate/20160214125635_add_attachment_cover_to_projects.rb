class AddAttachmentCoverToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :projects, :cover
  end
end
