class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.string :property_type
      t.timestamp :year_built
      t.string :energy_type
      t.float :property_value

      t.timestamps
    end
  end
end
