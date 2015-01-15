require 'spec_helper'

describe "crash_data/show" do
  before(:each) do
    @crash_data = assign(:crash_data, stub_model(CrashData))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
