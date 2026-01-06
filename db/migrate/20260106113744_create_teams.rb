class CreateTeams < ActiveRecord::Migration[8.1]
  def change
    create_table :teams do |t|
      t.timestamps
      t.string :team_id
      t.string :name
      t.references :user
    end
  end
end
