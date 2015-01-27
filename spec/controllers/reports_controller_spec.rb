# Copyright (c) 2012 Livefront, Inc.
# See the file license.txt for copying permission.

require 'spec_helper'

include AuthHelper

describe ReportsController do
  describe 'POST /reports (create)' do
    context 'when request does not have proper authentication' do
      it 'returns 401' do
        post 'create', { report: { PHONE_MODEL: 'rspec', REPORT_ID: '1-2-3' } }, :format => :json
        expect(response.status).to eq(401)
        expect(response.body).to include('Access denied')
      end
    end

    context 'when request has proper authentication' do
      before do
        env
      end

      context 'when valid request data is sent' do
        it 'returns 201' do
          post 'create', { report: { PHONE_MODEL: 'rspec', REPORT_ID: '1-2-3' } }, :format => :json, :accept => :json
          expect(response.status).to eq(201)
          expect(response.body.to_s.strip).to be_empty
        end
      end

      context 'when no data is sent' do
        it 'returns 499' do
          post 'create', :accept => :json, :format => :json
          expect(response.status).to eq(499)
          r = JSON.parse(response.body)
          expect(r['error']['message']).to include('Invalid params')
          expect(r['error']['code']).to eq(10001)
        end
      end

      context 'when invalid data is sent' do
        it 'returns 499' do
          post 'create', { report: { SOMEWHERE: 'over', THE: 'rainbow' } , accept: :json, format: :json }
          expect(response.status).to eq(499)
          r = JSON.parse(response.body)
          expect(r['error']['message']).to include('Invalid data')
          expect(r['error']['code']).to eq(10001)
        end
      end
    end
  end

  describe 'GET /reports (index)' do
    context 'when request does not have proper authentication' do
      it 'returns 401 status' do
        get 'index'
        expect(response.status).to eq(401)
        expect(response.body).to include('Access denied')
      end
    end

    context 'when request has proper authentication' do
      before do
        env
      end

      context 'when there is already a record created' do
        before do
          CrashData.create(phone_model: 'rspec', report_id: '1-2-3')
          get 'index', :accept => :json, :format => :json
        end

        it 'returns 200 status' do
          expect(response.status).to eq(200)
        end

        it 'returns the list of data with pages and total' do
          r = JSON.parse(response.body)
          expect(r['data']['total'].to_i).to eq(1)
          expect(r['data']['pages'].to_i).to eq(1)
          expect(r['data']['crash_data'].class).to eq(Array)
          expect(r['data']['crash_data'][0]['phone_model']).to eq('rspec')
          expect(r['data']['crash_data'][0]['report_id']).to eq('1-2-3')
        end
      end

      context 'when something is wrong while processing the request' do
        before do
          ReportQuery.stub(:new) { raise Exception, 'Simulated error' }
          get 'index', :format => :json, :accept => :json
        end

        it 'returns 499 status' do
          expect(response.status).to eq(499)
        end

        it 'returns an error code and message' do
          r = JSON.parse(response.body)
          expect(r['error']['message']).to eq('Simulated error')
          expect(r['error']['code']).to eq(10001)
        end
      end
    end

  end

  context 'GET /reports/charts' do
    context 'when request does not have proper authentication' do
      before do
        get 'charts'
      end

      it 'returns http not authentication' do
        expect(response.status).to eq(401)
        expect(response.body).to include('Access denied')
      end
    end

    context 'when request has proper authentication' do
      before do
        env
        get 'charts'
      end

      it 'returns http success' do
        expect(response).to be_success
      end
    end
  end

end
