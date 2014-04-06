require 'spec_helper'

describe SessionsController, "OmniAuth" do
  before do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "sets a session variable to the OmniAuth auth hash" do
    request.env["omniauth.auth"][:uid].should == '1234'
	request.env["omniauth.auth"][:info][:email].should == 'johndoe@email.com'
	request.env["omniauth.auth"][:info][:name].should == 'John Doe'
  end
end