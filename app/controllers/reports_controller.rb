# Copyright (c) 2012 Livefront, Inc.
# See the file license.txt for copying permission.
require 'queries/ReportQuery'
require 'services/PaginationService'

class ReportsController < ApplicationController

  skip_before_filter :verify_authenticity_token

  http_basic_authenticate_with name: Rails.configuration.http_basic_auth_name, password: Rails.configuration.http_basic_auth_password

  def create
    begin
      #recipients = Rails.configuration.recipients
      #ReportMailer.report(recipients, params).deliver
      raise "Invalid params #{params[:report].inspect}" unless params[:report]
      processed = params[:report].inject({}) {|newhash, (k, v)| newhash[k.downcase.to_sym]=v; newhash}
      if processed
        @crash_data = CrashData.create!(processed)
      else
        raise "Invalid data. #{processed.inspect}"
      end
      head :created
    rescue Exception => @error
      respond_to do |format|
        format.json do
          render :json => { error: { message: @error.inspect, code: 10001 } }, :status => 499
        end
      end
    end
  end

  def index
    begin
      report_query = ReportQuery.new(params)
      p_service = PaginationService.new(report_query.results, params)
      respond_to do |format|
        format.json do
          render :json => { pages: p_service.pages, total: p_service.total, crash_data: p_service.results }
        end
      end
    rescue Exception => @error
      respond_to do |format|
        format.json do
          render :json => { error: { message: @error.inspect, code: 10001 } }, :status => 499
        end
      end
    end
  end

  def charts
    data = ReportQuery.new(params, false).results
    @per_phone_model = data.group(:phone_model).count unless data.empty?
    @per_date = data.group_by_day(:created_at).count unless data.empty?
    @per_month = data.group_by_month(:created_at).count unless data.empty?
    @per_hour = data.group_by_hour_of_day(:created_at).count unless data.empty?
  end

end
