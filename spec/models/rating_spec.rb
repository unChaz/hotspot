require 'spec_helper'

describe Rating do
  it "can be created" do
    Rating.new.should be_an_instance_of(Rating)
  end

  it "can be saved successfully" do
    Rating.create.should be_persisted
  end
end
