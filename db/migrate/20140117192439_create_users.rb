class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.integer :role, :default => 0

      t.timestamps
    end
  end
end
