class AddPairingCodeToTeam < ActiveRecord::Migration[8.1]
  def change
    add_column :teams, :pairing_code, :string
  end
end
