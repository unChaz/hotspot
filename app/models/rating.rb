class Rating < ActiveRecord::Base
  def set_rating rating
    self.rating = rating
  end
end
