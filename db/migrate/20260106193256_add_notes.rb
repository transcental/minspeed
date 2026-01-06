class AddNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :notes do |t|
      t.timestamps
      t.string :team_id
      t.string :note
    end
  end
end
