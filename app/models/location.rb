class Location < ActiveRecord::Base
  has_attached_file :image1, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image2, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image2, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image3, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image3, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image4, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image4, :content_type => /\Aimage\/.*\Z/
  
  def get_rating
    ratings = Rating.find(:all, :conditions => {:location_id => self.id})

    total = 0.0
    amount = 0.0
    ratings.each do |rating|
      amount += 1
      total += rating.rating
    end
    if amount > 0
      return total/amount
    else
      return 0
    end 
  end

  def has_rated user_id
    rating = Rating.find(:all, :conditions => {:location_id => self.id, :user_id => user_id})
    if (rating.length > 0)
      return true
    else
      return false
    end
  end
end
