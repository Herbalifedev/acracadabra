# Copyright (c) 2012 Livefront, Inc.
# See the file license.txt for copying permission.

require 'spec_helper'

describe ReportsController do

  context 'given a report' do

    before do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{Rails.configuration.http_basic_auth_name}:#{Rails.configuration.http_basic_auth_password}")
      #post :create, ANDROID_VERSION: "2.1", APP_PACKAGE: "com.drivescribe"
      post 'create', {report: {PHONE_MODEL: 'rspec'}}, :format => 'json'
    end

    it 'responds with successful HTTP status' do
      response.status.should eq(201)
    end

  end

  context 'GET charts' do

    before do
      @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{Rails.configuration.http_basic_auth_name}:#{Rails.configuration.http_basic_auth_password}")
      get 'charts'
    end

    it 'returns http success' do
      response.status.should eq(200)
    end

  end

end
