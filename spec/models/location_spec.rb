require 'spec_helper'

describe Location do
  it "can be created" do
    Location.new.should be_an_instance_of(Location)
  end

  it "can be saved successfully" do
    Location.create.should be_persisted
  end
end
