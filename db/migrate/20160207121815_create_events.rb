class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :note
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
