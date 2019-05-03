class CreateEnergyRecordings < ActiveRecord::Migration[5.2]
  def change
    create_table :energy_recordings do |t|
      t.timestamp :time_recorded
      t.integer :units
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
