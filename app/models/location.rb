class Location < ActiveRecord::Base
  attr_accessor :image1_file_name, :image2_file_name, :image3_file_name, :image4_file_name
  attr_accessor :image1_content_type, :image2_content_type, :image3_content_type, :image4_content_type
  attr_accessor :image1_file_size, :image2_file_size, :image3_file_size, :image4_file_size
  attr_accessor :image1_updated_at, :image2_updated_at, :image3_updated_at, :image4_updated_at
  has_attached_file :image1, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image1, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image2, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image2, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image3, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image3, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image4, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image4, :content_type => /\Aimage\/.*\Z/
  
end
