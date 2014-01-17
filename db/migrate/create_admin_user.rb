class AddInitialProducts < ActiveRecord::Migration
  def up
    chaz = User.where(:name => "Chaz Ferguson")
    joey = User.where(:name => "Joey Hale")

    if chaz
      chaz.role = 2
      chaz.save
    end
    if joey
      joey.role = 2
      joey.save
    end
  end
 
  def down

  end
end