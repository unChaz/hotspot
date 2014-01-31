class User < ActiveRecord::Base
  validates :uid, uniqueness: true
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      if user.name == "Chaz Ferguson" || user.name == "Joey Hale"
        user.role = 2
      end
    end
  end

  def is_admin?
    return self.role == 2
  end

  def is_content_manager?
    return self.role == 1
  end

  def set_role role
    self.role = role
    self.save
  end
end
