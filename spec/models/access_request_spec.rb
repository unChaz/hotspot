require 'spec_helper'

describe AccessRequest do
  it "can be created" do
    AccessRequest.new.should be_an_instance_of(AccessRequest)
  end

  it "can be saved successfully" do
    AccessRequest.create.should be_persisted
  end
end
