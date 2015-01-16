require 'spec_helper'

include AuthHelper

describe "CrashData" do
  context "GET /crash_data" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #env = {"HTTP_AUTHORIZATION" => ActionController::HttpAuthentication::Basic.encode_credentials(Rails.configuration.http_basic_auth_name,Rails.configuration.http_basic_auth_password)}
      get 'crash_data', {}, env
      response.status.should be(200)
    end
  end
end
