require 'spec_helper'

describe "crash_data/new" do
  before(:each) do
    assign(:crash_data, stub_model(CrashData).as_new_record)
  end

  xit "renders new crash_data form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => crash_data_path, :method => "post" do
    end
  end
end
