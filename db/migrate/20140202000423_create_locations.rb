class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :owner
      t.decimal :lat
      t.decimal :long
      t.text :description

      t.timestamps
    end
  end
end
