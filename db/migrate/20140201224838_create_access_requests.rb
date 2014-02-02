class CreateAccessRequests < ActiveRecord::Migration
  def change
    create_table :access_requests do |t|
      t.string :user
      t.text :reason
      t.boolean :approved
      t.boolean :denied

      t.timestamps
    end
  end
end
