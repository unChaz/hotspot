class Location < ActiveRecord::Base
  has_attached_file :image1, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image2, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image2, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image3, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image3, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image4, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image4, :content_type => /\Aimage\/.*\Z/
  
end
