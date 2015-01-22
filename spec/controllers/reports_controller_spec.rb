# Copyright (c) 2012 Livefront, Inc.
# See the file license.txt for copying permission.

require 'spec_helper'

describe ReportsController do
  before(:each) do
    @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{Rails.configuration.http_basic_auth_name}:#{Rails.configuration.http_basic_auth_password}")
  end

  describe 'POST /reports (create)' do
    context 'when request has proper authentiation' do
      it 'returns 201' do
        post 'create', { report: { PHONE_MODEL: 'rspec', REPORT_ID: '1-2-3' } }, :format => :json
        expect(response.status).to eq(201)
      end
    end
  end

  describe 'GET /reports (index)' do
    context 'when request has proper authentication' do
      before do
        post 'create', { report: { PHONE_MODEL: 'rspec', REPORT_ID: '1-2-3' } }, :format => :json
        @request.env["HTTP_ACCEPT"] = 'application/json'
        get 'index', {}, format: :json
      end

      it 'returns 200 status' do
        expect(response.status).to eq(200)
      end

      it 'returns the list of data' do
        r = JSON.parse(response.body)
        expect(r['data']['total'].to_i).to eq(1)
        expect(r['data']['pages'].to_i).to eq(1)
      end
    end

    context 'when request does not have proper authentication' do
      it 'returns 401 status' do
        @request.env["HTTP_AUTHORIZATION"] = ''
        get 'index'
        expect(response.status).to eq(401)
      end
    end
  end

  context 'GET charts' do
    before do
      get 'charts'
    end

    it 'returns http success' do
      response.status.should eq(200)
    end
  end

end
