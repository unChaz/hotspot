require 'spec_helper'

describe User do
  it "can be created" do
    User.new.should be_an_instance_of(User)
  end

  it "can be saved successfully" do
    User.create.should be_persisted
  end

  it "can be created from omniauth" do
    auth = { "provider" => "facebook",
       "uid" => 6,
       "info" => {
          "name"=> "Satoshi"
        }
    }
    user = User.create_with_omniauth auth
    user.name.should eq("Satoshi")
  end

  it "should be set to admin" do
    user = User.new
    user.role = 2
    user.is_admin?.should be_true
  end

  it "should be set to content manager" do
    user = User.new
    user.role = 2
    user.is_admin?.should be_true
  end

  it "should NOT be set to admin" do
    user = User.new
    user.is_admin?.should be_false
  end

  it "should set role" do
    user = User.new
    user.set_role 2
    user.role.should eq(2)
  end

  it "should set email" do
    user = User.new
    user = User.new
    user.set_email "asdf@asdf.com"
    user.email.should eq("asdf@asdf.com")
  end

end