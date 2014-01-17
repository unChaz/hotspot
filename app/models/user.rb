class User < ActiveRecord::Base
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
end
