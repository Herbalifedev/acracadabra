require 'rails_helper'

describe "crash_data/edit" do
  before(:each) do
    @crash_data = assign(:crash_data, stub_model(CrashData))
  end

  xit "renders the edit crash_data form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => crash_data_path(@crash_data), :method => "post" do
    end
  end
end
