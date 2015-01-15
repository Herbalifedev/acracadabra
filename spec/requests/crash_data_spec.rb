require 'spec_helper'

describe "CrashData" do
  describe "GET /crash_data" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get crash_data_path
      response.status.should be(200)
    end
  end
end
