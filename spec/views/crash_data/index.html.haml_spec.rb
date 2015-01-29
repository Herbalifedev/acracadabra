require 'rails_helper'

describe "crash_data/index" do
  before(:each) do
    assign(:crash_data, [
      stub_model(CrashData),
      stub_model(CrashData)
    ])
  end

  xit "renders a list of crash_data" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
